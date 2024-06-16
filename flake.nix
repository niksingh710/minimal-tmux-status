{
  description = "A very basic flake";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs, }:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" ]
        (system: function nixpkgs.legacyPackages.${system});
    in {
      packages =
        forAllSystems (pkgs: { default = pkgs.callPackage ./default.nix { }; });
    };
}
