{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-facter-modules.url = "github:nix-community/nixos-facter-modules";
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
      url = "github:FlameFlag/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    preservation.url = "github:nix-community/preservation";
    # harry.url = "/home/hexfae/dox/rust/ultimate_harry";
    "hexfaedotdev" = {
      url = "github:hexfae/hexfae.dev";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    vars = import ./vars.nix;
    mkSystem = {hostname}:
      nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs vars;};
        modules = [
          ./common
          ./desktops
          ./programs
          ./services
          ./networking
          ./hosts/${hostname}
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.default
          inputs.nixos-facter-modules.nixosModules.facter
          inputs.agenix.nixosModules.default
          inputs.disko.nixosModules.disko
          # inputs.harry.nixosModules.default
          inputs.preservation.nixosModules.preservation
          {config.facter.reportPath = ./hosts/${hostname}/facter.json;}
          {networking.hostName = "${hostname}";}
        ];
      };
  in {
    nixosConfigurations = {
      desktop = mkSystem {hostname = "desktop";};
      thinkpad = mkSystem {hostname = "thinkpad";};
      server = mkSystem {hostname = "server";};
    };
  };
}
