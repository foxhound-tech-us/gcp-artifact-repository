provider "google" {}

run "module_test" {
  command = apply

  variables {
    project_id    = "test-proj"
    crypto_key    = "test-key"
    location      = "test-location"
    repository_id = "my-artifact-repository-${split("-", uuid())[0]}"
  }

  assert {
    condition     = output.name != null
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
