terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tf-state-bucked"
    region     = "us-east-1"
    key        = "terraform.tfstate"
    access_key = "1erLJfOM3qmcMCUIz2cu"
    secret_key = "90msHjn3Q3fAlyt0vDSttmo9GMV6v_LCfdJ3Tp1c"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
