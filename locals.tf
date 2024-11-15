/*
 * Configuration file with locals.
 */

locals {
  prefix = "LCloud"

  _audit_members = flatten([
    for am in var.audit_members : [
      for ar, _ in local.permissions_audit : {
        principal = am
        role      = ar
        type      = "custom"
      }
    ]
  ])
  _audit_members_custom = flatten([
    for am in var.audit_members : [
      for ar in var.audit_additional_roles : {
        principal = am
        role      = ar
        type      = "additional"
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
        role      = ar
        type      = "custom"
      }
    ]
  ])
  _noc_members_custom = flatten([
    for am in var.noc_members : [
      for ar in var.noc_additional_roles : {
        principal = am
        role      = ar
        type      = "additional"
      }
    ]
  ])
  noc_members = concat(
    local._noc_members,
    local._noc_members_custom
  )

  _admin_members = flatten([
    for am in var.admin_members : [
      for ar, _ in local.permissions_noc : {
        principal = am
        role      = ar
        type      = "custom"
      }
    ]
  ])
  _admin_members_custom = flatten([
    for am in var.admin_members : [
      for ar in var.admin_additional_roles : {
        principal = am
        role      = ar
        type      = "additional"
      }
    ]
  ])
  admin_members = concat(
    local._admin_members,
    local._admin_members_custom
  )

  _kernel_members = flatten([
    for am in var.kernel_members : [
      for ar, _ in local.permissions_noc : {
        principal = am
        role      = ar
        type      = "custom"
      }
    ]
  ])
  _kernel_members_custom = flatten([
    for am in var.kernel_members : [
      for ar in var.kernel_additional_roles : {
        principal = am
        role      = ar
        type      = "additional"
      }
    ]
  ])
  kernel_members = concat(
    local._kernel_members,
    local._kernel_members_custom
  )
}
