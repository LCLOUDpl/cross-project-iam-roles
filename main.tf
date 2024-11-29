/*
 * https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_custom_role
 * https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
 */

resource "google_project_service" "this" {
  for_each = toset(local.api_list)

  project            = data.google_project.project.project_id
  service            = each.value
  disable_on_destroy = false
}

# IAM Bot Permissions
resource "google_project_iam_member" "iam_bot" {
  for_each = var.iam_bot_sa != "" ? { for r in var.iam_bot_roles : r.name => r } : tomap({})

  project = data.google_project.project.project_id
  role    = each.value.name
  member  = var.iam_bot_sa

  dynamic "condition" {
    for_each = lookup(each.value, "condition", [])
    content {
      title = condition.value["title"]
      description = lookup(condition.value, "description", null)
      expression = condition.value["expression"]
    }
  }
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
  for_each = { for am in local.audit_members : "${am.principal}:${am.role_name}" => am }

  project = data.google_project.project.project_id
  role    = each.value.type == "custom" ? "projects/${data.google_project.project.project_id}/${each.value.role_id}" : each.value.role_id
  member  = each.value.principal

  dynamic "condition" {
    for_each = lookup(each.value, "condition", [])
    content {
      title = condition.value["title"]
      description = lookup(condition.value, "description", null)
      expression = condition.value["expression"]
    }
  }

  depends_on = [google_project_iam_custom_role.audit]
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
  for_each = { for am in local.noc_members : "${am.principal}:${am.role_name}" => am }

  project = data.google_project.project.project_id
  role    = each.value.type == "custom" ? "projects/${data.google_project.project.project_id}/${each.value.role_id}" : each.value.role_id
  member  = each.value.principal

  dynamic "condition" {
    for_each = lookup(each.value, "condition", [])
    content {
      title = condition.value["title"]
      description = lookup(condition.value, "description", null)
      expression = condition.value["expression"]
    }
  }

  depends_on = [google_project_iam_custom_role.noc]
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
  for_each = { for am in local.admin_members : "${am.principal}:${am.role_name}" => am }

  project = data.google_project.project.project_id
  role    = each.value.type == "custom" ? "projects/${data.google_project.project.project_id}/${each.value.role_id}" : each.value.role_id
  member  = each.value.principal

  dynamic "condition" {
    for_each = lookup(each.value, "condition", [])
    content {
      title = condition.value["title"]
      description = lookup(condition.value, "description", null)
      expression = condition.value["expression"]
    }
  }

  depends_on = [google_project_iam_custom_role.admin]
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
  for_each = { for am in local.kernel_members : "${am.principal}:${am.role_name}" => am }

  project = data.google_project.project.project_id
  role    = each.value.type == "custom" ? "projects/${data.google_project.project.project_id}/${each.value.role_id}" : each.value.role_id
  member  = each.value.principal

  dynamic "condition" {
    for_each = lookup(each.value, "condition", [])
    content {
      title = condition.value["title"]
      description = lookup(condition.value, "description", null)
      expression = condition.value["expression"]
    }
  }

  depends_on = [google_project_iam_custom_role.kernel]
}
