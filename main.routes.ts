import { routes } from '@stricjs/app';
import { text, json } from '@stricjs/app/send';

// Define and export your routes
export default routes()
    .get('/', () => text('Welcome to Stric!'))
    .post('/json', ctx => ctx.json().then(json));