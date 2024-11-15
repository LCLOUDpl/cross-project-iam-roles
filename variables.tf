/*
 * Configuration file with variables.
 */

variable "admin_members" {
  description = "List of members for which admin permissions will be assigned."
  type        = list(string)
  default     = ["group:lcloud-gcp-admin@lcloud.pl"]
}

variable "admin_additional_roles" {
  description = "List of additional permissions which will be assigned to admin_members."
  type        = list(string)
  default     = []
}

variable "audit_members" {
  description = "List of members for which Audit (read-only) permissions will be assigned."
  type        = list(string)
  default     = ["group:lcloud-gcp-audit@lcloud.pl"]
}

variable "audit_additional_roles" {
  description = "List of additional permissions which will be assigned to audit_members."
  type        = list(string)
  default     = []
}

variable "kernel_members" {
  description = "List of members for which Kernel permissions will be assigned."
  type        = list(string)
  default     = ["group:lcloud-gcp-kernel@lcloud.pl"]
}

variable "kernel_additional_roles" {
  description = "List of additional permissions which will be assigned to kernel_members."
  type        = list(string)
  default     = []
}

variable "noc_members" {
  description = "List of members for which NOC (read-only) permissions will be assigned."
  type        = list(string)
  default     = ["group:lcloud-gcp-noc@lcloud.pl"]
}

variable "noc_additional_roles" {
  description = "List of additional permissions which will be assigned to noc_members."
  type        = list(string)
  default     = []
}
