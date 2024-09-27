{ pkgs, ... }: {
  packages = [
    pkgs.bun
  ];
  bootstrap = ''

    mkdir "$out"
    mkdir -p "$out/.idx/"
    cp -rf ${./dev.nix} "$out/.idx/dev.nix"
    shopt -s dotglob; cp -r ${./dev}/* "$out"
    bun init
    bun add @stricjs/router @stricjs/utils
    chmod -R +w "$out"
    chmod +rwx "$out/index.ts"
    
  '';
}