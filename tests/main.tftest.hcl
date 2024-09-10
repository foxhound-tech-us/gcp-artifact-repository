provider "google" {}

variables {
  crypto_key    = "test-key-${split("-", uuid())[0]}"
  location      = "us-west1"
  repository_id = "my-artifact-repository-${split("-", uuid())[0]}"
}

run "setup" {
  ## create prerequisite resources
  module {
    source = "./setup"
  }
}

run "module_test" {
  command = apply

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
