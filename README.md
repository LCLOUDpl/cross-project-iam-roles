# Cross-Project (GCP) IAM Roles

Basic Terraform to configure LCloud's IAM Roles for the Google Cloud Platfrorm (GCP) project.


## Usage

```hcl
module "lcloud_roles" {
  source = "git::https://github.com/LCLOUDpl/cross-project-iam-roles.git?ref=v1.1"

  # disable iam bot
  iam_bot_sa = ""

  audit_members = [
    "group:some-group@lcloud.pl",
    "user:xxx.yyy@lcloud.pl"
  ]
  audit_additional_roles = [
    { name = "roles/cloudsql.viewer" },
    {
      name = "roles/container.clusterViewer"
      condition = [
        {
          title = "limitedAccess"
          description = "Access only Dev resources"
          expression = "resource.name.startsWith(\"dev\")"
        }
      ]
    },
    { name = "roles/container.viewer" },
    { name = "roles/logging.viewer" }
  ]

  noc_members = []
  admin_members = []
  kernel_members = []
}
```


## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| google | >= 6.12.0 |


## Providers

| Name | Version |
|------|---------|
| google | >= 6.12.0 |


## Modules

No modules.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `audit_members` | List of members for which Audit (read-only) permissions will be assigned. | `list(string)` | `["group:lcloud-gcp-audit@lcloud.pl"]` | no |
| `audit_additional_roles` | List of additional permissions which will be assigned to audit_members. | <pre>list(object({&#13;  name      = string&#13;  condition = optional(list(object({&#13;    title       = string&#13;    description = optional(string)&#13;    expression  = string&#13;  })), [])&#13;}))</pre> | `[]` | no |
| `noc_members` | List of members for which NOC (read-only) permissions will be assigned. | `list(string)` | `["group:lcloud-gcp-noc@lcloud.pl"]` | no |
| `noc_additional_roles` | List of additional permissions which will be assigned to noc_members. | <pre>list(object({&#13;  name      = string&#13;  condition = optional(list(object({&#13;    title       = string&#13;    description = optional(string)&#13;    expression  = string&#13;  })), [])&#13;}))</pre> | `[{ name = "roles/cloudsql.admin" }, { name = "roles/compute.admin" }, { name = "roles/compute.loadBalancerAdmin" }, { name = "roles/container.developer" }, { name = "roles/iap.tunnelResourceAccessor" }, { name = "roles/logging.admin" }, { name = "roles/monitoring.admin" }, { name = "roles/storage.objectAdmin" }]` | no |
| `admin_members` | List of members for which admin permissions will be assigned. | `list(string)` | `["group:lcloud-gcp-admin@lcloud.pl"]` | no |
| `admin_additional_roles` | List of additional permissions which will be assigned to admin_members. | <pre>list(object({&#13;  name      = string&#13;  condition = optional(list(object({&#13;    title       = string&#13;    description = optional(string)&#13;    expression  = string&#13;  })), [])&#13;}))</pre> | `[{ name = "roles/compute.networkAdmin" }, { name = "roles/compute.storageAdmin" }, { name = "roles/container.admin" }, { name = "roles/iam.serviceAccountTokenCreator" }, { name = "roles/secretmanager.secretVersionManager" }, { name = "roles/storage.admin" }]` | no |
| `kernel_members` | List of members for which Kernel permissions will be assigned. | <pre>list(object({&#13;  name      = string&#13;  condition = optional(list(object({&#13;    title       = string&#13;    description = optional(string)&#13;    expression  = string&#13;  })), [])&#13;}))</pre> | `["group:lcloud-gcp-kernel@lcloud.pl"]` | no |
| `kernel_additional_roles` | List of additional permissions which will be assigned to kernel_members. | `list(string)` | `[]` | no |
| `iam_bot_sa` | Email of IAM Bot Service Account managing granted permissions. | `string` | `serviceAccount:lcloud-iam-bot@lcloud-iam-bot.iam.gserviceaccount.com` | no |
| `iam_bot_roles` | List of roles granted to the IAM bot. | <pre>list(object({&#13;  name      = string&#13;  condition = optional(list(object({&#13;    title       = string&#13;    description = optional(string)&#13;    expression  = string&#13;  })), [])&#13;}))</pre> | `[{ name = "roles/resourcemanager.projectIamAdmin" },]` | no |


## Outputs

| Name | Description |
|------|-------------|
| `audit_members` | List of Audit members and assigned permissions |
| `noc_members` | List of NOC members and assigned permissions |
| `admin_members` | List of Admin members and assigned permissions |
| `kernel_members` | List of Kernel members and assigned permissions |
