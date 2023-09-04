{
  nixConfig = {
    accept-flake-config = true;
    allow-unsafe-native-code-during-evaluation = true;
    auto-optimise-store = true;
    builders-use-substitutes = true;
    cores = 0;
    extra-experimental-features =
      "nix-command flakes impure-derivations recursive-nix";
    extra-substituters =
      "https://cache.nixos.org/ https://nix-community.cachix.org";
    extra-trusted-public-keys =
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";
    fallback = true;
    flake-registry =
      "https://raw.githubusercontent.com/syvlorg/flake-registry/master/flake-registry.json";
    keep-derivations = true;
    keep-outputs = true;
    max-free = 1073741824;
    min-free = 262144000;
    show-trace = true;
    trusted-public-keys =
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";
    trusted-substituters =
      "https://cache.nixos.org/ https://nix-community.cachix.org";
    warn-dirty = false;
  };
  description = "A flake for all my projects!";
  inputs = rec {
    bundle = {
      url = "git+https://github.com/sylvorg/bundle.git";
      type = "git";
      submodules = true;
    };
    valiant.follows = "bundle/valiant";
    nixpkgs.follows = "bundle/nixpkgs";

    pyApp-falinks.url =
      "git+https://github.com/syvlorg/falinks.git";
    pyPkg-bakery.url =
      "git+https://github.com/syvlorg/bakery.git";
    pyApp-strapper.url =
      "git+https://github.com/syvlorg/strapper.git";
    pyApp-bootstrap.url =
      "git+https://github.com/sylvorg/bootstrap.git";
    pyApp-sylvorg-github-io.url =
      "git+https://github.com/sylvorg/sylvorg.github.io.git";

    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };
  outputs = inputs@{ self, ... }: { pname = "sylveon"; };
}
