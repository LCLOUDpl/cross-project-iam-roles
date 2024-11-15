/*
 * Configuration file with outputs.
 */

output "admin_members" {
  description = "List of Admin members and assigned permissions"
  value       = [
    for m in local.admin_members : {
      "${m.principal}" = ( m.type == "custom" ? google_project_iam_custom_role.admin[m.role].id : m.role )
    }
  ]
}

output "audit_members" {
  description = "List of Audit members and assigned permissions"
  value       = [
    for m in local.audit_members : {
      "${m.principal}" = ( m.type == "custom" ? google_project_iam_custom_role.audit[m.role].id : m.role )
    }
  ]
}

output "kernel_members" {
  description = "List of Kernel members and assigned permissions"
  value       = [
    for m in local.kernel_members : {
      "${m.principal}" = ( m.type == "custom" ? google_project_iam_custom_role.kernel[m.role].id : m.role )
    }
  ]
}

output "noc_members" {
  description = "List of NOC members and assigned permissions"
  value       = [
    for m in local.noc_members : {
      "${m.principal}" = ( m.type == "custom" ? google_project_iam_custom_role.noc[m.role].id : m.role )
    }
  ]
}
