{ inputs, nix-darwin, user-options, ... }:
let
  system = "x86_64-darwin";
  nixpkgsWithConfig = {
    config = {
      allowUnfree = true;
    };
  };

in
{
  mackbook = nix-darwin.lib.darwinSystem
    {
      inherit system;
      specialArgs = { inherit user-options inputs; };
      modules = [
        # Shared system config
        ../../modules/shared/system
        # Main `nix-darwin` config
        ../../modules/darwin/nix-darwin
      ];
    }
    {
      nixpkgs = nixpkgsWithConfig;
    };
}
