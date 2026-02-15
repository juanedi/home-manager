# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Nix flake-based Home Manager configuration for user `jedi` on `x86_64-linux`. It uses `nixpkgs-unstable` as the package channel.

## Key Commands

Apply configuration changes:
```
home-manager switch --flake ~/.config/home-manager#jedi
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
home-manager build --flake ~/.config/home-manager#jedi
```

## Architecture

**`flake.nix`** — the wiring layer. Declares inputs (nixpkgs, home-manager), locks them via `flake.lock`, constructs `pkgs`, and passes everything into `homeManagerConfiguration`. This is where new inputs are added and threaded through.

**`home.nix`** — the configuration layer. Receives `pkgs` (and any `extraSpecialArgs`) automatically from home-manager's module system. Never imports inputs directly.

## Adding a New Input

1. Add it to `inputs` in `flake.nix`
2. Receive it in the `outputs` function arguments
3. Pass it via `extraSpecialArgs` (for packages/values) or add its module to `modules` (for inputs that ship HM modules)
4. Declare it as an argument in `home.nix`: `{ config, pkgs, my-new-arg, ... }:`

## Current State

- `programs.direnv` with `nix-direnv` is enabled, but shell integrations (`enableZshIntegration`, etc.) are commented out pending shell management via HM.
- `home.stateVersion = "25.11"` — do not change this value.
