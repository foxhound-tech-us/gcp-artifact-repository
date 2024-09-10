variable "location" {
  type = string
}

variable "crypto_key" {
  type = string
}

variable "project_id" {
  type = string
}

## key_rings cannot be deleted, so we'll have to use a stationary one named 'tf-integration-test'
## this is to prevent creating a new key_ring for each test.
data "google_kms_key_ring" "setup" {
  name     = "tf-integration-test"
  location = var.location
  project  = var.project_id
}

## create a temp key for testing

resource "google_kms_crypto_key" "setup" {
  name     = var.crypto_key
  key_ring = data.google_kms_key_ring.setup.id
  #checkov:skip=CKV_GCP_82:Test keys are allowed to be deleted
  #checkov:skip=CKV_GCP_43:Test keys don't need to be rotated
}

output "test_key_name" {
  value = google_kms_crypto_key.setup.name
}
