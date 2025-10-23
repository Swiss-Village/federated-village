# website

Public website and admin UI. This project uses Ruby on Rails for server-rendered pages, admin interfaces, and APIs.

Suggested stack

- Ruby on Rails (latest stable) with Hotwire/Turbo for progressive enhancement, or Rails + React where needed.
- Database: PostgreSQL
- Styling: Tailwind CSS or plain Rails asset pipeline

Example dev commands (Rails)

```bash
# install gems
bundle install

# install JS deps if using importmap/webpack/JS
pnpm install # or pnpm install

# create & migrate database
rails db:create db:migrate

# run dev server
rails server

# run tests
bundle exec rspec # or rails test
```

Notes

- Document environment variables, credentials, and any CMS/data sources in this README.
- Admin UI can live under `app/controllers/admin` or as a separate Rails engine if you prefer.
