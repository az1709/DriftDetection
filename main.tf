resource "azurerm_resource_group" "rg" {
  name     = "yor-test-rg"
  location = "eastus"
  tags = {
    git_commit           = "4e529fecc93c630e67d8b81eedb0ed1f23a170db"
    git_file             = "main.tf"
    git_last_modified_at = "2025-12-11 21:28:36"
    git_last_modified_by = "davidalejo17@hotmail.com"
    git_modifiers        = "113141616+blahsi/davidalejo17"
    git_org              = "az1709"
    git_repo             = "DriftDetection"
    yor_name             = "rg"
    yor_trace            = "132b570d-5d2e-49d8-b9ec-3786a7e0976d"
  }
}

resource "azurerm_storage_account" "sa" {
  name                     = "yortestsa${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    git_commit           = "4e529fecc93c630e67d8b81eedb0ed1f23a170db"
    git_file             = "main.tf"
    git_last_modified_at = "2025-12-11 21:28:36"
    git_last_modified_by = "davidalejo17@hotmail.com"
    git_modifiers        = "davidalejo17"
    git_org              = "az1709"
    git_repo             = "DriftDetection"
    yor_name             = "sa"
    yor_trace            = "71440752-a07c-4c94-b5ae-a3a874fa95bc"
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
