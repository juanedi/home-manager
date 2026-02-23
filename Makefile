UNAME := $(shell uname -s)
ifeq ($(UNAME),Darwin)
  PROFILE := jedi@darwin
else
  PROFILE := jedi@linux
endif

.PHONY: update switch build clean

update:
	nix flake update

switch:
	home-manager switch --flake ~/.config/home-manager#$(PROFILE)

build:
	home-manager build --flake ~/.config/home-manager#$(PROFILE)

clean:
	rm -f result
