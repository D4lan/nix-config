# Install Nix

Install x-code
```
xcode-select --install
```

Download Nix
```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Available Flakes
* personal-x86
* personal-aarch64
* work-x86
* work-aarch64

Install Nix Config
```
nix run nix-darwin -- switch --flake github:D4lan/nix-config#<flake name>
```
OR 
```
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake github:D4lan/nix-config#<flake name>
```

Create SSH key and Add to [Github Keys](https://github.com/settings/keys)
```
ssh_file="$HOME/.ssh/id_ed25519"; < /dev/zero ssh-keygen -q -N "" -f "$ssh_file" && cat "$ssh_file.pub" | pbcopy
```

Run Chezmoi for Dotfiles
```
chezmoi init D4lan --ssh --apply
```

# Update Nix Files
```
darwin-rebuild switch --flake ~/.config/nix-config#<flake name>
```
