{ pkgs, inputs, services, ... }:
{
  home.packages = with pkgs; [
    ## Lsp
    nixd # nix

    ## formating
    shfmt
    treefmt
    nixfmt-rfc-style

    ## C / C++
    gcc
    gdb
    gef
    cmake
    gnumake
    valgrind
    llvmPackages_20.clang-tools

    #Nodejs
    nodejs

    #python
    (python3.withPackages (ps: with ps; [
      pytz
    ]))
  ];

 

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
