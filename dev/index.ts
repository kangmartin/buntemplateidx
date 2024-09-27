import { Router } from '@stricjs/router';

export default new Router()
  .get('/', () => new Response('Hi'));