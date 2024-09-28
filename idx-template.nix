{ pkgs, ... }: {
  packages = [
    pkgs.bun
  ];
  bootstrap = ''

    mkdir "$out"
    mkdir -p "$out/.idx/"
    mkdir -p "$out/src/"
    cp -rf ${./dev.nix} "$out/.idx/dev.nix"
    shopt -s dotglob; cp -r ${./dev}/* "$out"
    shopt -s dotglob; cp -r ${./devsrc}/* "$out/src/"
    bun init
    bun add @stricjs/router @stricjs/utils
    chmod -R +w "$out"
    chmod +rwx "$out/index.ts"
    chmod +rwx "$out/src/main.routes.ts"
  '';
}
