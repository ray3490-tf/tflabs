resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = local.resource_location
}

resource "azurerm_virtual_network" "app_network" {
  name                = local.virtual_network.name
  location            = local.resource_location
  resource_group_name = azurerm_resource_group.appgrp.name
  address_space       = local.virtual_network.address_prefixes
 
  subnet {
    name             = "websunet01"
    address_prefixes = [local.subnet_address_prefix[0]]
  }

  subnet {
    name             = "appsunet01"
    address_prefixes = [local.subnet_address_prefix[1]]
  }
  
}

resource "azurerm_storage_account" "appstore33449988" {
  name                     = "appstore33449988"
  resource_group_name      = azurerm_resource_group.appgrp.name
  location                 = local.resource_location
  account_tier             = "Standard"
  account_replication_type = "LRS" 
  depends_on = [ 
    azurerm_resource_group.appgrp 
    ]
}

resource "azurerm_storage_container" "scripts" {
  name                  = "scripts"
  storage_account_id    = azurerm_storage_account.appstore33449988.id
  depends_on = [
    azurerm_storage_account.appstore33449988
    ]
  }
