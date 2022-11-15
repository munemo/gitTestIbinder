terraform {
  backend "azurerm" {
    resource_group_name  = "ibinder-resource-group3"
    storage_account_name = "ibinderstorage"
    container_name       = "tfstate"
    key                  = "ibinder.tfstate"
    subscription_id      = "ae6cbacb-2eac-42cc-978e-516b8ef7628d"
    tenant_id            = "7bb1a8e5-59ee-489d-86f5-a50210ae3970"
    access_key           = "pBvukWdGOxj+l2XCYCmda4v8Uc44VBYupG1y6CWOmifrCqcPhuNOd3vJEAmi/okMdVa+D5BGbvr/+ASt9nDNgQ=="
  }
}

provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  #version = "~>2.0"
  skip_provider_registration = "true"
  features {}
  use_msi = true
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = "terraformIbinder"
  location = "northeurope"
  tags = {
    Owner   = "john.chimbani"
    DueDate = "2022-11-02"
  }
}
 