{
    nixConfig = {
        # Adapted From: https://github.com/divnix/digga/blob/main/examples/devos/flake.nix#L4
        # extra-substituters = "https://cache.nixos.org/ https://nix-community.cachix.org/";
        trusted-substituters = "https://cache.nixos.org/";
        # extra-trusted-public-keys = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=";
        trusted-public-keys = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=";
        # keep-derivations = true;
        # keep-outputs = true;
        extra-experimental-features = "nix-command flakes";
        # accept-flake-config = true;
        # show-trace = true;
        # fallback = true;
        # auto-optimise-store = true;
        # builders-use-substitutes = true;
        # cores = 0;
        # flake-registry = https://raw.githubusercontent.com/sylvorg/settings/main/flake-registry.json;
        # allow-unsafe-native-code-during-evaluation = true;
        # min-free = 262144000;
        # max-free = 1073741824;
    };
    description = "A flake for all my projects!";
    inputs = rec {

        # Prerequisites
        titan.url = github:syvlorg/titan;
        settings = {
            url = github:sylvorg/settings;
            inputs.titan.follows = "titan";
        };

        # Python
        pytest-hy.url = github:syvlorg/pytest-hy;
        rich.url = github:syvlorg/rich;
        oreo.url = github:syvlorg/oreo;
        bakery.url = github:syvlorg/bakery;
        alcremie.url = github:syvlorg/alcremie;
        strapper.url = github:syvlorg/strapper;
        tailapi.url = github:syvlorg/tailapi;
        bootstrap.url = github:sylvorg/bootstrap;

        # Misc
        sylvorg-github-io.url = github:sylvorg/sylvorg.github.io;

        # Flake Utilities
        flake-utils.url = github:numtide/flake-utils;
        flake-compat = {
            url = "github:edolstra/flake-compat";
            flake = false;
        };
    };
    outputs = inputs@{ self, flake-utils, settings, ... }: with builtins; with settings.lib; with flake-utils.lib; settings.mkOutputs {
        inherit inputs;
        pname = "sylveon";
        inherit (settings) overlay;
        overlays = j.foldToSet [
            (mapAttrsToList (n: v: v.overlays or {}) (removeAttrs inputs [ "self" "titan" ]))

            # Use this for manual overrides, where if an input has a custom overlay of another project here that's causing problems,
            # you can override said overlay manually
            {

            }
        ];
    };
}
