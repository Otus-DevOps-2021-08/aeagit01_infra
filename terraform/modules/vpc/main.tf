resource "yandex_vpc_network" "app-network" {
  name = var.network-name
}
resource "yandex_vpc_subnet" "app-subnet" {
  name           = var.subnet-name
  zone           = var.zone
  network_id     = yandex_vpc_network.app-network.id
  v4_cidr_blocks = [var.subnet-addresses]
}
