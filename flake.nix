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
      "personal" = nix-darwin.lib.darwinSystem {
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "d4lan";
            };
          }
          ./hosts/macos/personal-x86.nix
        ];
      };

      "work" = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/work/macos-aarch64.nix
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "dylanw";
            };
          }
          ./hosts/macos/work-aarch64.nix
        ];
        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;
      };
    };
  };
}

