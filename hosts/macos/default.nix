{ config, ... }:

let
  # Try to get the passed-in self (the flake object)
  self = config._module.args.self or { rev = null; dirtyRev = null; };
in
{
  imports = [
    ../../modules/macos/pkgs.nix
    ../../modules/macos/settings.nix
    ../../modules/macos/shortcuts.nix
  ];

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.zsh.enable = true;
}
