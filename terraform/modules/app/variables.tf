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
variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "db_internal_ip" {
  default     = "127.0.0.1"
  description = "internal IP of Database server"

}
variable "database_port" {
  default     = "27017"
  description = "Database server port"
}
variable "puma_deploy" {
  default     = true
  description = "variable for decided about deploy application"
}
