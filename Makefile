.PHONY: switch update build

switch:
	home-manager switch --flake ~/.config/home-manager#jedi

update:
	nix flake update

build:
	home-manager build --flake ~/.config/home-manager#jedi
