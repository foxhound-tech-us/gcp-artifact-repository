################################################################################
# Terraform Configuration
################################################################################
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.1.0"
    }
  }
  required_version = "~>1.9"
}

################################################################################
# Provider Configuration
################################################################################

# add explicit provider configuration blocks here
