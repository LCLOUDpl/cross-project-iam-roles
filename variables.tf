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
  type        = list(object({
    name      = string
    condition = optional(list(object({
      title       = string
      description = optional(string)
      expression  = string
    })), [])
  }))
  default     = [
    { name = "roles/iam.serviceAccountTokenCreator" },
    { name = "roles/secretmanager.secretVersionManager" },
  ]
}

variable "audit_members" {
  description = "List of members for which Audit (read-only) permissions will be assigned."
  type        = list(string)
  default     = ["group:lcloud-gcp-audit@lcloud.pl"]
}

variable "audit_additional_roles" {
  description = "List of additional permissions which will be assigned to audit_members."
  type        = list(object({
    name      = string
    condition = optional(list(object({
      title       = string
      description = optional(string)
      expression  = string
    })), [])
  }))
  default     = []
}

variable "iam_bot_roles" {
  description = "List of roles granted to the IAM bot."
  type        = list(object({
    name      = string
    condition = optional(list(object({
      title       = string
      description = optional(string)
      expression  = string
    })), [])
  }))
  default     = [
    { name = "roles/resourcemanager.projectIamAdmin" },
  ]
}

variable "iam_bot_sa" {
  description = "Email of IAM Bot Service Account managing granted permissions."
  type        = string
  default     = "serviceAccount:lcloud-iam-bot@lcloud-iam-bot.iam.gserviceaccount.com"
}

variable "kernel_members" {
  description = "List of members for which Kernel permissions will be assigned."
  type        = list(string)
  default     = ["group:lcloud-gcp-kernel@lcloud.pl"]
}

variable "kernel_additional_roles" {
  description = "List of additional permissions which will be assigned to kernel_members."
  type        = list(object({
    name      = string
    condition = optional(list(object({
      title       = string
      description = optional(string)
      expression  = string
    })), [])
  }))
  default     = []
}

variable "noc_members" {
  description = "List of members for which NOC (read-only) permissions will be assigned."
  type        = list(string)
  default     = ["group:lcloud-gcp-noc@lcloud.pl"]
}

variable "noc_additional_roles" {
  description = "List of additional permissions which will be assigned to noc_members."
  type        = list(object({
    name      = string
    condition = optional(list(object({
      title       = string
      description = optional(string)
      expression  = string
    })), [])
  }))
  default     = []
}
