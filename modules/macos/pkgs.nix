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

    # Removes any homebrew apps installed outside of nix, and auto updates when building
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };

}
