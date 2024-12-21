{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    naersk = {
      url = "github:nix-community/naersk";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nitro-util = {
      url = "github:monzo/aws-nitro-util";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    oyster = {
      url = "github:marlinprotocol/oyster-monorepo";
    };
  };

  outputs = { self, nixpkgs, fenix,
    naersk,
    nitro-util,
    oyster }: {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
