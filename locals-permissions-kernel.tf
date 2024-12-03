/*
 * Configuration file with permissions for kernel role.
 */

locals {
  permissions_kernel = {
    iamAdmin = {
      description = "Access and administer a project IAM policies"
      permissions = [
        # roles/resourcemanager.projectIamAdmin
        "iam.policybindings.get",
        "iam.policybindings.list",
        "resourcemanager.projects.createPolicyBinding",
        "resourcemanager.projects.deletePolicyBinding",
        "resourcemanager.projects.get",
        "resourcemanager.projects.getIamPolicy",
        "resourcemanager.projects.searchPolicyBindings",
        "resourcemanager.projects.setIamPolicy",
        "resourcemanager.projects.updatePolicyBinding",
        # roles/iam.roleAdmin
        "iam.roles.create",
        "iam.roles.delete",
        "iam.roles.get",
        "iam.roles.list",
        "iam.roles.undelete",
        "iam.roles.update",
        # roles/iam.serviceAccountAdmin
        "iam.serviceAccounts.create",
        "iam.serviceAccounts.createTagBinding",
        "iam.serviceAccounts.delete",
        "iam.serviceAccounts.deleteTagBinding",
        "iam.serviceAccounts.disable",
        "iam.serviceAccounts.enable",
        "iam.serviceAccounts.get",
        "iam.serviceAccounts.getIamPolicy",
        "iam.serviceAccounts.list",
        "iam.serviceAccounts.listEffectiveTags",
        "iam.serviceAccounts.listTagBindings",
        "iam.serviceAccounts.setIamPolicy",
        "iam.serviceAccounts.undelete",
        "iam.serviceAccounts.update",
      ]
    }

    kmsAndSecrets = {
      description = "Access and administer KMS keys and Secret Manager secrets"
      permissions = [
        # roles/secretmanager.admin
        "resourcemanager.projects.get",
        "secretmanager.locations.get",
        "secretmanager.locations.list",
        "secretmanager.secrets.create",
        "secretmanager.secrets.createTagBinding",
        "secretmanager.secrets.delete",
        "secretmanager.secrets.deleteTagBinding",
        "secretmanager.secrets.get",
        "secretmanager.secrets.getIamPolicy",
        "secretmanager.secrets.list",
        "secretmanager.secrets.listEffectiveTags",
        "secretmanager.secrets.listTagBindings",
        "secretmanager.secrets.setIamPolicy",
        "secretmanager.secrets.update",
        "secretmanager.versions.access",
        "secretmanager.versions.add",
        "secretmanager.versions.destroy",
        "secretmanager.versions.disable",
        "secretmanager.versions.enable",
        "secretmanager.versions.get",
        "secretmanager.versions.list",
        # roles/cloudkms.admin
        "cloudkms.cryptoKeyVersions.create",
        "cloudkms.cryptoKeyVersions.destroy",
        "cloudkms.cryptoKeyVersions.get",
        "cloudkms.cryptoKeyVersions.list",
        "cloudkms.cryptoKeyVersions.restore",
        "cloudkms.cryptoKeyVersions.update",
        "cloudkms.cryptoKeyVersions.useToDecryptViaDelegation",
        "cloudkms.cryptoKeyVersions.useToEncryptViaDelegation",
        "cloudkms.cryptoKeys.create",
        "cloudkms.cryptoKeys.get",
        "cloudkms.cryptoKeys.getIamPolicy",
        "cloudkms.cryptoKeys.list",
        "cloudkms.cryptoKeys.setIamPolicy",
        "cloudkms.cryptoKeys.update",
        "cloudkms.ekmConfigs.get",
        "cloudkms.ekmConfigs.getIamPolicy",
        "cloudkms.ekmConfigs.setIamPolicy",
        "cloudkms.ekmConfigs.update",
        "cloudkms.ekmConnections.create",
        "cloudkms.ekmConnections.get",
        "cloudkms.ekmConnections.getIamPolicy",
        "cloudkms.ekmConnections.list",
        "cloudkms.ekmConnections.setIamPolicy",
        "cloudkms.ekmConnections.update",
        "cloudkms.ekmConnections.use",
        "cloudkms.ekmConnections.verifyConnectivity",
        "cloudkms.importJobs.create",
        "cloudkms.importJobs.get",
        "cloudkms.importJobs.getIamPolicy",
        "cloudkms.importJobs.list",
        "cloudkms.importJobs.setIamPolicy",
        "cloudkms.importJobs.useToImport",
        "cloudkms.keyHandles.create",
        "cloudkms.keyHandles.get",
        "cloudkms.keyHandles.list",
        "cloudkms.keyRings.create",
        "cloudkms.keyRings.createTagBinding",
        "cloudkms.keyRings.deleteTagBinding",
        "cloudkms.keyRings.get",
        "cloudkms.keyRings.getIamPolicy",
        "cloudkms.keyRings.list",
        "cloudkms.keyRings.listEffectiveTags",
        "cloudkms.keyRings.listTagBindings",
        "cloudkms.keyRings.setIamPolicy",
        "cloudkms.locations.get",
        "cloudkms.locations.list",
        "cloudkms.locations.optOutKeyDeletionMsa",
        "cloudkms.operations.get",
        "cloudkms.projects.showEffectiveAutokeyConfig",
        "resourcemanager.projects.get",
      ]
    }

    dnsAdmin = {
      description = "Access and administer DNS"
      permissions = [
        "dns.changes.create",
        "dns.managedZones.create",
        "dns.managedZones.delete",
        "dns.policies.create",
        "dns.policies.delete",
        "dns.resourceRecordSets.create",
        "dns.resourceRecordSets.delete",
        "dns.responsePolicies.create",
        "dns.responsePolicies.delete",
        "dns.responsePolicyRules.create",
        "dns.responsePolicyRules.delete",
      ]
    }

    # ZZZ = {
    #   description = ""
    #   permissions = []
    # }
  }
}
