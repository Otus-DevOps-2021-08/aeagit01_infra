resource "yandex_lb_target_group" "reddit_lb_group" {
  name = "reddit-lb-group"

  target {
    subnet_id = var.subnet_id
    address   = "${yandex_compute_instance.app00.network_interface.0.ip_address}"
  }

  target {
    subnet_id = var.subnet_id
    address   = "${yandex_compute_instance.app01.network_interface.0.ip_address}"
  }

  depends_on = [
    yandex_compute_instance.app00,
    yandex_compute_instance.app01
  ]
}

resource "yandex_lb_network_load_balancer" "reddit_lb_host" {
  name = "reddit-load-balancer"

  listener {
    name = "reddit-listener"
    port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.reddit_lb_group.id

    healthcheck {
      name = "http"
      http_options {
        port = 9292
        path = "/"
      }
    }
  }
  depends_on = [
    yandex_lb_target_group.reddit_lb_group
  ]
}
