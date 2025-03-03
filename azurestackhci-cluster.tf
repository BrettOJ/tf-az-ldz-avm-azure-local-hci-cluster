module "avm-res-azurestackhci-cluster-001" {
  source  = "Azure/avm-res-azurestackhci-cluster/azurerm"
  version = "1.0.0"

  adou_path                = var.adou_path
  custom_location_name     = var.custom_location_name
  default_gateway          = var.default_gateway
  deployment_user          = var.deployment_user
  deployment_user_password = var.deployment_user_password
  dns_servers              = []
  domain_fqdn              = var.domain_fqdn
  ending_address           = var.ending_address
  keyvault_name            = var.keyvault_name
  local_admin_password     = var.local_admin_password
  local_admin_user         = var.local_admin_user
  location                 = var.location
  name                     = module.naming_001.cluster_name
  resource_group_id        = module.avm-res-resources-resourcegroup_001.resource_group_id
  servers                  = [var.servers] #list(object({ name = string ipv4Address = string }))
  service_principal_id     = var.service_principal_id
  service_principal_secret = var.service_principal_secret
  site_id                  = module.avm-res-edge-site_001.resource_id
  starting_address         = var.starting_address

  # Optional parameters


}

