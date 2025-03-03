
# Required input values for the module

variable "adou_path" {
  type        = string
  description = "The Active Directory Organizational Unit path."
}

variable "custom_location_name" {
  type        = string
  description = "The custom location name for the deployment."
}

variable "default_gateway" {
  type        = string
  description = "The default gateway for the network."
}

variable "deployment_user" {
  type        = string
  description = "The username for the deployment."
}

variable "deployment_user_password" {
  type        = string
  description = "The password for the deployment user."
}

variable "domain_fqdn" {
  type        = string
  description = "The fully qualified domain name of the domain."
}

variable "ending_address" {
  type        = string
  description = "The ending IP address for the network range."
}

variable "keyvault_name" {
  type        = string
  description = "The name of the Key Vault."
}

variable "local_admin_password" {
  type        = string
  description = "The password for the local administrator."
}

variable "local_admin_user" {
  type        = string
  description = "The username for the local administrator."
}

variable "servers" {
  type = list(object({
    name        = string
    ipv4Address = string
  }))
  description = "A list of servers with their names and IP addresses."
}

variable "service_principal_id" {
  type        = string
  description = "The ID of the service principal."
}

variable "service_principal_secret" {
  type        = string
  description = "The secret for the service principal."
}

variable "site_id" {
  type        = string
  description = "The ID of the site."
}

variable "starting_address" {
  type        = string
  description = "The starting IP address for the network range."
}

# Optional input variables for the module

variable "account_replication_type" {
  description = "The replication type for the storage account."
  type        = string
  default     = "ZRS"
}

variable "allow_nested_items_to_be_public" {
  description = "Indicates whether nested items can be public."
  type        = bool
  default     = false
}

variable "azure_service_endpoint" {
  description = "The Azure service endpoint."
  type        = string
  default     = "core.windows.net"
}

variable "azure_stack_lcm_user_credential_content_type" {
  description = "(Optional) Content type of the azure stack lcm user credential."
  type        = string
  default     = null
}

variable "azure_stack_lcm_user_credential_expiration_date" {
  description = "(Optional) Expiration date of the azure stack lcm user credential."
  type        = string
  default     = null
}

variable "azure_stack_lcm_user_credential_tags" {
  description = "(Optional) Tags of the azure stack lcm user credential."
  type        = map(string)
  default     = null
}

variable "bitlocker_boot_volume" {
  description = "When set to true, BitLocker XTS_AES 256-bit encryption is enabled for all data-at-rest on the OS volume of your Azure Stack HCI cluster. This setting is TPM-hardware dependent."
  type        = bool
  default     = true
}

variable "bitlocker_data_volumes" {
  description = "When set to true, BitLocker XTS-AES 256-bit encryption is enabled for all data-at-rest on your Azure Stack HCI cluster shared volumes."
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "The name of the HCI cluster."
  type        = string
  default     = ""
}

variable "cluster_tags" {
  description = "(Optional) Tags of the cluster."
  type        = map(string)
  default     = null
}

variable "compute_intent_name" {
  description = "The name of compute intent."
  type        = string
  default     = "ManagementCompute"
}

variable "compute_override_adapter_property" {
  description = "Indicates whether to override adapter property for compute."
  type        = bool
  default     = true
}

variable "compute_override_qos_policy" {
  description = "Indicates whether to override qos policy for compute network."
  type        = bool
  default     = false
}

variable "compute_qos_policy_overrides" {
  description = "QoS policy overrides for network settings with required properties for compute."
  type = object({
    priorityValue8021Action_SMB     = string
    priorityValue8021Action_Cluster = string
    bandwidthPercentage_SMB         = string
  })
  default = {
    bandwidthPercentage_SMB         = ""
    priorityValue8021Action_Cluster = ""
    priorityValue8021Action_SMB     = ""
  }
}

variable "compute_rdma_enabled" {
  description = "Indicates whether RDMA is enabled for compute."
  type        = bool
  default     = false
}

variable "compute_rdma_jumbo_packet" {
  description = "The jumbo packet size for RDMA of compute network."
  type        = string
  default     = "9014"
}

variable "compute_rdma_protocol" {
  description = "The RDMA protocol of compute network."
  type        = string
  default     = "RoCEv2"
}

variable "compute_traffic_type" {
  description = "Traffic type of compute."
  type        = list(string)
  default     = ["Management", "Compute"]
}

variable "configuration_mode" {
  description = "The configuration mode for the storage."
  type        = string
  default     = "Express"
}

variable "create_hci_rp_role_assignments" {
  description = "Indicates whether to create role assignments for the HCI resource provider service principal."
  type        = bool
  default     = false
}

variable "create_key_vault" {
  description = "Set to true to create the key vault, or false to skip it"
  type        = bool
  default     = true
}

variable "create_witness_storage_account" {
  description = "Set to true to create the witness storage account, or false to skip it"
  type        = bool
  default     = true
}

