locals {
  naming_convention_info_001 = {
    env  = "dev"
    site = "tst"
    app  = "azhci"
    name = "01"
  }

  tags = {
    name        = "tst-azhci"
    app         = "azhci"
    env         = "dev"
    CreatedBy   = "Terraform"
    owner       = "corp-arch"
    CreatedDate = formatdate("YYYY-MM-DD", timestamp())
  }
}

data "azuread_client_config" "current" {}

data "azurerm_key_vault" "npe_akv_infra" {
  name                = ""
  resource_group_name = ""
}

module "naming_001" {
  source  = "Azure/naming/azurerm"
  version = "0.3.0"
  suffix  = var.suffix_001

}

module "avm-res-resources-resourcegroup_001" {
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  version  = "0.2.1"
  name     = module.naming_001.resource_group.name
  location = var.location
}

# Create site for the Arc service connection

module "avm-res-edge-site_001" {
  source  = "Azure/avm-res-edge-site/azurerm"
  version = "1.0.0"

  address_resource_name = "${var.address_resource_name}-001"
  country               = var.country
  location              = var.location
  resource_group_id     = module.avm-res-resources-resourcegroup_001.resource_group_id
  site_display_name     = "${var.site_display_name}-001"
  site_resource_name    = "${var.site_resource_name}-001"
}

#create a service principal and place ID and pasword in AKV

module "azure_application_registration" {
  source                                 = "git::https://github.com/BrettOJ/tf-az-module-entra-application-registration?ref=main"
  description                            = var.description
  display_name                           = var.display_name
  group_membership_claims                = var.group_membership_claims
  homepage_url                           = var.homepage_url
  implicit_access_token_issuance_enabled = var.implicit_access_token_issuance_enabled
  implicit_id_token_issuance_enabled     = var.implicit_id_token_issuance_enabled
  logout_url                             = var.logout_url
  marketing_url                          = var.marketing_url
  notes                                  = var.notes
  privacy_statement_url                  = var.privacy_statement_url
  requested_access_token_version         = var.requested_access_token_version
  service_management_reference           = var.service_management_reference
  sign_in_audience                       = var.sign_in_audience
  support_url                            = var.support_url
  terms_of_service_url                   = var.terms_of_service_url
}

module "azuread_service_principal" {
  source                       = "git::https://github.com/BrettOJ/tf-az-module-entra-service-principal?ref=main"
  account_enabled              = var.account_enabled
  alternative_names            = var.alternative_names
  app_role_assignment_required = var.app_role_assignment_required
  client_id                    = module.azure_application_registration.aad_app_reg.client_id
  description                  = var.description
  feature_tags = {
    custom_single_sign_on = var.feature_tags_custom_single_sign_on
    enterprise            = var.feature_tags_enterprise
    gallery               = var.feature_tags_gallery
    hide                  = var.feature_tags_hide
  }
  login_url                     = var.login_url
  notes                         = var.notes
  notification_email_addresses  = var.notification_email_addresses
  owners                        = [data.azuread_client_config.current.object_id]
  preferred_single_sign_on_mode = var.preferred_single_sign_on_mode
  saml_single_sign_on = {
    relay_state = var.saml_single_sign_on_relay_state
  }
}
module "azuread_application_password" {
  source               = "git::https://github.com/BrettOJ/tf-az-module-entra-service-principal-password?ref=main"
  service_principal_id = module.azuread_service_principal.azad_sp_output.id
  display_name         = var.display_name
  end_date             = var.end_date
  start_date           = var.start_date
  rotation_days        = var.rotation_days
}

module "azurerm_key_vault_secret" {
  source                 = "git::https://github.com/BrettOJ/tf-az-module-key-vault-secret?ref=main"
  key_vault_id           = data.azurerm_key_vault.npe_akv_infra.id
  not_before_date        = var.not_before_date
  expiration_date        = var.expiration_date
  value                  = module.azuread_application_password.azad_app_password.value
  content_type           = null
  tags                   = local.tags
  naming_convention_info = local.naming_convention_info_001
}

