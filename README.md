# Federated Village — Swiss‑Village Monorepo

Federated Village is the monorepo for Swiss‑Village: a federated, privacy‑first e‑government platform for Swiss municipalities and villages. This repository contains the core packages and apps used to build the system — backend, website, mobile apps, shared libraries, and documentation — organised as a monorepo for easier development and consistency.

This README gives a high-level overview of the monorepo layout, goals, and how to get started as a contributor.

## Vision

- Federated server system: municipalities may self-host an instance, or use a centrally managed hosting option.
- Public website and admin UI: public-facing content for residents and administrative interfaces for municipality staff.
- Native mobile apps: modern Android and iOS applications that mirror website content, provide push notifications and offline access.
- Open source & auditable: code is public so communities can verify there is no hidden tracking or telemetry.

Federation enables portability of identities and data between instances while preserving local governance. Public code ensures transparency and trust.

## Monorepo layout

The repository follows a simple multi-package structure. At the top-level you'll find these directories (create or rename as needed):

- `shared` — shared libraries and components (UI components, types, utilities, API clients). Put cross-cutting code here so `website` and `mobile-client` can reuse it.
- `mobile-client` — mobile app source (React Native or Flutter). Should include a minimal app shell, auth, and content consumption flows.
- `website` — public website and admin UI (Next.js / React recommended). Server-side rendering friendly for SEO and municipality sites.
- `registrar` — federation/identity and instance services (the registrar/federation pieces that manage cross-instance discovery, WebFinger, etc.).
- `docs` — design docs, RFCs, architecture diagrams, contributor guides, and developer quickstarts.

Each top-level package should include its own README with package-specific setup and development commands. Consider standardizing on a package manager and workspace tool (pnpm workspaces, yarn workspaces, or npm workspaces) and a consistent build/test script surface.

## Short-term goals (MVP)

1. Minimal, privacy-preserving MVP: directory, news, events, forms, and account management.
2. PoC federated server implementing a well-known protocol so instances can follow/subscribe to each other.
3. Secure, minimal admin UI for municipality staff.
4. Mobile app shell capable of consuming public content and authenticating users.

## Technology suggestions

- Federation protocol: ActivityPub for content federation and account discovery. Consider Matrix for real-time chat later.
-- Backend: TypeScript + Node.js (NestJS or Fastify), Rust (Actix/axum), or Ruby on Rails for server-driven web apps. PostgreSQL recommended for storage, Redis for ephemeral data.
-- API: REST or GraphQL with a published OpenAPI spec.
-- Web frontend: Ruby on Rails for the website/admin UI (server-rendered) or React/Next.js if a separate SPA is preferred.
-- Mobile: Flutter for a single codebase targeting iOS and Android.
- Packaging & deployment: Docker for local/self-hosted installs; provide Kubernetes manifests for production hosting if desired.

These suggestions are starting points; final choices should be documented in `docs/` and agreed during design/RFC phases.

## Getting started (developer)

1. Clone the monorepo and install dependencies (example using pnpm workspaces):

```bash
# from repository root
pnpm install
```

2. Install git hooks (if present):

```bash
sh .github/scripts/install-hooks.sh
```

3. Start the relevant package in dev mode (examples — adjust per package):

```bash
# website
pnpm --filter website dev

# mobile client (Metro / RN CLI or Flutter)
pnpm --filter mobile-client start

# run backend/registrar
pnpm --filter registrar dev
```

Each package should document its own run and build steps in its package README.

## Contribution & code of conduct

We welcome contributions. Please read the top-level `.github/CONTRIBUTING.md` and `CODE_OF_CONDUCT.md` before opening issues or PRs. For larger design changes, open an RFC issue and tag it with `RFC`.

Quick contributor steps:

1. Fork and clone the repo.
2. Create a branch from `main` (e.g., `feature/your-feature`).
3. Make small, focused commits with clear messages. Sign commits off if your project uses DCO: `git commit -s -m "..."`.
4. Open a PR and reference related issues.

CI must be green before merging. Add tests for new behavior and include migration notes when applicable.

## Privacy principles

- Minimal data collection: store only fields required to provide services.
- No default cross-instance tracking or telemetry; any telemetry must be explicit and opt-in.
- Clear export and deletion paths for user data to enable portability and compliance.

## Roadmap (high-level)

- MVP (months 0–3): backend API, public website, admin UI, PoC ActivityPub actor/inbox, mobile app shell.
- Phase 2 (months 3–9): account portability, federation discovery (WebFinger), user migration flows, offline mobile sync.
- Phase 3 (months 9+): hardened deployments, multi-tenant hosting, advanced forms/workflows, optional integration with Swiss identity services.

## Where to get involved

- Open issues and feature requests in the main repository.
- Propose designs via RFC issues or draft PRs.
- Join working groups for federation, privacy/compliance, and mobile UX.

---

If you want, I can also scaffold minimal READMEs inside each package folder (`shared`, `mobile-client`, `website`, `docs`, `registrar`) with example dev commands and suggested tech choices. Tell me if you want that created now.

## Repository resources (central `.github` repo)

This monorepo uses a centralized `.github` repository maintained at `https://github.com/Swiss-Village/.github` which stores community and governance documents shared across Swiss-Village projects. Key files available in that repo:

- `CONTRIBUTING.md` — contribution guidelines and developer setup
- `CODE_OF_CONDUCT.md` — community conduct expectations
- `PRIVACY.md` — privacy principles and data handling guidance
- `GOVERNANCE.md` — project governance recommendations
- `COMMIT_CONVENTIONS.md` (under `conventions/`) — commit message hooks & guidelines
- `scripts/install-hooks.sh` and `conventions/hooks/commit-msg` — repository hook installer and commit hooks

Please consult that repository for up-to-date contribution and governance rules. Example URL: https://github.com/Swiss-Village/.github
