{ pkgs, ... }: {
  packages = [
    pkgs.bun
  ];
  bootstrap = ''

    mkdir "$out"
    mkdir -p "$out/.idx/"
    cp -rf ${./dev.nix} "$out/.idx/dev.nix"
    shopt -s dotglob; cp -r ${./dev}/* "$out"
    bun add express
    chmod -R +w "$out"
    chmod +rwx "$out/server.ts"
  '';
}
