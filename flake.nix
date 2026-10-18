{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		hyprland = {
			url = "github:hyprwm/Hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprland-scroll-overview = {
			url = "github:yayuuu/hyprland-scroll-overview";
			inputs.hyprland.follows = "hyprland";
		};

		wrapper = {
			url = "github:BirdeeHub/nix-wrapper-modules";
			inputs.nixpkgs.follows = "nixpkgs";
		};
  };

	outputs = { self, nixpkgs, wrapper, ... } @ inputs : let
    supportedSystems = [ "x86_64-linux" "aarch64-linux" ];

    forAllSystem = f: nixpkgs.lib.genAttrs supportedSystems ( system: f ( import nixpkgs { inherit system; } ) );
	in {
		packages = forAllSystem (
			pkgs : {
				default = wrapper.wrappers.hyprland.wrap {
					inherit pkgs;
					configFile = ./hyprland.lua;
				};
			}
		);
	};
}
