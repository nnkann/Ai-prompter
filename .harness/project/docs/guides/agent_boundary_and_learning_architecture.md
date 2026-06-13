---
title: Agent boundary and learning architecture for Prompt-Hermes-Engine
description: Defines the two-agent product boundary: automated collection/learning and team-facing prompt request generation.
domain: pipeline
c: "PHE must collect trend/reference material automatically from X, YouTube, LinkedIn, Discord, and scheduled searches, then let team members request fresh, suitable prompts without exposing the owner's personal Hermes gateway."
problem: [P1, P2, P3]
s: [S1, S2, S3]
tags: [agents, ingestion, learning, rag, discord, supabase, google-drive]
relates-to:
  - path: ../PRD.md
    rel: extends
  - path: ./bot_runtime_strategy.md
    rel: supersedes-scope
  - path: ./source_discovery_cps_schema_cron_policy.md
    rel: refined-by
  - path: ./pipeline_contract.md
    rel: refines
status: completed
created: 2026-06-10
updated: 2026-06-10
---

# Agent boundary and learning architecture for Prompt-Hermes-Engine

## Decision

PHE는 제품 관점에서 **두 개의 agent boundary**를 가진다.

1. **Collection / learning agent**: X, YouTube, LinkedIn, Discord, web search, scheduled hot-topic discovery에서 자료를 자동 수집하고, 아티스트/레퍼런스/이미지/샘플 프롬프트/트렌드/템플릿/피드백 지식을 저장·분배한다.
2. **Team prompt request agent**: 팀원이 Discord에 데이터, 링크, 요청을 올리거나 정해진 cron job이 실행될 때, 저장된 자료에서 적합하고 최신의 프롬프트를 검색·조합·생성한다.

이 둘은 같은 개인 Hermes gateway bot으로 합치지 않는다. 공용/팀원-facing 표면은 PHE 전용 bot/API로 분리하고, Hermes는 제한된 PHE profile/lane 내부 orchestration과 reasoning에만 사용한다.

## Operating model

```text
External sources
  X / YouTube / LinkedIn / web / Discord channels / scheduled searches
        │
        ▼
Collection & Learning Agent
  - scheduled source watcher
  - artist/channel watcher
  - daily AI-prompt hot-topic search
  - link/content/image understanding
  - prompt/result/trend/template analysis
        │
        ▼
Storage & Knowledge Layer
  Supabase + pgvector
    - source records
    - artist/reference metadata
    - prompt embeddings
    - trend keywords
    - ontology clusters
    - feedback/preference signals
  Google Drive
    - images
    - screenshots
    - sample prompt files
    - reference assets
        │
        ▼
Team Prompt Request Agent
  Discord first, Slack later, dashboard read/write surface
  - accepts team requests, links, and data
  - retrieves suitable/latest references
  - generates prompt assets
  - writes request/result metadata
  - publishes result to team channel/dashboard
```

## Agent 1: Collection / learning agent

### Sources

| Source | Collection mode | Notes |
|--------|-----------------|-------|
| X | automatic cron + selected artist/account watcher + manual link intake | Detect new posts, links, media, hashtags, prompt/process hints. |
| YouTube | automatic cron + selected channel/video watcher + manual link intake | Extract title, description, transcript/timestamps when available. |
| LinkedIn | automatic/manual hybrid | Use accessible post content, shared context, snippets, and team notes; mark login-limited results as `needs_review`. |
| Discord channels | manual link/data intake + channel watcher | Certain artist posts can be mirrored into dedicated channels. |
| Daily AI prompt discovery | scheduled search cron | Find hot/current posts about AI prompts, workflows, image/video generation patterns, and template trends. |

### Responsibilities

- Detect new source items from watched artists/channels/topics.
- Parse links, text, attachments, images, screenshots, transcripts, and user notes.
- Summarize what the source is about.
- Extract artist/creator metadata and source provenance.
- Analyze prompt structure, visual style, result quality, production specs, and reusable template patterns.
- Save images and sample prompt artifacts to Google Drive.
- Store structured metadata, embeddings, trend keywords, and ontology cluster links in Supabase.
- Distribute items into the right knowledge clusters: artist, platform, style, use case, model, trend, prompt pattern, result type.
- Mark uncertain or blocked sources with confidence and review fields.

### Cron classes

| Cron class | Purpose | Output |
|------------|---------|--------|
| `artist_watch_cron` | Check configured artists/channels/accounts for new posts. | New source payloads and Drive/Supabase records. |
| `channel_ingest_cron` | Check project Discord/reference channels for new links/files. | Normalized `source_payload` records. |
| `daily_prompt_trend_cron` | Search for hot/current posts about AI prompts, workflows, image/video generation patterns, and template trends. | Trend digest, candidate references, prompt pattern updates. |
| `learning_cluster_cron` | Re-cluster recent records and update ontology/embedding links. | Cluster assignments, trend keywords, template improvements. |
| `review_queue_cron` | Surface low-confidence or blocked items. | Human review list and retry candidates. |

