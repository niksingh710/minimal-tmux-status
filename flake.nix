{
  description = "A very basic flake";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs, }:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ]
          (system: function nixpkgs.legacyPackages.${system});
    in
    {
      packages =
        forAllSystems (pkgs: {
          default = pkgs.tmuxPlugins.mkTmuxPlugin {
            pluginName = "minimal-tmux-status";
            version = "1.0";
            src = builtins.path { path = ./.; name = "source"; };
            rtpFilePath = "minimal.tmux";

            meta = {
              homepage = "https://github.com/niksingh710/minimal-tmux-status";
              description = "Minimal Status Bar Tmux";
              license = pkgs.lib.licenses.mit;
              platforms = pkgs.lib.platforms.unix;
              maintainers = with pkgs.lib.maintainers; [ niksingh710 ];
            };
          };
        });
    };
}
