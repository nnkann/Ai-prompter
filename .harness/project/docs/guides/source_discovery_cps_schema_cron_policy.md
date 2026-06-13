---
title: Source discovery, CPS schema, and cron policy for Prompt-Hermes-Engine
description: Defines free/low-cost source discovery strategy, CPS-shaped Supabase schema, dedupe, and cron collection volume policy.
domain: pipeline
c: "PHE needs automatic discovery from X, YouTube, LinkedIn, web search, selected artist channels, and Discord without paid X API dependency, while preserving CPS traceability and avoiding duplicate low-value ingestion."
problem: [P1, P2, P3]
s: [S1, S2, S3]
tags: [source-discovery, cps, schema, cron, supabase, pgvector, x, google]
relates-to:
  - path: ../PRD.md
    rel: extends
  - path: ./agent_boundary_and_learning_architecture.md
    rel: refines
  - path: ./bot_runtime_strategy.md
    rel: informs
  - path: ./pipeline_contract.md
    rel: refines
  - path: ./bootstrap_sequence_and_cron_contract.md
    rel: governed-by
status: completed
created: 2026-06-10
updated: 2026-06-10
---

# Source discovery, CPS schema, and cron policy for Prompt-Hermes-Engine

## Decisions

1. **Do not use Bing as the source search backend.** Search discovery should prefer Google surfaces or direct platform/source watchers.
2. **Do not depend on paid X API for MVP.** X official API may be revisited after product value is proven, but MVP needs free/low-cost fallback paths.
3. **Use CPS as first-class schema metadata.** Every source and generated prompt asset should carry `c`, `problem`, `s`, acceptance/evidence fields, and cluster links so retrieval can rank by goal and reasoning, not only keyword similarity.
4. **Use conservative cron volume.** Daily web/platform search starts with 2-3 accepted items per platform/topic group, with dedupe and scoring before storage.
5. **Immediate mode is channel/manual-triggered.** Artist watcher runs immediately when a team channel/manual request posts a link or invokes the watcher; broader web/artist search runs daily.

## Free / low-cost X discovery strategy

### Recommended MVP stack

| Priority | Method | Cost | Use case | Risk / limitation |
|----------|--------|------|----------|-------------------|
| 1 | Manual Discord link intake | Free | Team member drops X link/screenshot into PHE channel | Requires human discovery; not enough for daily hot-topic search alone. |
| 2 | Google Alerts / Google Search query monitoring | Free manual/email alert surface | Track public mentions, hot prompt terms, artist names, and indexed X URLs | Google Alerts is email-oriented and may miss fresh or non-indexed X posts. |
| 3 | Google Programmable/Search alternatives if already available | Free quota only for existing Custom Search JSON API customers; not a good new dependency | Structured query automation for Google results | Google docs state Custom Search JSON API is not available for new customers and existing free quota is 100/day until Jan 1 2027. |
| 4 | RSSHub/Nitter-style public mirrors | Free/self-hosted | Best-effort account/timeline RSS if available | Unreliable since X restrictions; public instances can break, rate-limit, or disappear. |
| 5 | twscrape/twikit with dedicated low-risk X accounts | Free software, operational risk | Experimental fallback for specific watched accounts/searches | Requires login/session accounts, may hit anti-bot/human confirmation, duplicate cursors, or ToS risk. Use only after owner approval. |
| 6 | Paid official X API | Paid | Reliable source once value/budget is proven | Deferred for MVP due cost. |

### Practical MVP recommendation

Use a **hybrid no-paid-X path**:

```text
A. Manual/team source intake
   Discord link/image/screenshot → immediate collector run

B. Google-based daily discovery
   Google Alerts or scheduled Google query review for:
     site:x.com AI prompt terms
     artist/account names
     image/video generation workflow terms
     platform-specific hot prompt keywords

C. Direct source enrichment
   If X URL is provided:
     store URL and available oEmbed/public metadata/snippet
     ask for screenshot/full text when blocked
     mark confidence and needs_review

D. Optional experimental watcher
   twscrape/twikit/Nitter/RSSHub only in a quarantined collector profile,
   never with owner personal X account, never with personal Hermes gateway.
```

This gives enough MVP coverage without paying for X API and without relying on brittle scraping as the only path.

## CPS-shaped Supabase minimum schema

The schema should keep CPS fields searchable and joinable. `trend_knowledge_hub` can remain as a compatibility view later, but the minimum normalized MVP should be:

### 1. `sources`

Raw or normalized source item before prompt generation.

