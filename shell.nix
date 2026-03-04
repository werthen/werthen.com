with (import <nixpkgs> {}); let
  env = bundlerEnv {
    name = "werthen.com";
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in
  stdenv.mkDerivation {
    name = "werthen.com";
    buildInputs = [env ruby];

    shellHook = ''
      exec ${env}/bin/jekyll serve --watch
    '';
  }
