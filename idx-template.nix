{ pkgs, ... }: {
  packages = [
    pkgs.bun
  ];
  bootstrap = ''
    bun init
    bun add @stricjs/router @stricjs/utils
    mkdir -p "$WS_NAME/.idx/"
    cp -rf ${./dev.nix} "$WS_NAME/.idx/dev.nix"
    chmod -R +w "$WS_NAME"
    mkdir -p "$WS_NAME/src/"
    mkdir -p "$WS_NAME/src" && \
echo "import { init } from '@stricjs/app';

// Initialize and serve the application with a concise syntax
init({ routes: ['./src'] });" > "$WS_NAME/index.ts" && \
echo "import { routes } from '@stricjs/app';
import { text, json } from '@stricjs/app/send';

// Define and export your routes
export default routes()
    .get('/', () => text('Welcome to Stric!'))
    .post('/json', ctx => ctx.json().then(json));" > "$WS_NAME/src/main.routes.ts"


  '';
}

{ pkgs, manager ? "npm", ... }: {
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