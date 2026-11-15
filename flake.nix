{
  description = "por-cli — terminal video search and playback helper";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          default = pkgs.callPackage ./nix/package.nix { };
        }
      );

      apps = forAllSystems (system: {
        default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/por-cli";
          meta = {
            description = "Terminal video search and playback helper";
            mainProgram = "por-cli";
          };
        };
      });

      homeManagerModules.default = import ./nix/hm-module.nix { inherit self; };
      nixosModules.default = import ./nix/nixos-module.nix { inherit self; };

      checks = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          pkg = self.packages.${system}.default;
        in
        {
          bashSyntax = pkgs.runCommand "por-cli-bash-syntax" { } ''
            ${pkgs.bash}/bin/bash -n ${pkg}/bin/por-cli
            touch $out
          '';
        }
      );
    };
}
