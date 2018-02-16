provider "aws" {
  alias  = "account_00"
  profile  = "account_00"
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::600605919324:role/ClarivateCrossAccountRole"
    session_name = "600605919324"
  }
}

provider "aws" {
  alias  = "account_01"
  profile = "account_01"
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::490643292278:role/ClarivateCrossAccountRole"
    session_name = "490643292278"
  }
}

provider "aws" {
  alias  = "account_02"
  profile = "account_02"
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::492198229272:role/ClarivateCrossAccountRole"
    session_name = "492198229272"
  }
}