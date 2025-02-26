{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep <app name>

  environment.systemPackages = with pkgs; [
    mkalias
    uv
    go
    zsh
    git
    lsd
    fzf
    htop
    cargo
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
    aider-chat
    nixpkgs-fmt
    # pandoc_3_6

    # Broken on Mac
    # kanata
  ];

  fonts.packages = with pkgs;[
    nerd-fonts.victor-mono
  ];

  homebrew = {
    enable = true;
    brews = [
      "kanata"
    ];
    casks = [
      "alfred"
      "docker"
      "ghostty"
      "google-drive"
      "karabiner-elements"
    ];

    # Removes any homebrew apps installed outside of nix, and auto updates when building
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };

}
