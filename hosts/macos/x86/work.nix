{ ... }: {
  imports = [
    ../../../modules/macos/location/default.nix
    ../../../modules/macos/location/work.nix
  ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "x86_64-darwin";
}
