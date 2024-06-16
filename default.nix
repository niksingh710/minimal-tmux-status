{pkgs ? import <nixpkgs> {}}:

pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "minimal-tmux-status";
  version = "1.0";
  src = ./.;
  rtpFilePath = "minimal.tmux";

  meta = {
    homepage = "https://github.com/niksingh710/minimal-tmux-status";
    description = "Minimal Status Bar";
    license = pkgs.lib.licenses.mit;
    platforms = pkgs.lib.platforms.unix;
    maintainers = with pkgs.lib.maintainers; [niksingh710];
  };
}
