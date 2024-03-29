terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = ">= 3.59.0"
      configuration_aliases = [azurerm.target_sub]
    }
  }
}