variable "credential_guard_enforced" {
  description = "When set to true, Credential Guard is enabled on your Azure HCI cluster."
  type        = bool
  default     = false
}

variable "cross_tenant_replication_enabled" {
  description = "Indicates whether cross-tenant replication is enabled."
  type        = bool
  default     = false
}

variable "default_arb_application_content_type" {
  description = "(Optional) Content type of the default arb application."
  type        = string
  default     = null
}

variable "default_arb_application_expiration_date" {
  description = "(Optional) Expiration date of the default arb application."
  type        = string
  default     = null
}

variable "default_arb_application_tags" {
  description = "(Optional) Tags of the default arb application."
  type        = map(string)
  default     = null
}

variable "deployment_configuration_version" {
  description = "The version of deployment configuration. Latest version will be used if not specified."
  type        = string
  default     = null
}

variable "drift_control_enforced" {
  description = "When set to true, the security baseline is re-applied regularly."
  type        = bool
  default     = true
}

variable "drtm_protection" {
  description = "By default, Secure Boot is enabled on your Azure HCI cluster. This setting is hardware dependent."
  type        = bool
  default     = true
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module. For more information see <https://aka.ms/avm/telemetryinfo>. If it is set to false, then no telemetry will be collected."
  type        = bool
  default     = true
}

variable "eu_location" {
  description = "Indicates whether the location is in EU."
  type        = bool
  default     = false
}

variable "hvci_protection" {
  description = "By default, Hypervisor-protected Code Integrity is enabled on your Azure HCI cluster."
  type        = bool
  default     = true
}

variable "intent_name" {
  description = "The name of intent."
  type        = string
  default     = "ManagementComputeStorage"
}

variable "is_exported" {
  description = "Indicate whether the resource is exported"
  type        = bool
  default     = false
}

variable "key_vault_location" {
  description = "The location of the key vault."
  type        = string
  default     = ""
}

variable "key_vault_resource_group" {
  description = "The resource group of the key vault."
  type        = string
  default     = ""
}

variable "keyvault_purge_protection_enabled" {
  description = "Indicates whether purge protection is enabled."
  type        = bool
  default     = true
}

variable "keyvault_secrets" {
  description = "A list of key vault secrets."
  type = list(object({
    eceSecretName = string
    secretSuffix  = string
  }))
  default = []
}

variable "keyvault_soft_delete_retention_days" {
  description = "The number of days that items should be retained for soft delete."
  type        = number
  default     = 30
}

variable "keyvault_tags" {
  description = "(Optional) Tags of the keyvault."
  type        = map(string)
  default     = null
}

variable "local_admin_credential_content_type" {
  description = "(Optional) Content type of the local admin credential."
  type        = string
  default     = null
}

variable "local_admin_credential_expiration_date" {
  description = "(Optional) Expiration date of the local admin credential."
  type        = string
  default     = null
}

