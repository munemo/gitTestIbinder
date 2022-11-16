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
  skip_provider_registration = "true"
  features {}
  use_msi = true
}

resource "azurerm_key_vault" "keyvault" {
  name                            = "ibinder-key-vault"
  location                        = "northeurope"
  resource_group_name             = "ibinder-resource-group3"
  enabled_for_disk_encryption     = true
  enabled_for_deployment          = true
  enabled_for_template_deployment = true
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days      = 7
  purge_protection_enabled        = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List"
    ]

    secret_permissions = [
      "Get", "List"
    ]

    storage_permissions = [
      "Get", "List"
    ]
  }
}