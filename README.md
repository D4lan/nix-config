# Install Nix

Install x-code
```
xcode-select --install
```

Download Nix
```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Install Nix Config
```
nix run nix-darwin -- switch --flake github:D4lan/nix-config#<work | home>
# OR
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake github:D4lan/nix-config#<work | home>
```

Create SSH key and Add to [Github Keys](https://github.com/settings/keys)
```
ssh_file="$HOME/.ssh/personal_git"; < /dev/zero ssh-keygen -q -N "" -f "$ssh_file" && cat "$ssh_file.pub" | pbcopy
```

Run Chezmoi for Dotfiles
```
chezmoi init D4lan --ssh --apply
```

# Update Nix Files
```
darwin-rebuild switch --flake ~/.config/nix-config#<work | home>
```
