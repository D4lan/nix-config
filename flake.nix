{
  description = "My Nix Config";

  inputs = {
    # Packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    # System
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, nix-homebrew, ... } @inputs:

    let
      colorschemes = {
        cf = "catppuccin-frappe";
        cm = "catppuccin-mocha";
      };

      personal-options = {
        username = "roberm";
        # More colorschemes at: https://github.com/tinted-theming/base16-schemes
        colorscheme = colorschemes.cf;
        opacity = 0.92; #1; # Terminal-related opacity. Range: 0-1 (e.g., 0.92)
        fonts = [ "Hack" "FiraCode" "DroidSansMono" ];
      };
    in
    {

      ##################################################################
      ###################### Physical Machines ########################
      darwinConfigurations =
        # Personal Darwin x86 Configurations
        import ./hosts/macos/x86/personal.nix {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs nix-darwin personal-options;
        };
    };
}

