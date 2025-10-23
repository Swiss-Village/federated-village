# shared

Shared libraries and components used across the monorepo. Typical contents:

- UI components
- TypeScript types and interfaces
- API clients and helpers
- Utility functions

Suggested tools

- Language: TypeScript
- Package layout: package folder with its own `package.json` (or a monorepo package managed by workspaces)

Example dev commands (adjust to your workspace tool)

```bash
# install dependencies from repo root
pnpm install

# run tests for shared package
pnpm --filter shared test

# build
pnpm --filter shared build
```

Recommendations

- Keep this package small and focused. Avoid large runtime dependencies.
- Publish stable, versioned APIs for the website and mobile client to consume.
