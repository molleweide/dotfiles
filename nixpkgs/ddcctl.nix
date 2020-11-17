{pkgs ? import <nixpkgs> {}}:

pkgs.stdenv.mkDerivation rec {
  pname = "ddcctl";
  version = "efb00bd";

  src = pkgs.fetchFromGitHub {
    owner = "kfix";
    repo = "ddcctl";
    rev = version;
    sha256 = "sha256:0z28kz2wfgcns9x8yqn2fhsyli0n48mipdh8qhv2446ya1zilydn";
  };

  buildInputs = [
    pkgs.darwin.apple_sdk.frameworks.ApplicationServices
    pkgs.darwin.apple_sdk.frameworks.AppKit
    pkgs.darwin.apple_sdk.frameworks.Foundation
    pkgs.darwin.IOKit
  ];

  buildPhase = "make amd";
  installPhase = ''
    mkdir -p $out/bin
    cp ddcctl $out/bin
  '';
}
