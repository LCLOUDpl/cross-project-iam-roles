/*
 * https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_custom_role
 * https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
 */

# IAM Bot Permissions
resource "google_project_iam_member" "iam_bot" {
  for_each = var.iam_bot_roles != "" ? toset(var.iam_bot_roles) : []

  project = data.google_project.project.project_id
  role    = each.key
  member  = var.iam_bot_sa
}

# Audit Role
resource "google_project_iam_custom_role" "audit" {
  for_each = local.permissions_audit

  role_id = "${lower(local.prefix)}Audit${title(each.key)}"
  title   = "${local.prefix} Audit ${title(each.key)}"

  description = each.value.description
  permissions = each.value.permissions

  stage = "GA"
}

resource "google_project_iam_member" "audit" {
  for_each = { for am in local.audit_members : "${am.principal}:${am.role}" => am }

  project = data.google_project.project.project_id
  role    = each.value.type == "custom" ? google_project_iam_custom_role.audit[each.value.role].id : each.value.role
  member  = each.value.principal
}

# NOC Role
resource "google_project_iam_custom_role" "noc" {
  for_each = local.permissions_noc

  role_id = "${lower(local.prefix)}Noc${title(each.key)}"
  title   = "${local.prefix} NOC ${title(each.key)}"

  description = each.value.description
  permissions = each.value.permissions

  stage = "GA"
}

resource "google_project_iam_member" "noc" {
  for_each = { for am in local.noc_members : "${am.principal}:${am.role}" => am }

  project = data.google_project.project.project_id
  role    = each.value.type == "custom" ? google_project_iam_custom_role.noc[each.value.role].id : each.value.role
  member  = each.value.principal
}

# Admin Role
resource "google_project_iam_custom_role" "admin" {
  for_each = local.permissions_admin

  role_id = "${lower(local.prefix)}Admin${title(each.key)}"
  title   = "${local.prefix} Admin ${title(each.key)}"

  description = each.value.description
  permissions = each.value.permissions

  stage = "GA"
}

resource "google_project_iam_member" "admin" {
  for_each = { for am in local.admin_members : "${am.principal}:${am.role}" => am }

  project = data.google_project.project.project_id
  role    = each.value.type == "custom" ? google_project_iam_custom_role.admin[each.value.role].id : each.value.role
  member  = each.value.principal
}

# Kernel Role
resource "google_project_iam_custom_role" "kernel" {
  for_each = local.permissions_kernel

  role_id = "${lower(local.prefix)}Kernel${title(each.key)}"
  title   = "${local.prefix} Kernel ${title(each.key)}"

  description = each.value.description
  permissions = each.value.permissions

  stage = "GA"
}

resource "google_project_iam_member" "kernel" {
  for_each = { for am in local.kernel_members : "${am.principal}:${am.role}" => am }

  project = data.google_project.project.project_id
  role    = each.value.type == "custom" ? google_project_iam_custom_role.kernel[each.value.role].id : each.value.role
  member  = each.value.principal
}
