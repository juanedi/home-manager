UNAME := $(shell uname -s)
ifeq ($(UNAME),Darwin)
  PROFILE := jedi@darwin
else
  PROFILE := jedi@linux
endif

.PHONY: build switch update clean

build:
	home-manager build --flake ~/.config/home-manager#$(PROFILE)

switch:
	home-manager switch --flake ~/.config/home-manager#$(PROFILE)

update:
	nix flake update

clean:
	rm -f result
