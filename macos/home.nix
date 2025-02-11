{ pkgs, ... }: {
  imports = [ ./base.nix ];

  # Homebrew apps
  homebrew = {
    casks = [
      "google-chrome"
    ];
    brews = [
      "mas"
      "bitwarden-cli"
    ];
    masApps = {
      "WireGuard" = 1451685025;
    };
  };

  # Custom macOS settings
  system.defaults.dock.persistent-apps = [
    "/System/Applications/Launchpad.app"
    "/Applications/Google Chrome.app"
    "/Applications/Ghostty.app"
    "/System/Applications/System Settings.app"
  ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "x86_64-darwin";
}
