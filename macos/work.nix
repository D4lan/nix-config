{ pkgs, ... }: {
  imports = [ ./base.nix ];

  # Packages
  environment.systemPackages = with pkgs; [
    gh
    terraform
  ];

  # Homebrew apps
  homebrew = {
    casks = [
      "microsoft-remote-desktop"
      "github"
    ];
  };


  # Custom macOS settings
  system.defaults.dock.persistent-apps = [
    "/System/Applications/Launchpad.app"
    "/Applications/Google Chrome.app"
    "/Applications/Ghostty.app"
    "/Applications/Slack.app"
    "/Applications/zoom.us.app"
    "/System/Applications/System Settings.app"
  ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.enable = false;
}

