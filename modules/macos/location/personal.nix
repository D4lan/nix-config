{ pkgs, ... }: {

  # Packages
  environment.systemPackages = with pkgs; [
    nodePackages.vercel
  ];

  # Homebrew apps
  homebrew = {
    casks = [
      "google-chrome"
      "adguard"
    ];
    brews = [
      "mas"
      "bitwarden-cli"
    ];
    masApps = {
      "WireGuard" = 1451685025;

      # To allow for touch id in browser "Bitwarden" = 1352778147;
      "Bitwarden" = 1352778147;
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
