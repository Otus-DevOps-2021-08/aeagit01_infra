variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable "private_key" {
  description = "path to private key"
}
variable "count_of_inst" {
  default = 1
}
variable "db_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable "subnet_id" {
  description = "Subnet"
}
