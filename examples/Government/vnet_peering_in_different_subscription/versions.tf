# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

terraform {
  required_version = ">= 1.10"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.6"
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

# Azurerm provider configuration
provider "azurerm" {
  features {}
  # subscription_id is provided by the consumer via ARM_SUBSCRIPTION_ID env var
}

provider "azurerm" {
  alias = "mgmt"
  features {}
  # Cross-subscription peering: this alias must point at the subscription
  # hosting the second virtual network.
  subscription_id = var.mgmt_subscription_id
}
