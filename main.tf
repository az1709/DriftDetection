resource "azurerm_resource_group" "rg" {
  name     = "yor-test-rg"
  location = "eastus"
  tags = {

  }
}

resource "azurerm_storage_account" "sa" {
  name                     = "yortestsa${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {

  }
}

resource "azurerm_storage_container" "container" {
  name                  = "yor-test-container"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}
