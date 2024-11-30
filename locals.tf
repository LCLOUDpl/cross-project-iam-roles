/*
 * Configuration file with locals.
 */

locals {
  prefix = "LCloud"

  api_list = [
    "cloudresourcemanager.googleapis.com"
  ]

  # Audit member<=>role map
  _audit_members_custom = flatten([
    for am in var.audit_members : [
      for ar, _ in local.permissions_audit : {
        principal = am
        role_name = ar
        role_id   = "roles/${lower(local.prefix)}Audit${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  _audit_members_additional = flatten([
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
  ## Final Audit member<=>role list
  audit_members = concat(
    local._audit_members_custom,
    local._audit_members_additional
  )

  # NOC member<=>role map
  _noc_members_custom_audit = flatten([
    for am in var.noc_members : [
      for ar, _ in local.permissions_audit : {
        principal = am
        role_name = "noc${title(ar)}"
        role_id   = "roles/${lower(local.prefix)}Audit${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  _noc_members_custom = flatten([
    for am in var.noc_members : [
      for ar, _ in local.permissions_noc : {
        principal = am
        role_name = ar
        role_id   = "roles/${lower(local.prefix)}Noc${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  ## Complete the list of additional roles with additional Audit roles
  _nocaudit_additional_roles = flatten([
    for role in concat(var.audit_additional_roles, var.noc_additional_roles) :
    {
      name = role.name
      condition = [
        for r in concat(var.audit_additional_roles, var.noc_additional_roles) :
        r.condition if r.name == role.name
      ]
    }
  ])
  _unique_nocaudit_additional_roles = distinct([
    for role in local._nocaudit_additional_roles :
    {
      name = role.name
      condition = flatten(role.condition)
    }
  ])
  _noc_members_additional = flatten([
    for am in var.noc_members : [
      for ar in local._unique_nocaudit_additional_roles : {
        principal = am
        role_name = ar.name
        role_id   = ar.name
        type      = "additional"
        condition = lookup(ar, "condition", [])
      }
    ]
  ])
  ## Final NOC member<=>role list
  noc_members = concat(
    local._noc_members_custom_audit,
    local._noc_members_custom,
    local._noc_members_additional
  )

  # Admin member<=>role map
  _admin_members_custom_audit = flatten([
    for am in var.admin_members : [
      for ar, _ in local.permissions_audit : {
        principal = am
        role_name = "admin${title(ar)}"
        role_id   = "roles/${lower(local.prefix)}Audit${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  _admin_members_custom_noc = flatten([
    for am in var.admin_members : [
      for ar, _ in local.permissions_noc : {
        principal = am
        role_name = "admin${title(ar)}"
        role_id   = "roles/${lower(local.prefix)}Noc${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  _admin_members_custom = flatten([
    for am in var.admin_members : [
      for ar, _ in local.permissions_admin : {
        principal = am
        role_name = ar
        role_id   = "roles/${lower(local.prefix)}Admin${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  ## Complete the list of additional roles with additional Audit and NOC roles
  _adminnocaudit_additional_roles = flatten([
    for role in concat(local._unique_nocaudit_additional_roles, var.admin_additional_roles) :
    {
      name = role.name
      condition = [
        for r in concat(local._unique_nocaudit_additional_roles, var.admin_additional_roles) :
        r.condition if r.name == role.name
      ]
    }
  ])
  _unique_adminnocaudit_additional_roles = distinct([
    for role in local._adminnocaudit_additional_roles :
    {
      name = role.name
      condition = flatten(role.condition)
    }
  ])
  _admin_members_additional = flatten([
    for am in var.admin_members : [
      for ar in local._unique_adminnocaudit_additional_roles : {
        principal = am
        role_name = ar.name
        role_id   = ar.name
        type      = "additional"
        condition = lookup(ar, "condition", [])
      }
    ]
  ])
  ## Final Admin member<=>role list
  admin_members = concat(
    local._admin_members_custom_audit,
    local._admin_members_custom_noc,
    local._admin_members_custom,
    local._admin_members_additional
  )

  # Kernel member<=>role map
  _kernel_members_custom_audit = flatten([
    for am in var.kernel_members : [
      for ar, _ in local.permissions_audit : {
        principal = am
        role_name = "kernel${title(ar)}"
        role_id   = "roles/${lower(local.prefix)}Audit${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  _kernel_members_custom_noc = flatten([
    for am in var.kernel_members : [
      for ar, _ in local.permissions_noc : {
        principal = am
        role_name = "kernel${title(ar)}"
        role_id   = "roles/${lower(local.prefix)}Noc${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  _kernel_members_custom_admin = flatten([
    for am in var.kernel_members : [
      for ar, _ in local.permissions_admin : {
        principal = am
        role_name = "kernel${title(ar)}"
        role_id   = "roles/${lower(local.prefix)}Admin${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  _kernel_members_custom = flatten([
    for am in var.kernel_members : [
      for ar, _ in local.permissions_kernel : {
        principal = am
        role_name = ar
        role_id   = "roles/${lower(local.prefix)}Kernel${title(ar)}"
        type      = "custom"
      }
    ]
  ])
  ## Complete the list of additional roles with additional Audit, NOC and Admin roles
  _kerneladminnocaudit_additional_roles = flatten([
    for role in concat(local._unique_adminnocaudit_additional_roles, var.kernel_additional_roles) :
    {
      name = role.name
      condition = [
        for r in concat(local._unique_adminnocaudit_additional_roles, var.kernel_additional_roles) :
        r.condition if r.name == role.name
      ]
    }
  ])
  _unique_kerneladminnocaudit_additional_roles = distinct([
    for role in local._kerneladminnocaudit_additional_roles :
    {
      name = role.name
      condition = flatten(role.condition)
    }
  ])
  _kernel_members_additional = flatten([
    for am in var.kernel_members : [
      for ar in local._unique_kerneladminnocaudit_additional_roles : {
        principal = am
        role_name = ar.name
        role_id   = ar.name
        type      = "additional"
        condition = lookup(ar, "condition", [])
      }
    ]
  ])
  ## Final Kernel member<=>role list
  kernel_members = concat(
    local._kernel_members_custom_audit,
    local._kernel_members_custom_noc,
    local._kernel_members_custom_admin,
    local._kernel_members_custom,
    local._kernel_members_additional
  )
}
