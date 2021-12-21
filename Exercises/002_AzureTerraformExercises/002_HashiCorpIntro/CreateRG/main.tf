# Create a virtual network
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
 
  required_version = ">= 1.1.0"
}
 
provider "azurerm" {
  features {}
}
 
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westeurope"
}
 
resource "azurerm_virtual_network" "vnet" {
    name                = "myTFVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "westeurope"
    resource_group_name = azurerm_resource_group.rg.name
}
