{ ... }: {
  imports = [
    ../../../modules/macos/core.nix
    ../../../modules/macos/pkgs.nix
    ../../../modules/macos/settings.nix
    ../../../modules/macos/shortcuts.nix
    ../../../modules/macos/mcp-servers.nix

    ../../../modules/macos/location/personal.nix
  ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "x86_64-darwin";
}
