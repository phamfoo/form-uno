{
  description = "form uno qmk firmware";

  inputs = {

    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};

      in {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.qmk
            pkgs.picotool
          ];

          shellHook = ''
            echo "qmk"
          '';
        };
      });
}
