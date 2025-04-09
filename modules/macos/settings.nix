{ ... }: {
  # All MacOS settings: https://daiderd.com/nix-darwin/manual/index.html
  # You can get current MacO setting from running:
  # defaults read > ~/projects/defaults/keyboard.json

  security.pam.services.sudo_local.touchIdAuth = true;
  system.defaults = {
    dock.autohide = true;
    finder.FXPreferredViewStyle = "clmv";
    loginwindow.GuestEnabled = false;
    ".GlobalPreferences" = {
      "com.apple.mouse.scaling" = 2;
      # "com.apple.sound.beep.sound" = ;
    };
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
      "com.apple.swipescrolldirection" = false;
    };
  };
}
