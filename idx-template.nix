{ pkgs, ... }: {
  packages = [
    pkgs.bun
  ];
  bootstrap = ''

    mkdir "$out"
    mkdir "$out/src"
    mkdir -p "$out/.idx/"
    cp -rf ${./dev.nix} "$out/.idx/dev.nix"
    shopt -s dotglob; cp -r ${index.ts}/* "$out"
    shopt -s dotglob; cp -r ${main.routes.ts}/* "$out/src/"
    bun init
    bun i @stricjs/app @stricjs/utils
    chmod -R +w "$out"
    chmod +rwx "$out/index.ts"
    chmod +rwx "$out/src/main.routes.ts"
    
  '';
}