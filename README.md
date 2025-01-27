# git-diffie

## got nix?

```sh
$ nix run github:the6p4c/git-diffie
```

## got nixos?

```nix
{
  inputs = {
    your-nixos = "github:NixOS/nixpkgs/nixos-???";
    git-diffie.url = "github:the6p4c/git-diffie";
    git-diffie.inputs.nixpkgs.follows = "your-nixos";
  };
  outputs = inputs@{ git-diffie, ... }: {
    nixosConfigurations.machine = your-nixos.lib.nixosSystem {
      modules = [
        ({ pkgs, ... }: {
          nixpkgs.overlays = [ git-diffie.overlays.default ];
          environment.systemPackages = [ pkgs.git-diffie ];
        })
      ];
    };
  };
}
```
