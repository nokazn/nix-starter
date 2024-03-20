{
  description = "nix-starter";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs
    , flake-utils
    , ...
    }: flake-utils.lib.eachDefaultSystem
      (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = with pkgs; pkgs.mkShell {
          buildInputs = [
            nixpkgs-fmt
          ];
        };
      }) // {
      templates = {
        rust = {
          path = ./rust;
          description = "Rust minimum starter";
        };
      };
    };
}
