terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tf-state-bucked"
    region     = "us-east-1"
    key        = "terraform.tfstate"
    access_key = "l2UX6UejpgkmAzBX6ktU"
    secret_key = "oigLXiB6JR81ERqbjCf_0dXVDJgolXkqXuNxgj6e"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
