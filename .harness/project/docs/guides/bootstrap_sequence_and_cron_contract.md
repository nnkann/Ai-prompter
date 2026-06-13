---
title: PHE bootstrap sequence and cron execution contract
description: Restores the missing front-of-pipeline implementation order: Supabase project/bootstrap, Drive setup, endpoint/bot boundary, and Hermes cron job creation gates.
domain: execution
c: "PHE cannot skip directly from product ideas to mid-pipeline schema/cron design. Supabase project creation, secrets, Drive folders, endpoint boundaries, and Hermes cron gates must be defined before creating scheduled jobs."
problem: [P1, P2, P3]
s: [S1, S2, S3]
tags: [bootstrap, supabase, cron, hermes, sequencing, execution]
relates-to:
  - path: ../PRD.md
    rel: governs
  - path: ./source_discovery_cps_schema_cron_policy.md
    rel: details
  - path: ./agent_boundary_and_learning_architecture.md
    rel: details
  - path: ../../cron/phe_cron_jobs.yaml
    rel: specifies
  - path: ../../../../supabase/migrations/202606100001_phe_core_schema.sql
    rel: implements
status: completed
created: 2026-06-10
updated: 2026-06-10
---

# PHE bootstrap sequence and cron execution contract

## Correction

The previous planning jumped too far into the middle. The correct order is:

```text
0. Owner decisions and accounts
1. Supabase project creation
2. Local Supabase migration and schema verification
3. Google Drive team folder and service account access
4. PHE endpoint/bot boundary
5. Discord channel/bot installation
6. Manual intake happy path
7. Hermes cron scripts and job creation
8. Daily discovery / learning / digest automation
9. Dashboard/Sites reporting
```

Cron jobs should not be created before the database, Drive folder, Discord channel IDs, endpoint secret, and runnable scripts exist.

## Scheduler decision

Supabase is the DB/vector store for MVP, not the scheduler.

```text
MVP scheduler: Hermes cron
MVP database/vector store: Supabase + pgvector
MVP media/artifact store: Google Drive
MVP public/team interface: PHE Discord collector/request bot
```

Hermes cron is appropriate for MVP because it already supports durable schedules, project workdir, skills, scripts, and delivery. It should be treated as the **control-plane scheduler** that runs PHE scripts/endpoints. It must not expose the owner personal Hermes gateway to team members.

Promotion rule:

```text
If PHE cron needs independent uptime, team-owned ops, or non-owner deployment,
move the same job contract to GitHub Actions, Cloud Run Scheduler, a VPS cron,
or a dedicated worker. Do not encode business logic only in Hermes prompts.
```

## Supabase project prerequisite

Before creating cron jobs, create or select a Supabase project manually in the Supabase dashboard or via authenticated CLI.

Current local status checked on 2026-06-10:

```text
supabase CLI: installed via Homebrew at /opt/homebrew/bin/supabase, version 2.105.0
repo migration directory: created at supabase/migrations/
Supabase CLI project config: initialized at supabase/config.toml
Supabase CLI linked project: wiwfrlhztyvkzxpycbuc / ai-prompter
core schema migration: supabase/migrations/202606100001_phe_core_schema.sql
current migration blocker: `supabase db push --linked` attempts direct IPv6 Postgres on this network; use IPv4 pooler URL from `supabase/.temp/pooler-url` plus `SUPABASE_DB_PASSWORD` for migrations
```

Created Supabase project:

```text
Project name: ai-prompter
Project ref: wiwfrlhztyvkzxpycbuc
Region: ap-southeast-2
Project URL: https://wiwfrlhztyvkzxpycbuc.supabase.co
Automatic RLS: expected enabled per setup decision; verify in Supabase table/policy UI after migration
```

Required project settings:

```text
Extensions: pgcrypto, vector
Auth: not required for MVP unless dashboard user login is added
Storage: not Supabase storage for MVP; Google Drive is media store
```

Secrets must live in runtime env, not repo:

```text
PHE_SUPABASE_URL
PHE_SUPABASE_SERVICE_ROLE_KEY
PHE_GOOGLE_DRIVE_FOLDER_ID
PHE_GOOGLE_SERVICE_ACCOUNT_JSON
PHE_DISCORD_BOT_TOKEN
PHE_DISCORD_GUILD_ID
PHE_DISCORD_OUTPUT_CHANNEL_ID
PHE_INTERNAL_ENDPOINT_SECRET
```

## Bootstrap gates

### Gate 0 — account/ownership decisions

Owner must decide:

- Supabase organization/account to use.
- Project name and region.
- Google Drive parent folder owner.
- Whether Google service account or Apps Script identity owns uploads.
- Discord application/bot name for PHE collector/request surface.
- Initial source/review/output channel names.

Exit criteria:

```text
OWNER_ACCOUNT_SCOPE_DECIDED
PROJECT_NAME_DECIDED
DRIVE_OWNER_DECIDED
DISCORD_APP_BOUNDARY_DECIDED
```

### Gate 1 — Supabase project exists

Create project and obtain URL/service role secret outside repo.

Exit criteria:

```text
SUPABASE_PROJECT_CREATED
SUPABASE_URL_AVAILABLE_IN_RUNTIME_ENV
SUPABASE_SERVICE_ROLE_AVAILABLE_IN_RUNTIME_ENV
```

