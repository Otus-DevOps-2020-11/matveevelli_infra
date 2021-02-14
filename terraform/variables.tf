variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key_path {
  description = "C:/Users/matveev.al/.ssh/ubuntu.pub"
}
variable private_key_path {
  description = "C:/Users/matveev.al/.ssh/ubuntu"
}

variable image_id {
  description = "Disk image"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "D:/matveev/otus/devops/terraform/key.json"
}

variable count_app {
  description = "count"
  default = 1
}
