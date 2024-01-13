{ pkgs ? import <nixpkgs> {} }:
pkgs.rustPlatform.buildRustPackage rec {
	pname = "evremap";
	version = "0.0.0";

	cargoHash = "sha256-7u7TdYsaLctEXd2uOJ7b3w4eQ+2F8UPjRI6TbQL1dP8=";
	src = pkgs.fetchFromGitHub {
		owner = "wez";
		repo = "evremap";
		rev = "d0e8eb231fdeaf9c6457b36c1f04164150a82ad0";
		sha256 = "sha256-FRUJ2n6+/7xLHVFTC+iSaigwhy386jXccukoMiRD+bw=";
	};

	nativeBuildInputs = [ pkgs.pkg-config ];
	buildInputs = [ pkgs.libevdev ];
}
