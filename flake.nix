{
  description = "Hyprland configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

		hyprland = {
			url = "github:hyprwm/Hyprland/v0.55.0";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprland-scroll-overview = {
			url = "github:yayuuu/hyprland-scroll-overview";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.hyprland.follows = "hyprland";
		};

		wrapper = {
			url = "github:BirdeeHub/nix-wrapper-modules";
			inputs.nixpkgs.follows = "nixpkgs";
		};
  };

	outputs = { self, nixpkgs, ... } @ inputs : let
    supportedSystems = [ "x86_64-linux" "aarch64-linux" ];

    forAllSystem = f: nixpkgs.lib.genAttrs supportedSystems ( system: f ( import nixpkgs { inherit system; } ) );
	in {
		packages = forAllSystem (
			pkgs : let

				system = pkgs.stdenv.hostPlatform.system;

				hyprland-pkg = inputs.hyprland.packages.${system}.default;

				hyprland-plugins = [
					inputs.hyprland-scroll-overview.packages.${system}.default
				];

			in {
				default = inputs.wrapper.wrappers.hyprland.wrap {
					inherit pkgs;
					package = hyprland-pkg;
					configFile = ./hyprland.lua;
					lua.dirs = [ ./lua ];
					plugins = hyprland-plugins;
				};
			}
		);
	};
}
