{ ... }: {
  imports = [
    ../../../modules/macos/default.nix
    ../../../modules/macos/pkgs.nix
    ../../../modules/macos/settings.nix
    ../../../modules/macos/shortcuts.nix

    ../../../modules/macos/location/work.nix
  ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
