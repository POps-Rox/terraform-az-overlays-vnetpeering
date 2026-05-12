# Changelog

All notable changes to this project are documented here. Format based on
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/); versions follow
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-05-11

### Changed (BREAKING)

- Upgraded `hashicorp/azurerm` provider constraint from `~> 3.116` to `~> 4.20`.
- Raised minimum Terraform CLI version from `>= 1.9` to `>= 1.10`.
- Root `provider "azurerm"` alias `peer`: replaced the removed
  `skip_provider_registration` argument with the 4.x replacement
  `resource_provider_registrations` (string enum). Mapping preserves prior
  behavior:
  - `usgovernment` → `"none"` (was `skip_provider_registration = true`)
  - any other environment → `"core"` (was `skip_provider_registration = false`,
    which matched the 3.x default of registering only the core providers).

### Added

- New `azure/azapi ~> 2.0` provider declaration in `versions.tf` (root + all
  four example stacks).
- Example `versions.tf` files (`examples/Commerical/*` and `examples/Government/*`)
  now declare full `terraform` blocks with `required_version` and
  `required_providers` (previously had only bare `provider "azurerm"` blocks).
- Comment in the example `provider "azurerm"` blocks noting that
  `subscription_id` is provided by the consumer via the `ARM_SUBSCRIPTION_ID`
  environment variable (required by azurerm 4.x).

### Notes

- Module manages only `azurerm_virtual_network_peering` resources; no
  mechanical attribute renames (`enable_*`, `allow_blob_public_access`,
  retention_policy, subnet endpoint policies, role assignments) were required.
- The root `provider "azurerm" { alias = "peer" ... }` block is preserved as-is
  (configured-in-root, not consumer-passed) because the cross-subscription
  peering pattern relies on the module owning that provider configuration.
- CI may show transitive provider-constraint failures on the example stacks
  until upstream POps-Rox overlays are also bumped to `~> 4.20`. Failures
  resolve as Phase 1 PRs land.

## v1.0.0 - <date>

Added
- Add Something you added
