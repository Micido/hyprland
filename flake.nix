{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		hyprland = {
			url = "github:hyprwm/Hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# hyprland-scroll-overview = {
		# 	url = "github:yayuuu/hyprland-scroll-overview/new-release";
		# 	inputs.hyprland.follows = "hyprland";
		# 	inputs.nixpkgs.follows = "nixpkgs";
		# };

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
			in {
				default = inputs.wrapper.wrappers.hyprland.wrap {
					inherit pkgs;
					package = inputs.hyprland.packages.${system}.default;
					configFile = ./hyprland.lua;
					lua.dirs = [ ./lua ];
					plugins = [ inputs.hyprland-scroll-overview.packages.${system}.default ];
				};
			}
		);
	};
}
