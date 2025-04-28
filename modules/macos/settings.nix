{ ... }: {
  # All MacOS settings: https://daiderd.com/nix-darwin/manual/index.html
  # You can get current MacO setting from running:
  # defaults read > ~/projects/defaults/keyboard.json

  security.pam.services.sudo_local.touchIdAuth = true;
  system.defaults = {
    controlcenter = {
      BatteryShowPercentage = true;
    };
    dock = {
      autohide = true;
      minimize-to-application = true;
      orientation = "bottom"; # "bottom", "left", "right"
      show-recents = false;
      static-only = true;
      tilesize = 64;
    };
    finder = {
      FXPreferredViewStyle = "clmv";
      AppleShowAllExtensions = true;
      AppleShowAllFiles = false;
      FXDefaultSearchScope = "SCcf"; # Search current folder
      NewWindowTarget = "Home";
      ShowHardDrivesOnDesktop = true;
      ShowMountedServersOnDesktop = true;
    };
    loginwindow.GuestEnabled = false;
    ".GlobalPreferences" = {
      "com.apple.mouse.scaling" = 2.0;
      # "com.apple.sound.beep.sound" = ;
    };
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
      "com.apple.swipescrolldirection" = false;
      "com.apple.mouse.tapBehavior" = 1;
      "com.apple.trackpad.enableSecondaryClick" = true;
      "com.apple.trackpad.forceClick" = true;
      "com.apple.trackpad.scaling" = 1.0; # 0-3
    };
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
  };
}
