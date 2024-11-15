# Cross-Project (GCP) IAM Roles

Basic Terraform to configure LCloud's IAM Roles for the Google Cloud Platfrorm (GCP) project.


## Usage

```hcl
module "lcloud_roles" {
  source = "git@git.lcloud.pl:mgmt/gcp-iam/cross-project-iam-roles.git"

  environment = "staging"
}
```


## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| google | >= 4.83.0 |


## Providers

| Name | Version |
|------|---------|
| google | >= 4.83.0 |


## Modules

No modules.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `audit_members` | List of members for which Audit (read-only) permissions will be assigned. | `list(string)` | `["group:lcloud-gcp-audit@lcloud.pl"]` | no |
| `audit_additional_roles` | List of additional permissions which will be assigned to audit_members. | `list(string)` | `[]` | no |
| `noc_members` | List of members for which NOC (read-only) permissions will be assigned. | `list(string)` | `["group:lcloud-gcp-noc@lcloud.pl"]` | no |
| `noc_additional_roles` | List of additional permissions which will be assigned to noc_members. | `list(string)` | `[]` | no |
| `admin_members` | List of members for which admin permissions will be assigned. | `list(string)` | `["group:lcloud-gcp-admin@lcloud.pl"]` | no |
| `admin_additional_roles` | List of additional permissions which will be assigned to admin_members. | `list(string)` | `[]` | no |
| `kernel_members` | List of members for which Kernel permissions will be assigned. | `list(string)` | `["group:lcloud-gcp-kernel@lcloud.pl"]` | no |
| `kernel_additional_roles` | List of additional permissions which will be assigned to kernel_members. | `list(string)` | `[]` | no |


## Outputs

| Name | Description |
|------|-------------|
| `audit_members` | List of Audit members and assigned permissions |
| `noc_members` | List of NOC members and assigned permissions |
| `admin_members` | List of Admin members and assigned permissions |
| `kernel_members` | List of Kernel members and assigned permissions |
