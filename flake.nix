{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix.url = "github:yaxitech/ragenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    nixcord.url = "github:kaylorben/nixcord";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    jovian.url = "github:Jovian-Experiments/Jovian-NixOS";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    discordtavern.url = "github:hexfae/discordtavern";
    harry.url = "/home/hexfae/dox/rust/ultimate_harry";
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    agenix,
    nixcord,
    nixos-hardware,
    nur,
    zen-browser,
    niri,
    home-manager,
    jovian,
    disko,
    discordtavern,
    harry,
    stylix,
  } @ inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules =
          [
            ./machines/desktop
            niri.nixosModules.niri
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
          home-manager.nixosModules.default
          stylix.nixosModules.stylix
          agenix.nixosModules.default
          disko.nixosModules.disko
          discordtavern.nixosModules.default
          harry.nixosModules.default
          {nixpkgs.overlays = [nur.overlays.default];}
        ];
      };
      thinkpad = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./machines/thinkpad
          niri.nixosModules.niri
          home-manager.nixosModules.default
          stylix.nixosModules.stylix
          agenix.nixosModules.default
          disko.nixosModules.disko
          nixos-hardware.nixosModules.lenovo-thinkpad-t480s
          {nixpkgs.overlays = [nur.overlays.default];}
        ];
      };
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./machines/laptop
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
          home-manager.nixosModules.default
          stylix.nixosModules.stylix
          agenix.nixosModules.default
          jovian.nixosModules.default
          {nixpkgs.overlays = [nur.overlays.default];}
        ];
      };
    };
  };
}
