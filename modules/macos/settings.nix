{}: {
  # All MacOS settings: https://daiderd.com/nix-darwin/manual/index.html
  # You can get current MacO setting from running:
  # defaults read > ~/projects/defaults/keyboard.json

  security.pam.enableSudoTouchIdAuth = true;
  system.defaults = {
    dock.autohide = true;
    finder.FXPreferredViewStyle = "clmv";
    loginwindow.GuestEnabled = false;
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
    };
  };
}
