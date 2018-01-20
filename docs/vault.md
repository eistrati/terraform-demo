# Vault installation and configuration (PROD)


### Download vault, unzip and copy the binary file somewhere in the Linux $PATH
```bash
# curl https://releases.hashicorp.com/vault/0.9.0/vault_0.9.0_linux_amd64.zip -o vault_0.9.0_linux_amd64.zip

# unzip vault_0.9.0_linux_amd64.zip
# mv vault /usr/local/bin/
# mkdir -p /etc/vault/policies
```
### Edit the Vault configuration file: /etc/vault/vaultconfig.hcl adding the following information:

```json
storage "file" {
  path = "/etc/vault/vaultstorage"
}

listener "tcp" {
 address = "127.0.0.1:8200"
 tls_disable = 1
}
```

### Edit the file /etc/sysconfig/vault adding the following information:
```bash
ADDRESS='http://127.0.0.1:8200'
```

### Download init script to /etc/init.d/vault

```bash
#!/bin/sh
#
# vault - this script manages the vault server
#
# chkconfig:   345 96 04
# processname: vault

### BEGIN INIT INFO
# Provides:       vault
# Required-Start: $local_fs $network
# Required-Stop:  $local_fs $network
# Default-Start: 3 4 5
# Default-Stop:  0 1 2 6
# Short-Description: Manage the vault server
### END INIT INFO

# Source function library.
. /etc/rc.d/init.d/functions

# Source networking configuration.
. /etc/sysconfig/network

# Check that networking is up.
[ "$NETWORKING" = "no" ] && exit 0

exec="/usr/local/bin/vault"
prog=${exec##*/}

lockfile="/var/lock/subsys/$prog"
pidfile="/var/run/${prog}.pid"
logfile="/var/log/${prog}.log"
sysconfig="/etc/sysconfig/$prog"
confdir="/etc/${prog}"

[ -f $sysconfig ] && . $sysconfig

start() {
    [ -x $exec ] || exit 5
    [ -d $confdir ] || exit 6

    echo -n $"Starting $prog: "
    touch $logfile $pidfile
    daemon "{ $exec server -config=$confdir &>> $logfile & }; echo \$! >| $pidfile"

    RETVAL=$?
    if [ $RETVAL -eq 0 ]; then
        touch $lockfile
    fi
    echo
    return $RETVAL
}

stop() {
    echo -n $"Stopping $prog: "
    seal
    killproc -p $pidfile $exec 2>> $logfile
    RETVAL=$?
    [ $RETVAL -eq 0 ] && rm -f $lockfile
    echo
    return $RETVAL
}

restart() {
    echo -n $"Restarting $prog: "
    stop
    start
}

v_status() {
    $exec status --address=$ADDRESS
}

rh_status() {
    status $prog
}

rh_status_q() {
    rh_status >/dev/null 2>&1
}

#unseal() {
#    while :
#    do
#        ss -pl | fgrep "((\"$prog\"," > /dev/null
#        [ $? -eq 0 ] && break
#        sleep 0.1
#    done
#    for key in $KEYS; do $exec unseal $CERT $key >> $logfile ; done
#}

seal() {
    $exec seal --address=$ADDRESS >> $logfile
}

case "$1" in
    start)
        rh_status_q && exit 0
        $1
        ;;
    stop)
        rh_status_q || exit 0
        $1
        ;;
    restart)
        $1
        ;;
    status)
        rh_status || exit 0
        v_status
        ;;
    condrestart|try-restart)
        rh_status_q || exit 7
        restart
        ;;
#    unseal)
#        $1
#        ;;
    seal)
        $1
        ;;
    *)
        echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|seal}"
        exit 2
esac

exit $?
```

### Make the Vault init script executable and add it to system startup

```bash
# chmod 755 /etc/init/vault
# chkconfig --add vault
# chkconfig --level 35 vault on
```

### Running Vault for the first time

