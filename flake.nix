{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    lix.url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-2.tar.gz";
    lix.inputs.nixpkgs.follows = "nixpkgs";
    agenix.url = "github:yaxitech/ragenix";
    helix.url = "github:helix-editor/helix";
    nixcord.url = "github:kaylorben/nixcord";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    jovian.url = "github:Jovian-Experiments/Jovian-NixOS";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    discordtavern.url = "github:hexfae/discordtavern";
    stylix.url = "github:danth/stylix";
  };

  outputs = {
    self,
    nixpkgs,
    lix,
    agenix,
    helix,
    nixcord,
    nixos-hardware,
    nur,
    home-manager,
    jovian,
    disko,
    discordtavern,
    stylix,
  } @ inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules =
          [
            ./machines/desktop
            lix.nixosModules.default
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
      server = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./machines/server
          lix.nixosModules.default
          home-manager.nixosModules.default
          stylix.nixosModules.stylix
          agenix.nixosModules.default
          disko.nixosModules.disko
          discordtavern.nixosModules.default
          {nixpkgs.overlays = [nur.overlays.default];}
        ];
      };
      thinkpad = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./machines/thinkpad
          lix.nixosModules.default
          home-manager.nixosModules.default
          stylix.nixosModules.stylix
          agenix.nixosModules.default
          nixos-hardware.nixosModules.lenovo-thinkpad-t480s
          {nixpkgs.overlays = [nur.overlays.default];}
        ];
      };
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./machines/laptop
          lix.nixosModules.default
          home-manager.nixosModules.default
          stylix.nixosModules.stylix
          agenix.nixosModules.default
          {nixpkgs.overlays = [nur.overlays.default];}
        ];
      };
      deck = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./machines/deck
          lix.nixosModules.default
          home-manager.nixosModules.default
          jovian.nixosModules.default
          stylix.nixosModules.stylix
          agenix.nixosModules.default
          {nixpkgs.overlays = [nur.overlays.default];}
        ];
      };
    };
  };
}
