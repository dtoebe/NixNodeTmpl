let 
  nixpkgs = fetchTarball "github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShell {
  packages = with pkgs; [
    jq
    nodejs_20
    curl
    wget
    git
  ];

  shellHook = ''
    export PATH="$PWD/node_modules/.bin/:$PATH
    alias scripts='jq ".scripts" package.json'
  '';
}
