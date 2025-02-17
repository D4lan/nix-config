{ pkgs, self, ... }: {

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

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "x86_64-darwin";

  # Homebrew apps
  homebrew = {
    casks = [
      "google-chrome"
      # To allow for touch id in browser
      "bitwarden"
    ];
    brews = [
      "mas"
      "bitwarden-cli"
    ];
    masApps = {
      "WireGuard" = 1451685025;

      # To allow for touch id in browser
      # "Bitwarden" = 1352778147;
    };
  };

  # Custom macOS settings
  system.defaults.dock.persistent-apps = [
    "/System/Applications/Launchpad.app"
    "/Applications/Google Chrome.app"
    "/Applications/Ghostty.app"
    "/System/Applications/System Settings.app"
  ];
}
