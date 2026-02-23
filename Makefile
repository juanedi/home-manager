.PHONY: update switch-linux switch-darwin build-linux build-darwin

update:
	nix flake update

switch-linux:
	home-manager switch --flake ~/.config/home-manager#jedi@linux

switch-darwin:
	home-manager switch --flake ~/.config/home-manager#jedi@darwin

build-linux:
	home-manager build --flake ~/.config/home-manager#jedi@linux

build-darwin:
	home-manager build --flake ~/.config/home-manager#jedi@darwin
