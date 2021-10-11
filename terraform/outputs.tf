output "service_key_out" {
  value = yandex_storage_bucket.tf-state-bucked.access_key
}
output "service_key_secret" {
  value     = yandex_storage_bucket.tf-state-bucked.secret_key
  sensitive = true
}
