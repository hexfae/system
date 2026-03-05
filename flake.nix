# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs = {
    agenix = {
      inputs = {
        home-manager = {
          follows = "home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
      url = "github:ryantm/agenix";
    };
    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };
    elephant = {
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
      url = "github:abenz1267/elephant";
    };
    flake-file.url = "github:vic/flake-file";
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
      url = "github:hercules-ci/flake-parts";
    };
    hexfaedotdev = {
      flake = false;
      url = "github:hexfae/hexfae.dev";
    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    import-tree.url = "github:vic/import-tree";
    niri-flake = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:sodiboo/niri-flake";
    };
    nix-index-database = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nix-index-database";
    };
    nixcord = {
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:FlameFlag/nixcord";
    };
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
    nixpkgs-lib.follows = "nixpkgs";
    noctalia-shell = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:noctalia-dev/noctalia-shell";
    };
    nur = {
      inputs = {
        flake-parts = {
          follows = "flake-parts";
          inputs.nixpkgs-lib.follows = "nixpkgs";
        };
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:nix-community/NUR";
    };
    preservation.url = "github:nix-community/preservation";
    secrets = {
      flake = false;
      url = "path:./secrets";
    };
    stylix = {
      inputs = {
        flake-parts = {
          follows = "flake-parts";
          inputs.nixpkgs-lib.follows = "nixpkgs";
        };
        nixpkgs.follows = "nixpkgs";
        nur = {
          follows = "nur";
          inputs = {
            flake-parts.follows = "nixpkgs";
            nixpkgs.follows = "nixpkgs";
          };
        };
        systems.follows = "systems";
      };
      url = "github:nix-community/stylix";
    };
    systems.url = "github:nix-systems/default";
    walker = {
      inputs = {
        elephant = {
          follows = "elephant";
          inputs = {
            nixpkgs.follows = "nixpkgs";
            systems.follows = "systems";
          };
        };
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
      url = "github:abenz1267/walker";
    };
    zen-browser = {
      inputs = {
        home-manager = {
          follows = "home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:0xc000022070/zen-browser-flake";
    };
  };

}
