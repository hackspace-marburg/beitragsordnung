with import <nixpkgs> {};

let
  texliveComb = texlive.combine {
    inherit (texlive) scheme-small german IEEEtran;
  };
in stdenv.mkDerivation {
  name = "beitragsordnung-hsmr";
  src = ./.;

  nativeBuildInputs = [texliveComb];

  buildPhase = "pdflatex beitragsordnung.tex";
  installPhase = "cp beitragsordnung.pdf $out";
}
