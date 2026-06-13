---
title: Bot runtime strategy for Prompt-Hermes-Engine
domain: pipeline
c: "PHE needs both a source-intake agent that receives prompt/trend material from another server and a generation agent that turns that material into reusable prompt assets."
problem: [P1, P2, P3]
s: [S1, S2, S3]
tags: [discord, hermes, bots, runtime, gateway]
relates-to:
  - path: ../PRD.md
    rel: references
  - path: ./project_kickoff.md
    rel: extends
  - path: ./agent_boundary_and_learning_architecture.md
    rel: refined-by
  - path: ./pipeline_contract.md
    rel: informs
status: completed
created: 2026-06-10
updated: 2026-06-10
---

# Bot runtime strategy for Prompt-Hermes-Engine

## Decision

MVP에서는 팀원이 쓰는 공개/공용 접점에 **개인 Hermes gateway bot을 직접 노출하지 않는다.** PHE 제품 경계는 두 개로 나눈다: (1) 자동 수집/학습 collector, (2) 팀 요청을 받아 최신·적합 프롬프트를 생성하는 request agent. 두 agent는 PHE 전용 bot/API 표면을 통해 제한된 PHE endpoint/profile만 호출한다. 개인 Hermes gateway는 owner/admin 작업과 내부 orchestration에만 남긴다.

```text
team/source-facing physical surfaces: PHE collector bot + team prompt bot/API
private/internal runtime: owner Hermes gateway + restricted PHE profiles
allowed handoff:
  collector bot/cron/webhook  → PHE ingestion endpoint/profile only
  team prompt bot             → PHE query/generation endpoint/profile only
  PHE intake/learning lane    → ap_intake/ap_curator/ap_thoth with scoped tools
  prompt generation lane      → ap_ptah + hathor, reviewed by ap_anubis
  final judgment / routing    → ap_maat / ap_thoth, owner-gated when needed
```

## Rationale

- 팀원이 호출하는 bot이 개인 Hermes gateway이면 Hermes가 가진 개인 프로젝트, 기억, 세션, 파일/터미널 도구 접근면까지 함께 노출될 수 있다.
- PHE 팀용 bot은 product boundary여야 하며, owner 개인 작업 agent와 같은 trust boundary에 있으면 안 된다.
- collector bot/cron은 판단/생성 agent가 아니라 수집·분류·저장 adapter로 둔다. X/YouTube/LinkedIn/Discord/웹 검색에서 새 자료를 찾고 PHE 전용 endpoint/profile에만 전달한다.
- team prompt bot은 Discord를 MVP 인터페이스로 두고, 저장된 PHE 지식에서 최신·적합 자료를 검색해 프롬프트를 생성한다. Slack은 후속 확장이다.
- Hermes profile/lane 분리는 내부 실행 역할 분리에는 유효하지만, 외부 팀원 권한 경계를 대신할 수 없다.

## Logical roles

| Role | Responsibility | Suggested lane/profile | Model tier |
|------|----------------|------------------------|------------|
| Collection / learning agent | X, YouTube, LinkedIn, Discord, web search, selected artist/channel watcher, daily AI-prompt hot-topic cron에서 자료를 수집·분석·저장 | separate PHE collector process + `ap_intake`/`ap_curator` | deterministic collection + 5.3 analysis, escalate on ambiguity |
| Team prompt request agent | 팀원의 Discord 요청/링크/데이터 또는 scheduled request를 판단하고 저장 지식에서 최신·적합 프롬프트 생성 | separate team bot/API + `ap_ptah`/`hathor` | 5.3 for normal cases, escalate when complex |
| Source intake | collector/team payload를 받아 `source_payload`로 정규화 | `ap_intake` or restricted `ap_thoth` | 5.3 unless ambiguous routing |
| Prompt generation | source summary, core prompt, production specs, tags 생성 | `ap_ptah` + `hathor` | 5.3 for normal cases, escalate when complex |
| Quality review | output schema, prompt usefulness, AC coverage 확인 | `ap_anubis` | 5.3 |
| Final routing/judgment | 저장/알림/대시보드 반영 여부, owner-action 판단 | `ap_maat` / `ap_thoth` | 5.5 only when needed |
| Security/permissions | cross-server ingestion, webhook, token, Drive/Supabase authority 판단 | `ap_sekhmet` | 5.5 |

## Cross-server intake pattern

다른 Discord 서버나 외부 시스템에서 프롬프트/트렌드 소스를 받아와야 할 때 MVP 기본값은 개인 Hermes bot 설치가 아니라 다음 중 하나다.

1. 해당 서버에는 PHE 전용 collector bot 또는 team prompt bot을 설치한다.
2. collector bot/cron은 허용 source, guild/channel/user, payload 크기, attachment type을 검증한 뒤 PHE ingestion endpoint에만 POST한다.
3. team prompt bot은 팀 요청을 PHE query/generation endpoint로만 전달한다.
4. PHE endpoint는 service token/allowlist/rate limit을 적용하고, 개인 Hermes 일반 대화 세션이나 다른 프로젝트 도구로 라우팅하지 않는다.
5. Hermes는 내부에서 제한된 PHE profile/lane으로만 payload 분석, RAG/ontology retrieval, prompt 생성을 수행한다.

## When to create a separate bot

팀원이 쓰는 접점은 처음부터 별도 PHE collector bot/API bridge와 team prompt bot/API로 둔다. 단, 이 bot들이 자체 LLM judgment/generation까지 수행하는 무거운 agent가 되어야 하는지는 아래 조건에서만 재검토한다.

- collector 단계에서만 처리해야 하는 실시간 moderation/preview가 필요하다.
- Hermes/PHE backend가 장애여도 수집 queue를 독립적으로 유지해야 한다.
- Discord rate limit, Message Content Intent, allowed guild/user policy를 PHE 전용으로 독립 운영해야 한다.
- 공개 사용자용 branding/user-facing behavior가 필요하다.
- 감사/로깅/운영 소유권이 owner Hermes와 완전히 분리되어야 한다.

## MVP operating model

```text
External server or PHE reference channel
  → PHE collector bot / cron / webhook bridge
  → restricted PHE ingestion endpoint
  → ai-prompter-hermes board
  → intake normalization
  → Supabase pgvector + Google Drive storage
  → team prompt bot query/generation path
  → review / final judgment
  → REST endpoint
  → Supabase + Google Drive + #prompt-generator + Sites
```

## Acceptance Criteria

- [x] Team-facing surface does not expose the owner's personal Hermes gateway or general tools.
- [x] MVP uses separate PHE collector/learning and team prompt request boundaries, each calling restricted PHE endpoints/profiles internally.
- [x] Functional separation is represented as both a trust-boundary split at the external collector and Hermes logical lanes/profiles internally.
- [x] Cross-server source intake uses PHE-specific collector/API routing, not a general Hermes install on that server.
- [x] Model-tier cost policy stays compatible with the bot split: collection/generation/review can use 5.3, final/security/ambiguous routing can use 5.5.

## Implementation notes

- Do not store Discord bot tokens, webhook URLs, Supabase service-role keys, or Drive credentials in repo.
- Route/channel/guild IDs may be stored as non-secret manifests or environment placeholders.
- The collector bot should be treated as a thin ingestion adapter. It should not receive general Hermes chat access, personal project context, filesystem/terminal tools, or cross-project memory.
- Prompt judgment and memory-bearing generation should remain in restricted PHE profiles unless there is a strong isolation reason to move them into a separate service.
