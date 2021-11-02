terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tf-state-bucked"
    region     = "us-east-1"
    key        = "terraform.tfstate"
    access_key = "V4VkzGEiGfJcdMwnacrv"
    secret_key = "uwKOGZVrVyofMOkU1fcbbrPYkMvJYRyK04qMOfxQ"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
