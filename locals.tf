/*
 * Configuration file with locals.
 */

locals {
  prefix = "LCloud"

  api_list = [
    "cloudresourcemanager.googleapis.com"
  ]

  _audit_members = flatten([
    for am in var.audit_members : [
      for ar, _ in local.permissions_audit : {
        principal = am
        role_name = ar
        role_id   = "roles/${lower(local.prefix)}Audit${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  _audit_members_custom = flatten([
    for am in var.audit_members : [
      for ar in var.audit_additional_roles : {
        principal = am
        role_name = ar.name
        role_id   = ar.name
        type      = "additional"
        condition = lookup(ar, "condition", [])
      }
    ]
  ])
  audit_members = concat(
    local._audit_members,
    local._audit_members_custom
  )

  _noc_members = flatten([
    for am in var.noc_members : [
      for ar, _ in local.permissions_noc : {
        principal = am
        role_name = ar
        role_id   = "roles/${lower(local.prefix)}Noc${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  _noc_members_custom = flatten([
    for am in var.noc_members : [
      for ar in var.noc_additional_roles : {
        principal = am
        role_name = ar.name
        role_id   = ar.name
        type      = "additional"
        condition = lookup(ar, "condition", [])
      }
    ]
  ])
  noc_members = concat(
    local._noc_members,
    local._noc_members_custom
  )

  _admin_members = flatten([
    for am in var.admin_members : [
      for ar, _ in local.permissions_admin : {
        principal = am
        role_name = ar
        role_id   = "roles/${lower(local.prefix)}Admin${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  _admin_members_custom = flatten([
    for am in var.admin_members : [
      for ar in var.admin_additional_roles : {
        principal = am
        role_name = ar.name
        role_id   = ar.name
        type      = "additional"
        condition = lookup(ar, "condition", [])
      }
    ]
  ])
  admin_members = concat(
    local._admin_members,
    local._admin_members_custom
  )

  _kernel_members = flatten([
    for am in var.kernel_members : [
      for ar, _ in local.permissions_kernel : {
        principal = am
        role_name = ar
        role_id   = "roles/${lower(local.prefix)}Kernel${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  _kernel_members_custom = flatten([
    for am in var.kernel_members : [
      for ar in var.kernel_additional_roles : {
        principal = am
        role_name = ar.name
        role_id   = ar.name
        type      = "additional"
        condition = lookup(ar, "condition", [])
      }
    ]
  ])
  kernel_members = concat(
    local._kernel_members,
    local._kernel_members_custom
  )
}
