terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.1.0"
    }
  }
  required_version = "~>1.9"
}

provider "google" {}

variables {
  crypto_key    = "test-key-${split("-", uuid())[0]}"
  location      = "us-west1"
  repository_id = "my-artifact-repository-${split("-", uuid())[0]}"
  key_ring_name = "tf-integration-test"
}

run "setup" {
  ## create prerequisite resources
  module {
    source = "./tests/setup"
  }
}

run "module_test" {
  command = apply

  variables {
    crypto_key = run.setup.test_key_name
  }

  assert {
    condition     = output.name == var.repository_id
    error_message = "output.name does not match ${var.repository_id}"
  }

  assert {
    condition     = output.id != null
    error_message = "output.id value is null"
  }

  assert {
    condition     = output.create_time != null
    error_message = "output.create_time value is null"
  }

  assert {
    condition     = output.update_time != null
    error_message = "output.update_time value is null"
  }
}
