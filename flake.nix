{
  description = "diffie...........";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat.url = "github:edolstra/flake-compat";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        appliedOverlay = self.overlays.default pkgs pkgs;
      in {
        packages = rec {
          inherit (appliedOverlay) git-diffie;
          default = git-diffie;
        };
      }) // {
        overlays.default = import ./overlay.nix;
      };
}
