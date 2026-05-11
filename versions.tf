# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

terraform {
  required_version = ">= 1.10"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.20"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 2.0"
    }
    popsrox = {
      source  = "POps-Rox/azutils"
      version = "~> 1.0"
    }
  }
}

provider "azurerm" {
  alias = "peer"
  features {}
  subscription_id                 = var.alias_subscription_id
  environment                     = var.environment
  resource_provider_registrations = var.environment == "usgovernment" ? "none" : "core"
}
