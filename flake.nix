{
  description = "My Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
    };

    # homebrew
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-bundle = {
      url = "github:Homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:Homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:Homebrew/homebrew-cask";
      flake = false;
    };

    # mcp
    mcp-servers-nix.url = "github:natsukium/mcp-servers-nix";
  };

  outputs = { self, nixpkgs, nix-darwin, nix-homebrew, homebrew-bundle, homebrew-core, homebrew-cask, mcp-servers-nix, ... } @inputs: 
    let
      # Helper function to create homebrew module with user-specific settings
      mkHomebrewModule = { username, enableRosetta ? false, autoMigrate ? false, ... }: {
        nix-homebrew = {
          user = username;
          enable = true;
          enableRosetta = enableRosetta;
          taps = {
            "homebrew/homebrew-core" = homebrew-core;
            "homebrew/homebrew-cask" = homebrew-cask;
            "homebrew/homebrew-bundle" = homebrew-bundle;
          };
          mutableTaps = false;
          autoMigrate = autoMigrate;
        };
      };
      
      # MCP module for Minecraft proxy server
      mcpModule = { pkgs, ... }: {
        imports = [
          (mcp-servers-nix.lib.mkConfig pkgs {
            programs = {
              filesystem.enable = true;
              fetch.enable = true;
            };
          })
        ];
      };
    in {
      darwinConfigurations = {
        "personal-x86" = nix-darwin.lib.darwinSystem {
          specialArgs = inputs;
          modules = [
            nix-homebrew.darwinModules.nix-homebrew
            (mkHomebrewModule { username = "d4lan"; })
            mcpModule
            ./hosts/macos/x86/personal.nix
          ];
        };
        
        "personal-aarch64" = nix-darwin.lib.darwinSystem {
          specialArgs = inputs;
          modules = [
            nix-homebrew.darwinModules.nix-homebrew
            (mkHomebrewModule { 
              username = "d4lan";
              enableRosetta = true; 
            })
            mcpModule
            ./hosts/macos/aarch64/personal.nix
          ];
        };

        "work-aarch64" = nix-darwin.lib.darwinSystem {
          specialArgs = inputs;
          modules = [
            nix-homebrew.darwinModules.nix-homebrew
            (mkHomebrewModule { 
              username = "dylanw";
              enableRosetta = true;
              autoMigrate = true;
            })
            ./hosts/macos/aarch64/work.nix
          ];
        };
        
        "work-x86" = nix-darwin.lib.darwinSystem {
          specialArgs = inputs;
          modules = [
            nix-homebrew.darwinModules.nix-homebrew
            (mkHomebrewModule { username = "dylanw"; })
            ./hosts/macos/x86/work.nix
          ];
        };
      };
    };
}
