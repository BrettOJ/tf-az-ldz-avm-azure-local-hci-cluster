terraform {
  backend "azurerm" {
    key                  = ""
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    tenant_id            = ""
    subscription_id      = ""
    use_oidc             = true
    use_azuread_auth     = true
  }
}

terraform {
  required_version = ">= 1.9.7"
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.17.0"
    }
  }
}

provider "azurerm" {
  storage_use_azuread = true
  tenant_id           = ""
  subscription_id     = ""
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}



