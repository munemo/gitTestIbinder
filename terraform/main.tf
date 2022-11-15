terraform {
  backend "azurerm" {
     resource_group_name  = "ibinder-resource-group3"
    storage_account_name = "ibinderstorage"
    container_name       = "tfstate"
    key                  = "terraformgithubexample.tfstate"
  }
}
 
provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  #version = "~>2.0"
  features {}
}
 
data "azurerm_client_config" "current" {}
 
resource "azurerm_resource_group" "rg"{
  name     = "terraformIbinder"
  location = "northeurope"
    tags = {
    Owner = "john.chimbani"
    DueDate = "2022-11-02"
  }
}
 