MVP cadence: manual/channel-triggered intake runs immediately; broader artist/web/source search runs daily. Initial accepted volume is capped at 2-3 items per platform/query family, with daily AI prompt hot-topic discovery capped at 3-5 accepted items total until quality is measured.

## Agent 2: Team prompt request agent

### Interfaces

- MVP primary: Discord bot/channel interaction.
- Later: Slack.
- Dashboard: visualizes prompt publications, source history, trend clusters, review queue, usage/feedback, and copy-ready prompt cards.

### Responsibilities

- Receive team request text, links, images, or files.
- Decide whether the item is:
  - a new source to collect,
  - a request for a generated prompt,
  - a request to update/classify an existing reference,
  - a scheduled/cron-triggered task.
- Query Supabase vector/indexed data for fresh, suitable references.
- Use latest keywords, trends, template improvements, preferences, and feedback signals.
- Generate prompt assets in the requested format.
- Return concise results to Discord and write result metadata back to Supabase.
- Publish approved/usable prompts to the dashboard and prompt channel.

### Data access

Team members can search all project PHE data by default. This is **project-wide access**, not personal Hermes access. The team-facing bot can query PHE Supabase/Drive records, but it must not access owner personal Hermes memory, sessions, filesystem, terminals, or unrelated projects.

## Learning definition

For PHE, "learning" means RAG/ontology-based accumulation and refinement, not model fine-tuning in MVP.

Included:

- prompt analysis,
- result analysis,
- trend analysis,
- template improvement,
- preference and feedback improvement,
- embeddings and vector search,
- ontology clustering,
- cluster-based distribution and retrieval,
- hot keyword and style tracking,
- creator/artist reference memory.

Deferred unless explicitly approved:

- fine-tuning a model,
- storing private team secrets in prompts,
- giving team-facing bots general terminal/filesystem access,
- exposing owner Hermes gateway to team members.

## Storage decision

- **Supabase + pgvector** is the primary knowledge database for prompts, embeddings, latest keywords, trend records, ontology clusters, request logs, usage signals, and feedback.
- **Google Drive** is the MVP media/artifact storage for images, screenshots, reference files, and sample prompts.
- **Cloudflare R2** is deferred because it is unnecessary overhead until public CDN behavior, high-volume serving, signed URL policy, or image transformation becomes necessary.

## Security boundary

```text
Allowed:
  team bot → PHE API/query layer → PHE Supabase/Drive project data
  collector → PHE ingestion API → PHE storage
  internal Hermes profile → scoped PHE processing only

Forbidden:
  team bot → owner personal Hermes gateway
  team bot → owner personal projects/files/terminal
  collector bot → broad Hermes chat/tool access
  cron watcher → credentials or raw secrets in logs/docs
```

## Acceptance Criteria

- [x] Product is modeled as two agent boundaries: collection/learning and team prompt request.
- [x] Collection supports automatic cron, selected artist/channel monitoring, and manual/team intake.
- [x] Daily hot AI-prompt discovery is a first-class scheduled learning path.
- [x] Discord is the MVP team request interface; Slack is a later expansion target.
- [x] Dashboard is a visibility/publication surface for prompt outputs and collection history.
- [x] Supabase + pgvector is the vector/knowledge store.
- [x] Google Drive is the MVP media/sample prompt storage.
- [x] Learning is defined as RAG/ontology/template/feedback accumulation, not MVP fine-tuning.
- [x] Team members can search all PHE project data, but cannot access owner personal Hermes context or tools.

## Implementation questions and resolved scope

Resolved:

1. X official paid API is deferred for MVP; Bing is excluded; Google-based discovery plus manual Discord intake is the default.
2. Minimum Supabase schema is defined in `source_discovery_cps_schema_cron_policy.md` and implemented locally as `supabase/migrations/202606100001_phe_core_schema.sql`.
3. Cron cadence and caps are defined in `.harness/project/cron/phe_cron_jobs.yaml`; Hermes cron is the MVP scheduler/control plane, not Supabase.
4. Manual/channel-triggered intake must be verified before any scheduled cron jobs are created.

Still pending owner decisions:

1. Exact Discord channel names/IDs for collection, review queue, prompt output, and team requests.
2. Supabase project owner/org, project name, and region.
3. Google Drive parent folder owner and automation identity.
4. First dashboard surface: OpenAI Sites, Supabase dashboard, or a small custom read-only page.
