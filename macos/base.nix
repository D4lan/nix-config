{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep <app name>
  environment.systemPackages = with pkgs; [
    mkalias
    go
    zsh
    git
    lsd
    fzf
    htop
    neovim
    zoxide
    nodejs
    python3
    chezmoi
    lazygit
    ripgrep
    starship
    fabric-ai
    lazydocker
    nixpkgs-fmt
    # kanata

    # Broken on Mac
    # ghostty
  ];

  fonts.packages = with pkgs;[
    nerd-fonts.victor-mono
  ];

  homebrew = {
    enable = true;
    brews = [
      "rust"
      "aider"
      "kanata"
    ];
    casks = [
      "alfred"
      "docker"
      "ghostty"
      "google-drive"
      "karabiner-elements"
    ];
    #masApps = {
    #  # mas search <app name>
    #  # "Yoink" = 457622435;
    #  "WireGuard" = 1451685025;
    #  Xcode = 497799835;
    #};

    # Removes any homebrew apps installed outside of nix, and auto updates when building
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
  # launchd.user.agents.kanata-serve = {
  #   command = "/opt/homebrew/bin/kanata";
  #   serviceConfig = {
  #     Label = "com.custom.kanata";
  #     KeepAlive = true;
  #     RunAtLoad = true;
  #     UserName = "root";
  #     ProcessType = "Interactive";
  #     ProgramArguments = [
  #       "sudo"
  #       "/opt/homebrew/bin/kanata"
  #     ];
  #     StandardOutPath = "/tmp/kanata.out.log";
  #     StandardErrorPath = "/tmp/kanata.err.log";
  #     Nice = 30;
  #   };
  # };

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

    CustomUserPreferences = {

      # Keyboard Shortcuts
      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          # Spotlight Search
          "64" = {
            enabled = false;
            value = {
              parameters = [ 32 49 1048576 ];
              type = "standard";
            };
          };
          # Finder Search
          "65" = {
            enabled = false;
            value = {
              parameters = [ 32 49 1048576 ];
              type = "standard";
            };
          };
          # Not sure, but keeps poping up
          # "98" = {
          #   enabled = true;
          #   value = {
          #     parameters = [ 47 44 1179648 ];
          #     type = "standard";
          #   };
          # };
        };
      };

      # Windows and Tabs
      # need to reset app for changes to take place
      NSGlobalDomain = {
        NSUserKeyEquivalents = {
          # Window Tiles
          "Left" = "^$h";
          "Right" = "^$l";
          "Fill" = "^$k";
          "Left &amp; Right" = "^$y";
          "Right &amp; Left" = "^$o";

          # Window Screens
          "Move to Built-in Retina Display" = "^$i";
          "Move to DELL U2719D" = "^$i";

          # Window Splits
          "Select Split Above" = "~k";
          "Select Split Bellow" = "~j";
          "Select Split Left" = "~h";
          "Select Split Right" = "~l";
          "Zoom Split" = "@$\\U21a9";

          # Tabs
          "Show Next Tab" = "~i";
          "Select Next Tab" = "~i";
          "Show Previous Tab" = "~u";
          "Select Previous Tab" = "~u";
        };
      };
    };
  };


  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.zsh.enable = true;
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