Do not paste secrets into docs, git, Discord, or Hermes memory.

### Gate 2 — schema migrated

Apply:

```text
supabase/migrations/202606100001_phe_core_schema.sql
```

Expected extensions/tables:

```text
extensions: pgcrypto, vector
tables:
  sources
  assets
  prompt_assets
  cps_clusters
  asset_cluster_links
  team_requests
  feedback_signals
  cron_runs
```

Exit criteria:

```text
PHE_CORE_SCHEMA_APPLIED
PGVECTOR_AVAILABLE
CRON_RUNS_TABLE_AVAILABLE
```

### Gate 3 — Drive folder ready

Create Google Drive folder structure:

```text
PHE/
  references/
  screenshots/
  sample_prompts/
  review_queue/
  exports/
```

Exit criteria:

```text
DRIVE_FOLDER_CREATED
DRIVE_FOLDER_ID_AVAILABLE_IN_RUNTIME_ENV
SERVICE_ACCOUNT_OR_AUTOMATION_IDENTITY_HAS_WRITE_ACCESS
TEAM_HAS_VIEW_ACCESS
```

### Gate 4 — endpoint/bot boundary ready

PHE endpoint/bot may be one small service or serverless function, but must expose only PHE operations:

```text
POST /ingest/manual-discord
POST /ingest/source-result
POST /prompt/team-request
POST /feedback
GET  /dashboard/recent
GET  /health
```

Exit criteria:

```text
PHE_ENDPOINT_SECRET_SET
HEALTH_ENDPOINT_OK
TEAM_BOT_CANNOT_ACCESS_OWNER_HERMES_CONTEXT
```

### Gate 5 — manual intake works before cron

Test a single Discord-submitted link/screenshot path first:

```text
Discord message
→ PHE intake endpoint
→ sources row
→ optional Drive asset
→ optional prompt_assets row
→ Discord reply
```

Exit criteria:

```text
MANUAL_DISCORD_INTAKE_VERIFIED
DEDUPE_VERIFIED
NEEDS_REVIEW_PATH_VERIFIED
```

### Gate 6 — create Hermes cron jobs

Only after Gate 5 should Hermes cron jobs be created from:

```text
.harness/project/cron/phe_cron_jobs.yaml
```

Creation should use `hermes cron create` or the Hermes cron tool with self-contained prompts/scripts. Each job must:

- run from `/Users/kann/projects/Ai-prompter`,
- record a `cron_runs` row,
- be idempotent,
- obey caps and dedupe,
- deliver only summaries, not secrets.

Exit criteria:

```text
HERMES_CRON_JOBS_CREATED
FIRST_MANUAL_RUNS_OK
CRON_RUNS_ROWS_WRITTEN
DISCORD_DIGEST_DELIVERED
```

## Detailed cron inventory

The executable contract lives in:

```text
.harness/project/cron/phe_cron_jobs.yaml
```

MVP jobs:

| Job | Trigger | Runs before Supabase? | Purpose |
|-----|---------|-----------------------|---------|
| `phe_manual_discord_intake` | immediate event/webhook | no | Process team-submitted links/screenshots/files. |
| `phe_artist_daily_watch` | `30 8 * * *` | no | Watch configured artists/accounts/channels daily. |
| `phe_daily_prompt_trend_search` | `0 9 * * *` | no | Find 3-5 hot AI prompt/workflow references. |
| `phe_channel_ingest_reconciliation` | `15 9 * * *` | no | Catch missed Discord source-channel posts. |
| `phe_learning_cluster_update` | `0 10 * * *` | no | Update embeddings, ontology clusters, trend links. |
| `phe_review_queue_digest` | `30 10 * * *` | no | Post low-confidence/blocked item digest. |
| `phe_scheduled_team_prompt_jobs` | `0 11 * * 1-5` | no | Run scheduled team prompt/report jobs. |

## Why cron must be detailed

A cron job is not just a schedule. Each job must define:

```text
name
trigger/schedule
enabled_after gates
runtime script/endpoint
input config
selection/ranking policy
accepted caps
idempotency/dedupe key
output tables
Discord delivery target
failure policy
cron_runs logging
```

Without those, daily jobs will either duplicate data, over-collect noise, or silently fail.

## Next implementation tasks

1. Install or choose Supabase management path:
   - Dashboard manual project creation, or
   - install Supabase CLI and authenticate.
2. Create Supabase project and apply migration.
3. Create Google Drive folder and runtime credential path.
4. Create `.env` locally from `.env.example`; never commit it.
5. Implement PHE endpoint or serverless function health check.
6. Implement manual Discord intake first.
7. Implement cron scripts in the order defined above.
8. Create Hermes cron jobs only after scripts and secrets are verified.

## Acceptance Criteria

- [x] Supabase is explicitly not treated as MVP scheduler.
- [x] Hermes cron is defined as the MVP scheduler/control plane.
- [x] Cron job creation is gated behind Supabase, Drive, Discord, endpoint, and manual intake verification.
- [x] A detailed cron contract file exists.
- [x] A runnable Supabase migration file exists locally.
- [x] The missing front-of-pipeline sequence is documented before implementation continues.
