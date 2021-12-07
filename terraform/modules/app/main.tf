terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.35"
    }
  }
}
resource "yandex_compute_instance" "app" {
  #count = var.count_of_inst
  #name = "reddit-app${count.index}"
  name = "reddit-app"

  labels = {
    tags = "reddit-app"
  }

  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.app_disk_image
    }
  }
  network_interface {
    subnet_id = var.subnet_id #yandex_vpc_subnet.app-subnet.id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
resource "null_resource" "app" {
  count = var.puma_deploy ? 1 : 0
  connection {
    type  = "ssh"
    host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key)
  }

  provisioner "file" {
    source      = "${path.module}/files/puma.service"
    destination = "/tmp/puma.service"

  }
  provisioner "remote-exec" {
    inline = [
      "echo 'DATABASE_URL=${var.db_internal_ip}:${var.database_port}'>>/tmp/app.env && sleep 30"
    ]
  }
  provisioner "remote-exec" {
    script = "${path.module}/files/deploy.sh"
  }
}
