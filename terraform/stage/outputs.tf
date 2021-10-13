output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}

#output "external_ip_address_app" {
#  value = [for app_inst in yandex_compute_instance.app : "${app_inst.network_interface.0.nat_ip_address}"]
#yandex_compute_instance.app.*...
#value = ["${yandex_compute_instance.app00.network_interface.0.nat_ip_address}", "${ yandex_compute_instance.app01.network_interface.0.nat_ip_address}"]
#}
#output "external_lb_ip_address_app" {
#value = "${yandex_lb_network_load_balancer.reddit_lb_host.listener[*].external_address_spec[*].address}" #.internal_address_spec.address
#value = tolist(tolist(yandex_lb_network_load_balancer.reddit_lb_host.listener)[0].external_address_spec)[0].address
#}
