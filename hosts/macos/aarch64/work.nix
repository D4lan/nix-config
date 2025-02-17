{ ... }: {
  imports = [
    ../../../modules/macos/default.nix
    ../../../modules/macos/location/work.nix
  ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
