# Learn Turbo

The point of this repo is to build an Elm project with tests and a TypeScript wrapper, along with hot reloading with elm-watch, to figure out how all these pieces fit together.

Running a build command executes npm commands using the Turbo graph, which works as you'd expect.
A production build just does a few different things, but is more or less the same.

The complexity shows up with the dev servers.
When you run `turbo dev`, it starts:

1. `browsersync`, which is configured to refresh the browser or do hot-reload for CSS for all assets but the Elm js
2. `html`, a `nodemon` process to continually copy changed HTML bootstrap code into `dist`
3. `css`, a `nodemon` process to automatically compile SCSS to CSS in `dist` (although I think `scss` might have a watcher? That'd be fine to switch to.)
4. `elm`, which runs the `elm-watch` server
5. `ts`, which runs `tsc --watch` to compile bootstrap JS

All those happen to work well enough together on file reloads that there's no custom code needed to plumb them all together.
As a bonus, they all happen to handle disconnect/reconnect gracefully, which makes restarting the server for config changes really straightforward.
