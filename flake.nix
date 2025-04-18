{
  description = "A simple NixOS flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.lix.url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-2.tar.gz";
  inputs.lix.inputs.nixpkgs.follows = "nixpkgs";
  inputs.agenix.url = "github:yaxitech/ragenix";
  inputs.helix.url = "github:helix-editor/helix";
  inputs.nixcord.url = "github:kaylorben/nixcord";
  inputs.chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  inputs.nur.url = "github:nix-community/NUR";
  inputs.nur.inputs.nixpkgs.follows = "nixpkgs";
  inputs.nixos-hardware.url = "github:nixos/nixos-hardware";
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";
  inputs.jovian.url = "github:Jovian-Experiments/Jovian-NixOS";
  inputs.jovian.follows = "chaotic/jovian";
  inputs.disko.url = "github:nix-community/disko";
  inputs.disko.inputs.nixpkgs.follows = "nixpkgs";
  inputs.discordtavern.url = "github:hexfae/discordtavern";
  inputs.stylix.url = "github:danth/stylix";

  outputs = {
    self,
    nixpkgs,
    lix,
    agenix,
    helix,
    nixcord,
    chaotic,
    nur,
    nixos-hardware,
    home-manager,
    jovian,
    disko,
    discordtavern,
    stylix,
  } @ inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit self inputs;};
      modules =
        [
          ./machines/desktop
          lix.nixosModules.default
          chaotic.nixosModules.default
          home-manager.nixosModules.default
          stylix.nixosModules.stylix
          agenix.nixosModules.default
          {nixpkgs.overlays = [nur.overlays.default];}
        ]
        ++ (with nixos-hardware.nixosModules; [
          common-cpu-amd-pstate
          common-cpu-amd-zenpower
          gigabyte-b650
        ]);
    };
    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit self inputs;};
      modules = [
        ./machines/server
        lix.nixosModules.default
        chaotic.nixosModules.default
        home-manager.nixosModules.default
        stylix.nixosModules.stylix
        agenix.nixosModules.default
        disko.nixosModules.disko
        discordtavern.nixosModules.default
        {nixpkgs.overlays = [nur.overlays.default];}
      ];
    };
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit self inputs;};
      modules = [
        ./machines/laptop
        lix.nixosModules.default
        chaotic.nixosModules.default
        home-manager.nixosModules.default
        stylix.nixosModules.stylix
        agenix.nixosModules.default
        {nixpkgs.overlays = [nur.overlays.default];}
      ];
    };
    nixosConfigurations.deck = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit self inputs;};
      modules = [
        ./machines/deck
        lix.nixosModules.default
        chaotic.nixosModules.default
        home-manager.nixosModules.default
        jovian.nixosModules.default
        stylix.nixosModules.stylix
        agenix.nixosModules.default
        {nixpkgs.overlays = [nur.overlays.default];}
      ];
    };
  };
}
