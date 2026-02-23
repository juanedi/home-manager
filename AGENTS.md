# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Nix flake-based Home Manager configuration for user `jedi` on `x86_64-linux` and `aarch64-darwin`. It uses `nixpkgs-unstable` as the package channel.

## Key Commands

Apply configuration changes:
```
home-manager switch --flake ~/.config/home-manager#jedi@linux
```

Update all flake inputs (regenerates `flake.lock`):
```
nix flake update
```

Update a single input:
```
nix flake update nixpkgs
```

Check what would change without applying:
```
home-manager build --flake ~/.config/home-manager#jedi@linux
```

## Architecture

**`flake.nix`** — the wiring layer. Declares inputs (nixpkgs, home-manager), locks them via `flake.lock`, constructs `pkgs` for each platform, and passes everything into `homeManagerConfiguration`. Two configs: `jedi@linux` and `jedi@darwin`.

**`common.nix`** — shared configuration. Packages, programs, session variables, and cross-platform dotfiles. Imported by each platform module.

**`linux.nix`** — Linux-specific config. Imports `common.nix`, sets `homeDirectory` and `stateVersion`, manages Linux-only dotfiles (Hyprland, app launchers).

**`darwin.nix`** — macOS-specific config. Imports `common.nix`, sets `homeDirectory` and `stateVersion`.

## Adding a New Input

1. Add it to `inputs` in `flake.nix`
2. Receive it in the `outputs` function arguments
3. Pass it via `extraSpecialArgs` (for packages/values) or add its module to `modules` (for inputs that ship HM modules)
4. Declare it as an argument in `common.nix` (or the relevant platform file): `{ config, pkgs, my-new-arg, ... }:`

## Current State

- `home.stateVersion = "25.11"` — do not change this value.
