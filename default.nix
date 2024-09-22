{ stdenv }:

stdenv.mkDerivation rec {
  pname = "git-diffie";
  version = "0.1";

  src = ./.;

  installPhase = ''
    mkdir -p $out/bin
    cp $src/git-diffie $out/bin
  '';
}
