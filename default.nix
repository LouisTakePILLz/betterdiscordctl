{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  src = ./.;
  pname = "betterdiscordctl";
  version = "1.0.0";
  buildInputs = with pkgs; [ makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin
    cp betterdiscordctl $out/bin/
    wrapProgram $out/bin/betterdiscordctl --add-flags "--nix"
  '';
}
