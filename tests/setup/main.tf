variable "location" {
  type = string
}

variable "crypto_key" {
  type = string
}

resource "google_kms_key_ring" "setup" {
  name     = "antm-default-keyring-${var.location}"
  location = "global"
}

resource "google_kms_crypto_key" "setup" {
  name            = var.crypto_key
  key_ring        = google_kms_key_ring.setup.id
  rotation_period = "7776000s"
}