```bash
# /etc/init.d/vault start
# export VAULT_ADDR='http://127.0.0.1:8200'
# vault init
```

### At this state you will be presented with 5 __unseal keys__ and the initial __root token__

Copy the unseal keys and initial root token to a secure place. This is the only time these values are outputed.

> **Important:** If these are lost any data within the vault is lost forever.


### Unsealing the vault.

##### Everytime the vault is started it starts in `sealed mode`. That means it has access to the data but it can't decrypt it. The vault needs 3 of the 5 keys in order to be `unsealed`

Run the following 3 times, entering a different key each time
```bash
# vault unseal
```

> **Remember:** The vault has to be unsealed each time it is started

# Writing data into the vault

### Any operation on the vault requires you to be authenticated. Authentication is based on tokens. The initial root token can be used to generate aditional tokens

```bash
# vault auth

Token (will be hidden):
Successfully authenticated! You are now logged in.
token: 26fa2fe0-3162-8960-6352-40d1e0ab8d63
token_duration: 0
token_policies: [root]
```

The default Vault Key/Value store is mounted as "secret/" inside vault. It is here where data can be written.
Data is writeten into paths (subdirectories of the secret/ mount)

In the example below two key/value pairs are written into the path secret/db_creds. 

```bash
# vault write secret/db_creds database_user=root database_password=r00t\!P455word
```

> **! IMPORTANT** - Always escape special characters with backspace or the shell will interpret them

# Restricting access to the VAULT

The initial root token, as the name implies has unrestricted access on the Vault. This is good for administrative purposes but bad for security.
Any other applications operating on the Vault should be restricted to the operations and path required for their functionality.

This is done by creating policies. Policies are written in HCL or json. The below policy allows READ access to the "secret/db_creds" path.
! IMPORTANT - Policies have a default unseen DENY capability at their end. That means any other actions on any other paths are denied.

```json
path "secret/db_creds" {
  capabilities = ["read"]
}
```
Adding a policy to VAULT. Supposing the above file was called `db_creds.hcl` and resided in `/etc/vault/policies`, the following command would add
its contents to the Vault policy list in the path `sys/policy/db_creds_policy`

```bash
# vault write sys/policy/db_creds_policy policy=@/etc/vault/policies/read_db_creds
```

Now that the policy is created all that remains is to create a token which is assigned this policy: `db_creds_policy`

```bash
# vault token-create -display-name=terraform -policy="db_creds_policy" -metadata="app=terraform" -metadata="env=terraform-demo"
```

This command creates a new token which will be assigned only the db_creds_policy, effectively allowing only read-only access to the secret/db_creds path.
The token is also assigned a display name for easier identification and successive metadata which will show up in audits.

Terraform will read the environmental variable __VAULT_TOKEN__

```bash
# export VAULT_TOKEN=<your-token-here>
```
Alternatively this token to `~.vault-token` of the user running terraform. 

# Vault installation and configuration (DEV-TEST)
## `Vault ran in test mode does not require access tokens. The data is written only in memory and cleared each time vault is restarted`

### Download vault, unzip and run the binary file
```bash
# curl https://releases.hashicorp.com/vault/0.9.0/vault_0.9.0_linux_amd64.zip -o vault_0.9.0_linux_amd64.zip
# unzip vault_0.9.0_linux_amd64.zip
# ./vault server -dev 
```
In dev mode, Vault will remain in the foreground. To detach it and redirect stdoud and stderr to `/dev/null` run:

```bash
vault server -dev > /dev/null 2>&1 < /dev/null &
```

### Writing data to Vault
In the example below two key/value pairs are written into the path secret/db_creds. 

```bash
# vault write secret/db_creds database_user=root database_password=r00t\!P455word
```

> **! IMPORTANT** - Always escape special characters with backspace or the shell will interpret them

> **! REMEMBER** - Vault ran in dev does not store any information to disk.
