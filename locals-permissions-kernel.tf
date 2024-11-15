/*
 * Configuration file with permissions for kernel role.
 */

locals {
  permissions_kernel = {
    iamAdmin = {
      description = "Access and administer a project IAM policies"
      permissions = [
        "iam.policybindings.get",
        "iam.policybindings.list",
        "resourcemanager.projects.createPolicyBinding",
        "resourcemanager.projects.deletePolicyBinding",
        "resourcemanager.projects.get",
        "resourcemanager.projects.getIamPolicy",
        "resourcemanager.projects.searchPolicyBindings",
        "resourcemanager.projects.setIamPolicy",
        "resourcemanager.projects.updatePolicyBinding",
      ]
    }

    # YYY = {
    #   description = ""
    #   permissions = []
    # }
    #
    # ZZZ = {
    #   description = ""
    #   permissions = []
    # }
  }
}
