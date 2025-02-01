{
  description = "A simple NixOS flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.lix.url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-2.tar.gz";
  inputs.lix.inputs.nixpkgs.follows = "nixpkgs";
  inputs.helix.url = "github:helix-editor/helix";
  inputs.chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";
  inputs.jovian.url = "github:Jovian-Experiments/Jovian-NixOS";
  inputs.jovian.follows = "chaotic/jovian";
  inputs.disko.url = "github:nix-community/disko";
  inputs.disko.inputs.nixpkgs.follows = "nixpkgs";
  inputs.wezterm.url = "github:wez/wezterm/main?dir=nix";
  inputs.wezterm.inputs.nixpkgs.follows = "nixpkgs";
  inputs.stylix.url = "github:danth/stylix";

  outputs = {
    self,
    nixpkgs,
    lix,
    helix,
    chaotic,
    home-manager,
    jovian,
    disko,
    wezterm,
    stylix,
  } @ inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit self inputs;};
      modules = [
        ./desktop.nix
        lix.nixosModules.default
        chaotic.nixosModules.default
        home-manager.nixosModules.default
        jovian.nixosModules.default
        stylix.nixosModules.stylix
      ];
    };
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit self inputs;};
      modules = [
        ./laptop.nix
        lix.nixosModules.default
        chaotic.nixosModules.default
        home-manager.nixosModules.default
        jovian.nixosModules.default
        stylix.nixosModules.stylix
      ];
    };
    nixosConfigurations.deck = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit self inputs;};
      modules = [
        ./deck.nix
        lix.nixosModules.default
        chaotic.nixosModules.default
        home-manager.nixosModules.default
        jovian.nixosModules.default
        stylix.nixosModules.stylix
      ];
    };
  };
}
