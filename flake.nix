{
  description = "My Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = { self, nixpkgs, nix-darwin, nix-homebrew, ... } @inputs: {
    darwinConfigurations = {
      specialArgs = inputs;
      "personal-x86" = nix-darwin.lib.darwinSystem {
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "d4lan";
            };
          }
          ./hosts/macos/x86/personal.nix
        ];
      };
      "personal-aarch64" = nix-darwin.lib.darwinSystem {
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "d4lan";
            };
          }
          ./hosts/macos/aarch64/personal.nix
        ];
      };

      "work-aarch64" = nix-darwin.lib.darwinSystem {
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "dylanw";
            };
          }
          ./hosts/macos/aarch64/work.nix
        ];
      };
      "work-x86" = nix-darwin.lib.darwinSystem {
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "dylanw";
            };
          }
          ./hosts/macos/x86/work.nix
        ];
      };
    };
  };
}

