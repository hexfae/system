{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    ucodenix.url = "github:e-tho/ucodenix";
    nixos-facter-modules.url = "github:nix-community/nixos-facter-modules";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    agenix = {
      url = "github:yaxitech/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    mkSystem = {
      hostname,
      extraModules ? [],
    }:
      nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules =
          [
            ./common
            ./hardware
            ./desktops
            ./programs
            ./services
            ./hosts/${hostname}
            inputs.stylix.nixosModules.stylix
            inputs.chaotic.nixosModules.default
            inputs.home-manager.nixosModules.default
            inputs.nixos-facter-modules.nixosModules.facter
            inputs.agenix.nixosModules.default
            {config.facter.reportPath = ./hosts/${hostname}/facter.json;}
            {networking.hostName = "${hostname}";}
          ]
          ++ extraModules;
      };
  in {
    nixosConfigurations = {
      desktop = mkSystem {
        hostname = "desktop";
        extraModules = [
          inputs.ucodenix.nixosModules.default
          # inputs.niri.nixosModules.niri
        ];
      };
      thinkpad = mkSystem {hostname = "thinkpad";};
    };
  };
}