```sql
CREATE TABLE sources (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  source_fingerprint TEXT UNIQUE NOT NULL,
  source_platform TEXT NOT NULL CHECK (source_platform IN ('x','youtube','linkedin','discord','web','image','unknown')),
  ingest_mode TEXT NOT NULL CHECK (ingest_mode IN ('manual_discord','artist_watch_cron','channel_ingest_cron','daily_prompt_trend_cron','scheduled_request')),
  origin_url TEXT,
  canonical_url TEXT,
  title TEXT,
  source_text TEXT,
  author_name TEXT,
  author_handle TEXT,
  published_at TIMESTAMPTZ,
  discovered_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  submitted_by TEXT,
  source_payload JSONB NOT NULL DEFAULT '{}'::jsonb,
  c TEXT,
  problem TEXT[] NOT NULL DEFAULT '{}',
  s TEXT[] NOT NULL DEFAULT '{}',
  evidence JSONB NOT NULL DEFAULT '{}'::jsonb,
  confidence TEXT NOT NULL DEFAULT 'medium' CHECK (confidence IN ('high','medium','low')),
  needs_review BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 2. `assets`

Drive-backed images, screenshots, sample prompts, files.

```sql
CREATE TABLE assets (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  source_id UUID REFERENCES sources(id) ON DELETE SET NULL,
  asset_type TEXT NOT NULL CHECK (asset_type IN ('image','screenshot','video','sample_prompt','document','link')),
  drive_file_id TEXT,
  drive_view_url TEXT,
  mime_type TEXT,
  caption TEXT,
  metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 3. `prompt_assets`

Generated reusable prompt record.

```sql
CREATE TABLE prompt_assets (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  source_id UUID REFERENCES sources(id) ON DELETE SET NULL,
  prompt_title TEXT NOT NULL,
  core_prompt TEXT NOT NULL,
  production_specs JSONB NOT NULL DEFAULT '{}'::jsonb,
  source_summary TEXT,
  tags TEXT[] NOT NULL DEFAULT '{}',
  trend_keywords TEXT[] NOT NULL DEFAULT '{}',
  c TEXT,
  problem TEXT[] NOT NULL DEFAULT '{}',
  s TEXT[] NOT NULL DEFAULT '{}',
  acceptance_criteria JSONB NOT NULL DEFAULT '{}'::jsonb,
  evidence JSONB NOT NULL DEFAULT '{}'::jsonb,
  confidence TEXT NOT NULL DEFAULT 'medium' CHECK (confidence IN ('high','medium','low')),
  needs_review BOOLEAN NOT NULL DEFAULT FALSE,
  embedding_text TEXT NOT NULL,
  embedding VECTOR,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 4. `cps_clusters`

Ontology/RAG cluster layer. Clusters can represent artist, style, platform, production use case, model, trend, or prompt pattern.

```sql
CREATE TABLE cps_clusters (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  cluster_type TEXT NOT NULL CHECK (cluster_type IN ('artist','style','platform','use_case','model','trend','prompt_pattern','result_type')),
  name TEXT NOT NULL,
  description TEXT,
  c TEXT,
  problem TEXT[] NOT NULL DEFAULT '{}',
  s TEXT[] NOT NULL DEFAULT '{}',
  keywords TEXT[] NOT NULL DEFAULT '{}',
  embedding VECTOR,
  metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(cluster_type, name)
);
```

### 5. `asset_cluster_links`

Many-to-many links for RAG/ontology retrieval.

```sql
CREATE TABLE asset_cluster_links (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  prompt_asset_id UUID REFERENCES prompt_assets(id) ON DELETE CASCADE,
  source_id UUID REFERENCES sources(id) ON DELETE CASCADE,
  cluster_id UUID NOT NULL REFERENCES cps_clusters(id) ON DELETE CASCADE,
  link_reason TEXT,
  score NUMERIC,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CHECK (prompt_asset_id IS NOT NULL OR source_id IS NOT NULL)
);
```

### 6. `team_requests`

Team-facing prompt request log.

```sql
CREATE TABLE team_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  request_source TEXT NOT NULL CHECK (request_source IN ('discord','slack_later','scheduled')),
  requester_display_name TEXT,
  request_text TEXT NOT NULL,
  input_links TEXT[] NOT NULL DEFAULT '{}',
  input_attachments JSONB NOT NULL DEFAULT '[]'::jsonb,
  retrieval_filters JSONB NOT NULL DEFAULT '{}'::jsonb,
  c TEXT,
  problem TEXT[] NOT NULL DEFAULT '{}',
  s TEXT[] NOT NULL DEFAULT '{}',
  generated_prompt_id UUID REFERENCES prompt_assets(id) ON DELETE SET NULL,
  response_summary TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 7. `feedback_signals`

Usage/preference learning.

```sql
CREATE TABLE feedback_signals (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  prompt_asset_id UUID REFERENCES prompt_assets(id) ON DELETE CASCADE,
  request_id UUID REFERENCES team_requests(id) ON DELETE SET NULL,
  signal_type TEXT NOT NULL CHECK (signal_type IN ('copy','use','rating','revision','reject','favorite')),
  value JSONB NOT NULL DEFAULT '{}'::jsonb,
  actor_display_name TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

## CPS retrieval policy

Prompt retrieval should rank by more than vector similarity:

```text
retrieval_score =
  vector_similarity
  + CPS match(c/problem/s)
  + freshness boost
  + trend keyword match
  + cluster match
  + positive feedback/use boost
  - needs_review penalty
  - duplicate/source uncertainty penalty
```

This lets the team ask for a practical goal and get prompts that match context, problem, solution route, freshness, and prior performance.

## Dedupe policy

### Fingerprint

Create `source_fingerprint` from normalized source identity:

```text
canonical_url if present
else platform + author + published_at + normalized_text_hash
else attachment perceptual hash / file hash + submitted_at bucket
```

Normalize URLs before hashing:

- remove `utm_*`, `fbclid`, `gclid`, tracking params,
- normalize `x.com` / `twitter.com` host where possible,
- strip trailing slash and irrelevant fragments,
- preserve post/status/video IDs.

### Duplicate behavior

| Duplicate type | Action |
|----------------|--------|
| Exact URL/post id already stored | Do not re-ingest; append sighting count/source channel. |
| Same image hash/perceptual hash | Link new request to existing asset; avoid Drive re-upload unless higher quality. |
| Same source but better text/screenshot later | Update evidence and confidence; keep original source row. |
| Same trend from different sources | Keep separate source rows but link to same `cps_cluster`. |

## Cron cadence and collection volume

Supabase does not own these schedules in the MVP. Supabase stores rows, vectors, and `cron_runs`; **Hermes cron owns the MVP schedule/control plane** and invokes PHE scripts/endpoints after the bootstrap gates are satisfied. Detailed job definitions live in `.harness/project/cron/phe_cron_jobs.yaml`.

Do not create Hermes cron jobs until these are true:

```text
SUPABASE_PROJECT_CREATED
PHE_CORE_SCHEMA_APPLIED
DRIVE_FOLDER_CREATED
PHE_ENDPOINT_SECRET_SET
MANUAL_DISCORD_INTAKE_VERIFIED
```

### MVP cadence

| Job | Trigger | Suggested volume | Notes |
|-----|---------|------------------|-------|
| Manual artist/channel link intake | Immediate on Discord post/manual command | All valid manually submitted items | Fast path. Dedupe before analysis. |
| Artist/channel watcher | Daily plus manual immediate trigger | 2-3 accepted new items per platform/group | Watch selected artists/accounts/channels; do not over-collect. |
| Web/source search | Daily | 2-3 accepted items per platform/query family | Google-first; avoid Bing. |
| Daily AI prompt hot-topic search | Daily | 3-5 accepted items total initially | Raise only after quality is proven. |
| Learning cluster update | Daily after collection | All new accepted items | Updates clusters/templates/keywords. |
| Review queue digest | Daily | All low-confidence items, capped in UI | No silent discard. |

### Initial cap recommendation

Start small:

```text
X-like/social references: 2-3/day
YouTube: 2-3/day
LinkedIn/web articles: 2-3/day
Daily AI prompt hot-topic search: 3-5/day total
Manual Discord submissions: no hard cap, dedupe and review-gate instead
```

This keeps review burden manageable while enough data accumulates to test retrieval quality.

## Validation / source notes

- X Developer docs currently present flexible pay-per-use pricing and owned reads, confirming official API is not a zero-cost default for broad discovery.
- Google Search Help confirms Google Alerts can notify when new Google Search results appear for a topic.
- Google Custom Search JSON API docs show historical 100/day free quota for existing customers but also state it is not available for new customers and is discontinued on January 1, 2027, so it should not be the MVP dependency.
- GitHub project state checked for Nitter, snscrape, twscrape, and twikit: Nitter/twscrape are active, snscrape Twitter issues include blocked failures, and twikit/twscrape issues show search/login instability. Treat these as experimental fallbacks, not core product dependencies.

## Acceptance Criteria

- [x] Bing is excluded from recommended discovery strategy.
- [x] X official paid API is deferred for MVP.
- [x] Free/low-cost X discovery options are ranked by reliability and risk.
- [x] CPS fields are included directly in the minimum Supabase schema.
- [x] Dedupe policy is defined before analysis/storage.
- [x] Cron cadence starts daily for web/artist search and immediate for manual/channel-triggered intake.
- [x] Initial collection volume is capped at 2-3 accepted items per platform/query family, with hot-topic search at 3-5/day total.
