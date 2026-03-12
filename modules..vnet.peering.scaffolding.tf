# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#--------------------------------------
# Azure Region Lookup
#--------------------------------------
# This module will lookup the Azure Region and return the short name for the region
module "mod_azure_region_lookup" {
  source = "github.com/POps-Rox/tf-az-overlays-azregionslookup"

  azure_region = var.location
}