variable "local_admin_credential_tags" {
  description = "(Optional) Tags of the local admin credential."
  type        = map(string)
  default     = null
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified: - `kind` - (Required) The type of lock. Possible values are #`\"CanNotDelete\"` and `\"ReadOnly\"`. - `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource."
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "management_adapters" {
  description = "A list of management adapters."
  type        = list(string)
  default     = []
}

variable "min_tls_version" {
  description = "The minimum TLS version."
  type        = string
  default     = "TLS1_2"
}

variable "naming_prefix" {
  description = "The naming prefix in HCI deployment settings. Site id will be used if not provided."
  type        = string
  default     = ""
}

variable "operation_type" {
  description = "The intended operation for a cluster."
  type        = string
  default     = "ClusterProvisioning"
}

variable "override_adapter_property" {
  description = "Indicates whether to override adapter property."
  type        = bool
  default     = true
}

variable "override_qos_policy" {
  description = "Indicates whether to override qos policy for converged network."
  type        = bool
  default     = false
}

variable "qos_policy_overrides" {
  description = "QoS policy overrides for network settings with required properties."
  type = object({
    priorityValue8021Action_SMB     = string
    priorityValue8021Action_Cluster = string
    bandwidthPercentage_SMB         = string
  })
  default = {
    bandwidthPercentage_SMB         = ""
    priorityValue8021Action_Cluster = ""
    priorityValue8021Action_SMB     = ""
  }
}

variable "random_suffix" {
  description = "Indicate whether to add random suffix"
  type        = bool
  default     = true
}

variable "rdma_enabled" {
  description = "Enables RDMA when set to true. In a converged network configuration, this will make the network use RDMA. In a dedicated storage network configuration, enabling this will enable RDMA on the storage network."
  type        = bool
  default     = false
}

variable "rdma_jumbo_packet" {
  description = "The jumbo packet size for RDMA of converged network."
  type        = string
  default     = "9014"
}

variable "rdma_protocol" {
  description = "The RDMA protocol of converged network."
  type        = string
  default     = "RoCEv2"
}

variable "resource_group_location" {
  description = "The location of resource group."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. - `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal. - `principal_id` - The ID of the principal to assign the role to. - `description` - The description of the role assignment. - `skip_service_principal_aad_check` - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false. - `condition` - The condition which will be used to scope the role assignment. - `condition_version` - The version of the condition syntax. Valid values are '2.0'. > Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal."
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default = {}
}

variable "rp_service_principal_object_id" {
  description = "The object ID of the HCI resource provider service principal."
  type        = string
  default     = ""
}

variable "secrets_location" {
  description = "Secrets location for the deployment."
  type        = string
  default     = ""
}

variable "side_channel_mitigation_enforced" {
  description = "When set to true, all the side channel mitigations are enabled."
  type        = bool
  default     = true
}

variable "smb_cluster_encryption" {
  description = "When set to true, cluster east-west traffic is encrypted."
  type        = bool
  default     = false
}

variable "smb_signing_enforced" {
  description = "When set to true, the SMB default instance requires sign in for the client and server services."
  type        = bool
  default     = true
}

variable "storage_adapter_ip_info" {
  description = "The IP information for the storage networks. Key is the storage network name."
  type = map(list(object({
    physicalNode = string
    ipv4Address  = string
    subnetMask   = string
  })))
  default = null
}

variable "storage_connectivity_switchless" {
  description = "Indicates whether storage connectivity is switchless."
  type        = bool
  default     = false
}

variable "storage_intent_name" {
  description = "The name of storage intent."
  type        = string
  default     = "Storage"
}

variable "storage_networks" {
  description = "A list of storage networks."
  type = list(object({
    name               = string
    networkAdapterName = string
    vlanId             = string
  }))
  default = []
}

variable "storage_override_adapter_property" {
  description = "Indicates whether to override adapter property for storage network."
  type        = bool
  default     = true
}

variable "storage_override_qos_policy" {
  description = "Indicates whether to override qos policy for storage network."
  type        = bool
  default     = false
}

variable "storage_qos_policy_overrides" {
  description = "QoS policy overrides for network settings with required properties for storage."
  type = object({
    priorityValue8021Action_SMB     = string
    priorityValue8021Action_Cluster = string
    bandwidthPercentage_SMB         = string
  })
  default = {
    bandwidthPercentage_SMB         = ""
    priorityValue8021Action_Cluster = ""
    priorityValue8021Action_SMB     = ""
  }
}

variable "storage_rdma_enabled" {
  description = "Indicates whether RDMA is enabled for storage. Storage RDMA will be enabled if either rdma_enabled or storage_rdma_enabled is set to true."
  type        = bool
  default     = false
}

variable "storage_rdma_jumbo_packet" {
  description = "The jumbo packet size for RDMA of storage network."
  type        = string
  default     = "9014"
}

variable "storage_rdma_protocol" {
  description = "The RDMA protocol of storage network."
  type        = string
  default     = "RoCEv2"
}

variable "storage_tags" {
  description = "(Optional) Tags of the storage."
  type        = map(string)
  default     = null
}

variable "storage_traffic_type" {
  description = "Traffic type of storage."
  type        = list(string)
  default     = ["Storage"]
}

variable "subnet_mask" {
  description = "The subnet mask for the network."
  type        = string
  default     = "255.255.255.0"
}

variable "tenant_id" {
  description = "(Optional) Value of the tenant id"
  type        = string
  default     = ""
}

variable "traffic_type" {
  description = "Traffic type of intent."
  type        = list(string)
  default     = ["Management", "Compute", "Storage"]
}

variable "use_legacy_key_vault_model" {
  description = "Indicates whether to use the legacy key vault model."
  type        = bool
  default     = false
}

variable "wdac_enforced" {
  description = "WDAC is enabled by default and limits the applications and the code that you can run on your Azure Stack HCI cluster."
  type        = bool
  default     = true
}

variable "witness_path" {
  description = "The path to the witness."
  type        = string
  default     = "Cloud"
}

variable "witness_storage_account_name" {
  description = "The name of the witness storage account."
  type        = string
  default     = ""
}

variable "witness_storage_account_resource_group_name" {
  description = "The resource group of the witness storage account. If not provided, 'resource_group_name' will be used as the storage account's resource group."
  type        = string
  default     = ""
}

variable "witness_storage_key_content_type" {
  description = "(Optional) Content type of the witness storage key."
  type        = string
  default     = null
}

variable "witness_storage_key_expiration_date" {
  description = "(Optional) Expiration date of the witness storage key."
  type        = string
  default     = null
}

variable "witness_storage_key_tags" {
  description = "(Optional) Tags of the witness storage key."
  type        = map(string)
  default     = null
}

variable "witness_type" {
  description = "The type of the witness."
  type        = string
  default     = "Cloud"
}