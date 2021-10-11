resource "yandex_compute_instance" "app" {

  #name = "reddit-app${count.index}"
  name  = "reddit-app"
  #count = var.count_of_inst
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
    subnet_id = var.subnet_id    #yandex_vpc_subnet.app-subnet.id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key)
  }

  provisioner "file" {
    source      = "../files/puma.service"
    destination = "/tmp/puma.service"

  }
  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]

    command = <<-EOF
    sleep 30
    EOF
  }
  provisioner "remote-exec" {
    script = "../files/deploy.sh"
  }

}
