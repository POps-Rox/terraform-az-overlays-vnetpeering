# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

terraform {
  required_version = ">= 1.9"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116"
    }
    popsrox-utils = {
      source  = "POps-Rox/azutils"
      version = "~> 1.0.4"
    }
  }
}

provider "azurerm" {
  alias = "peer"
  features {}
  subscription_id            = var.alias_subscription_id
  environment                = var.environment
  skip_provider_registration = var.environment == "usgovernment" ? true : false
}
