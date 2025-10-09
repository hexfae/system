{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix.url = "github:yaxitech/ragenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    jovian.url = "github:Jovian-Experiments/Jovian-NixOS";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    harry.url = "/home/hexfae/dox/rust/ultimate_harry";
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    agenix,
    nixos-hardware,
    nur,
    chaotic,
    zen-browser,
    niri,
    home-manager,
    jovian,
    disko,
    harry,
    stylix,
  } @ inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules =
          [
            ./modules
            ./common
            ./hosts/desktop
            chaotic.nixosModules.default
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
          ./hosts/server
          home-manager.nixosModules.default
          stylix.nixosModules.stylix
          agenix.nixosModules.default
          disko.nixosModules.disko
          harry.nixosModules.default
          {nixpkgs.overlays = [nur.overlays.default];}
        ];
      };
      thinkpad = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./hosts/thinkpad
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
          ./hosts/laptop
          home-manager.nixosModules.default
          stylix.nixosModules.stylix
          agenix.nixosModules.default
          {nixpkgs.overlays = [nur.overlays.default];}
        ];
      };
      deck = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./hosts/deck
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
