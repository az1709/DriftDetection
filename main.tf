resource "azurerm_resource_group" "rg" {
  name     = "yor-test-rg"
  location = "eastus"
  tags = {

    git_commit           = "cbcdea60ee45b242158eac374f76e00cdc47ae93"
    git_file             = "main.tf"
    git_last_modified_at = "2025-12-17 18:23:09"
    git_last_modified_by = "davidalejo17@hotmail.com"
    git_modifiers        = "113141616+blahsi/davidalejo17"
    git_org              = "az1709"
    git_repo             = "DriftDetection"
    yor_name             = "rg"
    yor_trace            = "e8d3d24a-4e80-489b-ba38-8dbf73e4fd1d"
  }
}

resource "azurerm_storage_account" "sa" {
  name                     = "yortestsa${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {

    yor_name  = "sa"
    yor_trace = "a50825e1-81e5-482c-94b2-da80c719297a"
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
