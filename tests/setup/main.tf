variable "location" {
  type = string
}

variable "crypto_key" {
  type = string
}

## key_rings cannot be deleted, so we'll have to use a stationary one named 'tf-integration-test'
## this is to prevent creating a new key_ring for each test
data "google_kms_key_ring" "setup" {
  name     = "tf-integration-test"
  location = var.location
}

## create a temp key for testing

resource "google_kms_crypto_key" "setup" {
  name     = var.crypto_key
  key_ring = google_kms_key_ring.setup.id
}
