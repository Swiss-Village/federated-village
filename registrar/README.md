# registrar

Services and components that implement federation, instance discovery, and identity helpers. Typical responsibilities:

- WebFinger and federation discovery helpers
- Actor / inbox endpoints for an ActivityPub PoC
- Registrar UI or API for instance management

Suggested stack

- Ruby on Rails for rapid web/API development
- Database: PostgreSQL

Example dev commands (Rails)

```bash
# install gems
bundle install

# create & migrate database
rails db:create db:migrate

# run dev server
rails server

# run tests
bundle exec rspec # or rails test
```

Notes

- Keep federation logic and protocol details documented in `docs/` and include privacy considerations.
- For ActivityPub endpoints, implement clear test coverage and example interactions (inbox, outbox, actor JSON-LD).
