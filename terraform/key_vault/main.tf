terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
backend "azurerm" {
        resource_group_name  = "ibinder-resource-group3"
        storage_account_name = "ibinderstorage"
        container_name       = "tfstate2"
        key                  = "terraform.tfstate"
    }
}
