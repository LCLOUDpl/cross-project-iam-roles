/*
 * Configuration file with outputs.
 */

output "admin_members" {
  description = "List of Admin members and assigned permissions"
  value       = [
    for m in local.admin_members : {
      "${m.principal}" = ( m.type == "custom" ? "projects/${data.google_project.project.project_id}/${m.role_id}" : m.role_id )
    }
  ]
}

output "audit_members" {
  description = "List of Audit members and assigned permissions"
  value       = [
    for m in local.audit_members : {
      "${m.principal}" = ( m.type == "custom" ? "projects/${data.google_project.project.project_id}/${m.role_id}" : m.role_id )
    }
  ]
}

output "kernel_members" {
  description = "List of Kernel members and assigned permissions"
  value       = [
    for m in local.kernel_members : {
      "${m.principal}" = ( m.type == "custom" ? "projects/${data.google_project.project.project_id}/${m.role_id}" : m.role_id )
    }
  ]
}

output "noc_members" {
  description = "List of NOC members and assigned permissions"
  value       = [
    for m in local.noc_members : {
      "${m.principal}" = ( m.type == "custom" ? "projects/${data.google_project.project.project_id}/${m.role_id}" : m.role_id )
    }
  ]
}
