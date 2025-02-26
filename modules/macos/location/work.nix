{ pkgs, ... }: {

  # Packages
  environment.systemPackages = with pkgs; [
    gh
    terraform
  ];

  # Homebrew apps
  homebrew = {
    casks = [
      "windows-app"
      "github"
    ];
  };

  # Custom macOS settings
  system.defaults.dock.persistent-apps = [
    "/System/Applications/Launchpad.app"
    "/Applications/Google Chrome.app"
    "/Users/dylanw/Applications/Chrome Apps.localized/Gmail.app"
    "/Users/dylanw/Applications/Chrome Apps.localized/GCal.app"
    "/Applications/Ghostty.app"
    "/Applications/Slack.app"
    "/Applications/zoom.us.app"
    "/System/Applications/System Settings.app"
  ];
}
