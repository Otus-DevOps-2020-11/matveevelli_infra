terraform {
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket = "terraforms3"
    region = "ru-central1-a"
    key = "./terraform.tfstate"
    access_key = "ajepejmqqe7g20rbk7ia"
    secret_key = "QgvjV27qQqqicZd9uxB-yDHvbETLhBlewg4OEBGf"

    skip_region_validation = true
    skip_credentials_validation = true
  }
}
