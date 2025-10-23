
# Website (Rails) — README

Short, focused instructions to run and develop the `website` Rails application
locally and an overview of common tasks. This README assumes you are working
from the repository root or inside the `website/` folder.

## Quick summary / contract

- Inputs: source code in this repository, local system with Ruby, Node/PNPM, and
	system libraries for SQLite/puma.
- Outputs: a running Rails server (development), compiled JS/CSS assets, and a
	testable codebase (RSpec).
- Success: `bin/rails server` (via the dev foreman script) boots, JS/CSS build
	runs, and `bundle exec rspec` passes locally for changed specs.

## Prerequisites

- macOS (other Unix-like OS should be similar)
- Ruby ~> 3.x (use the project's Gemfile to pick an exact ruby version if
	specified elsewhere). The app uses Rails ~> 8.0.3.
- Node.js and pnpm (the repo uses pnpm to run frontend tasks declared in
	`package.json`).
- SQLite3 (development/test database). The Gemfile declares `sqlite3`.
- PostgreSQL or other DB is not required for local dev unless you change
	`config/database.yml`.

Install common tools if you don't have them:

```bash
# install pnpm (if you use Homebrew)
brew install pnpm

# install rbenv/ruby-build or use your Ruby manager of choice, then install Ruby
# example with rbenv:
rbenv install 3.2.2
rbenv local 3.2.2

# install bundler
gem install bundler
```

## Setup (first time)

1. From repository root, install Ruby gems:

```bash
cd website
bundle install
```

2. Install JS dependencies (pnpm):

```bash
pnpm install
```

3. Prepare the database (SQLite used by default):

```bash
bin/rails db:create db:migrate db:seed
```

4. Build front-end assets (once):

```bash
pnpm run build
pnpm run build:css
```

Notes:
- The repo uses `esbuild` and Tailwind via scripts defined in
	`website/package.json`:
	- `pnpm run build` — bundles JS into `app/assets/builds`
	- `pnpm run build:css` — compiles Tailwind input to
		`app/assets/builds/application.css`

## Development (run locally)

The project includes a `Procfile.dev` with three processes (web, js, css).
The package.json includes an npm script that starts `foreman` (via `dev`).

From `website/` run:

```bash
pnpm run dev
```

This runs `foreman start -f Procfile.dev` and will:

- start the Rails server (web)
- watch & build JS (`pnpm build --watch`) (js)
- watch & build Tailwind CSS (`pnpm build:css --watch`) (css)

Open http://localhost:3000 in your browser.

If you prefer separate terminals:

```bash
# Terminal A: Rails server
bin/rails server

# Terminal B: JS watcher
pnpm build --watch

# Terminal C: CSS watcher
pnpm build:css --watch
```

## Testing

Run specs with RSpec (declared in package.json as `test`):

```bash
pnpm test
# or
bundle exec rspec
```

Feature/system tests use Capybara + Selenium (see Gemfile test group).

## Common tasks

- Run migrations: `bin/rails db:migrate`
- Create/seed the DB: `bin/rails db:setup` or `bin/rails db:seed`
- Run console: `bin/rails console`
- Background jobs (Sidekiq): the app uses Sidekiq; to run in development:

```bash
# run sidekiq (ensure Redis is available if configured)
bundle exec sidekiq
```

## Environment & configuration notes

- Dev environment loads development gems like `web-console`, `letter_opener`,
	and debugging tools as listed in the `Gemfile`.
- The app uses `propshaft` for asset handling, `jsbundling-rails` and
	`cssbundling-rails` integration, Turbo, Stimulus, and ViewComponent.
- If you need to change DB adapter or credentials, update
	`config/database.yml` and any credentials in `config/credentials.yml.enc`.

## Deployment notes

- The repository contains a `Dockerfile` and `Procfile.dev` in the root for
	platform-specific deployment. The site is a standard Rails app; adapt your
	deployment pipeline to install Node & pnpm then run the build steps:

	- `pnpm run build`
	- `pnpm run build:css`
	- `bundle exec rails assets:precompile` (if you add that step)

- The project includes gems like `kamal` and `thruster` which are used for
	orchestration and process management in some environments — check project
	docs if you plan to use them.

## Troubleshooting

- If JS/CSS assets do not load, ensure `app/assets/builds/` contains the
	built files; re-run `pnpm run build`.
- If `bundle install` fails, check your Ruby version and native extensions for
	gems like `sqlite3` (on macOS install `sqlite` via Homebrew).
- If Sidekiq fails to start, confirm Redis is running and accessible.

## Files of interest

- `Gemfile` — Ruby dependencies
- `package.json` — JS tooling scripts (esbuild, tailwind)
- `Procfile.dev` — local dev processes (web, js, css)
- `app/javascript` — frontend JS entrypoints
- `app/assets/stylesheets/application.tailwind.css` — Tailwind input

## Contributing

Follow the mono-repo contribution guidelines at the repository root.

## Contact / Support

If you need help running the website locally, open an issue in the repo or
contact the maintainers listed in repository metadata.

---

Last updated: 2025-10-23

