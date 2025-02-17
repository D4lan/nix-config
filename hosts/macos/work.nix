{ pkgs, ... }: {
  imports = [
    ./default.nix
  ];

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
    # "~/Applications/Chrome Apps.localized/Gmail.app"
    # "~/Applications/Chrome Apps.localized/Gcal.app"
    "/Applications/Ghostty.app"
    "/Applications/Slack.app"
    "/Applications/zoom.us.app"
    "/System/Applications/System Settings.app"
  ];

}
