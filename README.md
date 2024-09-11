# terraform-module-template

Module description goes here

## Prerequisites

TBD

## Important Notes

TBD

## Usage

### Module

To use the module, please see the example below:

```terraform
## TBD
```

### Terraform

Execution:

```bash
# Initialize Terraform. It’s going to download code for a provider(aws, gcp and azure) that we will use
terraform init

# Validate the syntax
terraform validate

# Terraform Format
terraform fmt

# Terraform Dry-Run. This command will tell what terraform does before making any changes.
#     1: (+ sign): Resource going to be created
#     2: (- sign): Resource going to be deleted
#     3: (~ sign): Resource going to be modified
terraform plan

# Create the resources. To apply the changes, run terraform apply command
terraform apply

# Destroy the resources
terraform destroy
```

## Module Documentation

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.1.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.1.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [google_artifact_registry_repository.repository](https://registry.terraform.io/providers/hashicorp/google/6.1.0/docs/resources/artifact_registry_repository) | resource |
| [google_kms_crypto_key.my_crypto_key](https://registry.terraform.io/providers/hashicorp/google/6.1.0/docs/data-sources/kms_crypto_key) | data source |
| [google_kms_key_ring.my_key_ring](https://registry.terraform.io/providers/hashicorp/google/6.1.0/docs/data-sources/kms_key_ring) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_timeout"></a> [create\_timeout](#input\_create\_timeout) | (Optional) Creation Timeout of Resource | `number` | `20` | no |
| <a name="input_crypto_key"></a> [crypto\_key](#input\_crypto\_key) | (Required) The name of the crypto key to use. | `string` | n/a | yes |
| <a name="input_delete_timeout"></a> [delete\_timeout](#input\_delete\_timeout) | (Optional) Delete Timeout of Resource | `number` | `20` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) The user-provided description of the repository. | `string` | `""` | no |
| <a name="input_docker_config"></a> [docker\_config](#input\_docker\_config) | (Optional) This contains repository level configuration for the repositories of format type of Docker. Allows setting immutable\_tags. | `map(string)` | `{}` | no |
| <a name="input_format"></a> [format](#input\_format) | (Required) The format of packages that are stored in the repository. Currently, the possible allowed value for the Format of the Artifact Registry Repository is: DOCKER. | `string` | `"DOCKER"` | no |
| <a name="input_key_ring_name"></a> [key\_ring\_name](#input\_key\_ring\_name) | (Optional) The name of the key ring to use. If blank, name will be inferred. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | (Required) A set of additional key/value label pairs to assign to the bucket. This is usually inherited from the Mandatory Labels Module via the format: "module.mandatory\_labels.module". | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The name of the location this repository is located in. | `string` | n/a | yes |
| <a name="input_mode"></a> [mode](#input\_mode) | (Optional) The mode configures the repository to serve artifacts from different sources. Default value is STANDARD\_REPOSITORY. Currently, the possible allowed values for the Mode of the Artifact Registry Repository is: STANDARD\_REPOSITORY. | `string` | `"STANDARD_REPOSITORY"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (Optional) The ID of the project in which the resource belongs. If it is not provided, the project ID listed in the provider is used. | `string` | `null` | no |
| <a name="input_repository_id"></a> [repository\_id](#input\_repository\_id) | (Required) The last part of the repository name | `string` | n/a | yes |
| <a name="input_update_timeout"></a> [update\_timeout](#input\_update\_timeout) | (Optional) Update Timeout of Resource | `number` | `20` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_create_time"></a> [create\_time](#output\_create\_time) | The time when the repository was created. |
| <a name="output_id"></a> [id](#output\_id) | An identifier for the resource with format projects/{{project}}/locations/{{location}}/repositories/{{repository\_id}}. |
| <a name="output_name"></a> [name](#output\_name) | The name of the repository, for example: "repo1". |
| <a name="output_update_time"></a> [update\_time](#output\_update\_time) | The time when the repository was last updated. |
<!-- END_TF_DOCS -->

## Standard Module Repository Docs

> [!IMPORTANT]  
> This section should be left in each repo to provide the necessary instructions on how to interact with it.

<details>
<summary>Standard Terraform Module Docs</summary>

---

This repository was bootstrapped via Terraform module template. That means it is preconfigured for certain workflows.

This repo includes the following built-in workflows:

- Linting of:
  - YAML
  - Github Actions
  - Terraform HCL
- Checkov to check for baseline compliance of HCL code
- Dependabot for Github Actions
- Semantic Versioning of releases
  - PRs are checked to ensure their name matches Conventional Commit style
- Run Terraform Test on PRs and Releases
- Push Module to HCP/TFE after Release

### Github PR Rules

You should configure the repository to require certain checks to avoid merging in non-compliant code.

### Semantic Versioning

> [!IMPORTANT]  
> **You must use `squash` commits for PRs in order for this workflow to function properly. You cannot use merge commits, you must use the name of the PR as the commit message.**

In order to promote changes to this repository, you must understand Conventional Commit style commit messages. These types of commit messages allow code reviewers to influence the versioning of the package in an accessible way.

_Conventional Commit messages **must** be made upon merging in a PR, which in turn will influence the next version number of the release._

| Commit Prefix | Commit Message                   | SemVer Output                           |
| ------------- | -------------------------------- | --------------------------------------- |
| `docs`        | `docs: update readme`            | Increment SemVer **patch** version by 1 |
| `fix`         | `fix: add output property`       | Increment SemVer **patch** version by 1 |
| `ci`          | `ci: updated ci scripts`         | Increment SemVer **patch** version by 1 |
| `feat`        | `feat: add CMEK to resource`     | Increment SemVer **minor** version by 1 |
| `major`       | `major: rework module structure` | Increment SemVer **major** version by 1 |

- [More information about Conventional Commits can be found here.](https://www.conventionalcommits.org/en/v1.0.0/#summary)
- [PR names are checked with the following Github Action](https://github.com/amannn/action-semantic-pull-request)
- The [detailed SemVer specification can be found here](https://semver.org/), but simply following the rules above is sufficient to produce proper module versioning. It is not necessary to use SemVer commits during the normal development cycle, it is only necessary during merges.

### Push Terraform Module Action

> You _must_ configure the Github Action correctly in order to push modules to HCP/TFE, or hook-up TFE/HCP tag-based modules. If you are using the Tag-based workflow, you don't need to use a separate action to push modules.

The `.github/workflows/release.yml` file has an action for pushing modules to HCP/TFE. This needs to be altered to match your server, as well as the module.

See documentation for [bruceharrison1984/terraform-push-module](https://github.com/bruceharrison1984/terraform-push-module) on how to configure the action for pushing to TFE/HCP.

Module version numbers are derived from previous versions and Conventional Commit messages.

### Auto-Documentation

Module documentation will automatically be completed upon creating a PR. You do not need to fill out the [Module Documentation](#module-documentation) section by hand. trigger

</details>
