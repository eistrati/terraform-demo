#!/usr/bin/env bash

ensure_required_deps() {
    echo "Setup PATH .local/bin"
    export PATH=$PATH:$HOME/.local/bin

    echo "Install npm libraries"
    NPM_BIN=`which npm`
    REQUIRED_DEPS=(
        recink
        recink-terraform
        recink-comment
        sandboxed-module
        testcafe
        testcafe-browser-tools
    );

    for DEP in ${REQUIRED_DEPS[@]}; do
        if [ ! -d "$(${NPM_BIN} root -g)/${DEP}" ]; then
            echo "Installing missing ${DEP}"
            ${NPM_BIN} install -g ${DEP} || (echo "Failed to install ${DEP}" && exit 1)
        fi
    done
}

setup_npm() {
    echo "Setup node package manager"
    npm config set depth 0
    npm link aws-sdk
}

setup_git() {
    echo "Setup git client"
    git config user.name "Jenkins CI"
    git config user.email "hello@adtechmedia.io"
    git config --add core.longpaths true
}

setup_testcafe() {
    echo "Fix npm testcafe-browser-tools dependency"
    npm install --prefix $(npm root -g)/recink testcafe-browser-tools > /dev/null
}

setup_headless() {
    echo "Prepare Xvfb and fluxbox for headless browser mode"
    export DISPLAY=':99.0'
    Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &
    fluxbox > /dev/null 2>&1 &
    sleep 5s
}

setup_vault() {
    echo "Setup Vault"
    curl -s https://releases.hashicorp.com/vault/0.9.0/vault_0.9.0_linux_amd64.zip -o vault.zip
    unzip vault.zip
    ./vault server -dev & #> /dev/null 2>&1 < /dev/null &

    echo "Sleep 15 sec to give Vault time to start"
    sleep 15s

    export VAULT_ADDR='http://127.0.0.1:8200'

    echo "Writing test credentials to vault"
    ./vault write secret/db_creds database_user=root database_password=r00t\!r00t
}

ensure_required_deps
setup_npm
setup_git
setup_testcafe
#setup_headless
#setup_vault