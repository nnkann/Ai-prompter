---
title: 프로젝트 출범: Prompt-Hermes-Engine
domain: meta
tags: [cps, stack, kickoff]
relates-to:
  - path: ../PRD.md
    rel: references
  - path: ./bot_runtime_strategy.md
    rel: extends
  - path: ./agent_boundary_and_learning_architecture.md
    rel: extends
  - path: ./source_discovery_cps_schema_cron_policy.md
    rel: extends
  - path: ./bootstrap_sequence_and_cron_contract.md
    rel: governs
status: in-progress
created: 2026-06-04
---

# 프로젝트 출범: Prompt-Hermes-Engine

## 한 줄 정의

Prompt-Hermes-Engine(PHE)는 팀원이 디스코드에 던진 X, LinkedIn, YouTube 트렌드 소스를 GPT/Hermes 에이전트가 분석해 즉시 사용 가능한 프롬프트 자산과 Google Drive 기반 레퍼런스 미디어 아카이브로 정리하는 서버리스 팀 도구다.

## 페르소나와 핵심 기능

### 소규모 미디어 프로덕션 팀원

- X, LinkedIn, YouTube에서 발견한 트렌드 링크나 캡처 이미지를 `#reference_artist`에 빠르게 공유한다.
- 정제된 프롬프트를 `#prompt-generator` 또는 대시보드에서 복사해 실제 제작에 사용한다.
- 이미 저장된 스타일, 플랫폼, 제작 스펙을 기준으로 과거 자산을 재검색한다.

### Hermes 운영자

- Discord 입력, GPT Actions 또는 얇은 서버리스 endpoint, Supabase, Google Drive, OpenAI Sites 연결 상태를 관리한다.
- 소스별 파싱 실패, 로그인 장벽, 미디어 저장 실패 같은 예외를 진단한다.
- 누적된 프롬프트 데이터를 다음 생성 품질 개선에 반영한다.

## CPS

### Context

2~3인 팀은 트렌드 탐색과 프롬프트 제작을 동시에 해야 하지만, 별도 백엔드와 크롤러를 운영할 여력이 작다. 팀원은 이미 X, LinkedIn, YouTube를 탐색하고 Discord를 협업 허브로 쓰므로, 입력 인터페이스는 Discord로 고정하는 것이 가장 낮은 마찰을 만든다. 구조 데이터와 검색은 Supabase, 원본 이미지/캡처/링크 관리는 Google Drive, 노출은 OpenAI Sites, 판단과 가공은 GPT/Hermes Actions에 맡겨 서버 운영 부담을 최소화한다.

### User Needs

#### Personas

- 팀원: 발견 즉시 링크나 이미지를 던지고, 완성 프롬프트를 기다린다.
- 운영자: 수집 실패와 데이터 품질을 빠르게 확인하고, Drive 폴더와 Supabase row를 직접 관리 가능한 상태로 유지한다.

#### Success Metrics

- 팀원이 Discord에 소스를 올린 뒤 수 분 안에 `#prompt-generator`에서 사용 가능한 프롬프트를 확인할 수 있다.
- 대시보드에서 플랫폼과 스타일 기준으로 누적 프롬프트를 탐색하고 복사할 수 있다.
- 신규 상시 백엔드 서버 없이 Supabase, Google Drive, GPT Actions 또는 얇은 서버리스 endpoint, OpenAI Sites 구성만으로 MVP가 동작한다.

### Problem

- P1: 트렌드 소스가 X, LinkedIn, YouTube, 이미지 캡처로 흩어져 있어 팀의 프롬프트 자산으로 축적되지 않는다.
- P2: 소규모 팀이 자체 크롤러, 상시 백엔드 서버, 고정 미디어 스토리지 파이프라인을 운영하기 어렵다.
- P3: 생성된 프롬프트가 Discord 알림과 대시보드, RAG 참조 데이터로 연결되지 않으면 재사용성과 팀 취향 학습이 약해진다.
- P4: 하네스 runtime adapter 파일이 제품 구조와 구분되지 않으면 repo 루트에서 실제 PHE 아키텍처를 판단하기 어렵다.

### Solution

- S1: `#reference_artist`를 단일 입력 허브로 두고 Hermes가 링크/이미지 컨텍스트를 분석해 정제 프롬프트와 제작 스펙으로 변환한다.
  ssot: docs/PRD.md
- S2: Supabase `trend_knowledge_hub`와 Google Drive 팀 폴더를 저장 계약으로 고정하고, GPT Action 또는 얇은 서버리스 endpoint가 구조 데이터와 미디어 링크를 분기 저장하도록 한다.
  ssot: docs/guides/pipeline_contract.md
- S3: `#prompt-generator` 웹훅과 OpenAI Sites 대시보드를 결과 노출 표면으로 두고, 복사/피드백/검색 데이터를 다음 Hermes 생성 컨텍스트로 재사용한다.
  ssot: docs/guides/pipeline_contract.md
- S4: 제품 코드/문서와 하네스 runtime adapter를 명시적으로 분리하고, 실제 사용할 runtime별 보존/정리 기준을 문서화한다.
  ssot: docs/guides/mt_harness_adapter_boundary.md

### current

```text
current: Phase 1 파이프라인 계약 정의 → docs/guides/pipeline_contract.md
```

## 기술 결정

- **프로젝트 유형**: 웹앱/자동화 하이브리드. 사용자 표면은 Discord와 OpenAI Sites, 데이터 표면은 Supabase/Google Drive, 처리 표면은 GPT Actions 또는 얇은 서버리스 endpoint.
- **규모**: 중. 수집, 파싱, 저장, 대시보드, 피드백/RAG까지 5개 안팎의 도메인이 있다.
- **아키텍처 패턴**: feature-based. 초기에는 `pipeline`, `sources`, `storage`, `dashboard`, `feedback` 단위로 계약과 작업을 분리한다.
- **언어/런타임**: Node.js 20+ / TypeScript. 현재 starter가 TypeScript CLI이며, Supabase/Google Drive/OpenAPI 계약 검증에도 무난하다.
- **프레임워크**: Phase 1은 프레임워크 없이 계약/CLI 중심. OpenAI Sites 표면이 확정된 뒤 필요한 경우 별도 프론트엔드만 추가한다.
- **패키지 매니저**: npm. 현재 `package-lock.json`이 존재한다.
- **테스트**: TypeScript type-check를 기본 게이트로 두고, Actions payload 변환 로직이 생기면 Node test runner 또는 Vitest를 추가한다.
- **린터/포매터**: 현재 미설정. 코드가 늘어나는 시점에 ESLint + Prettier 또는 Biome 중 하나를 선택한다.
- **배포 환경**: 별도 상시 앱 서버 없음. Discord Webhook, GPT Actions, 얇은 서버리스 endpoint, Supabase, Google Drive, OpenAI Sites 조합.
- **UI/디자인 스택**: OpenAI Sites 대시보드 우선. 별도 UI 구현이 필요해지면 조용한 운영형 대시보드 스타일로 설계한다.

## 도메인 목록

- `product`: PRD와 요구사항.
- `pipeline`: Discord 입력부터 GPT Actions 또는 얇은 endpoint, Supabase/Google Drive 저장, Sites 노출까지의 연결 계약.
- `sources`: X, LinkedIn, YouTube, 이미지 캡처 분석 규칙.
- `storage`: Supabase 스키마, pgvector, Google Drive 폴더/파일 ID/보기 URL 정책.
- `dashboard`: OpenAI Sites 뷰, 복사/피드백, 플랫폼/스타일 정렬.
- `feedback`: 복사 카운트, 팀 취향 반영, RAG 참조 루프.

## Repo 구조 경계

PHE 제품 구조는 `src/`, `docs/PRD.md`, `docs/guides/project_kickoff.md`, `docs/WIP/`를 중심으로 판단한다. 루트의 `.claude/`, `.codex/`, `.agents/`, `.harness/`, `AGENTS.md`, `CLAUDE.md`는 하네스와 에이전트 runtime adapter 표면이며 제품 앱 구조가 아니다.

| Path | 분류 | 보존/정리 판단 |
|------|------|----------------|
| `src/` | 제품 코드 | 보존. Phase 1 계약 검증 CLI와 향후 PHE 보조 도구 영역이다. |
| `docs/PRD.md` | 제품 문서 | 보존. 요구사항 SSOT다. |
| `docs/guides/project_kickoff.md` | 제품/CPS 문서 | 보존. CPS와 구현 순서 SSOT다. |
| `docs/WIP/` | 작업 상태 문서 | 보존. 진행 중인 phase 작업을 드러낸다. |
| `.claude/` | 하네스 adapter | 보존. pre-check, docs_ops, 테스트 스크립트 실행부가 있다. upstream 대안 없이 삭제하지 않는다. |
| `.codex/` | Codex adapter | 보존. 현재 Codex hook/config 표면이다. |
| `.agents/` | 로컬 agent/skill adapter | 보존. `/implementation`, `/commit` 등 작업 계약을 제공한다. |
| `.harness/` | starter/upstream binding | 보존. harness-upgrade 기준점이다. |
| `AGENTS.md` | Codex adapter 지침 | 보존. 현재 repo 작업 규칙 진입점이다. |
| `CLAUDE.md` | Claude adapter 지침 | 조건부 보존. Claude runtime 미사용이 확정되어도 upstream adapter sprawl 정리 전에는 삭제보다 문서상 격리를 우선한다. |

현재 이 repo의 기본 실행 작업은 Codex가 담당하고, kanban/LiveOps orchestration은 Hermes board가 담당한다. Claude adapter는 호환성 표면으로 남기며, 실제 검증에 필요한 `.claude/scripts` 실행부는 삭제 후보가 아니다.

## 구현 순서 (Phase 1)

1. Bootstrap sequence: Supabase 프로젝트 생성, schema migration, Google Drive 폴더/권한, PHE endpoint/bot boundary, manual Discord intake 검증을 cron보다 먼저 끝낸다.
2. Storage 스키마: `supabase/migrations/202606100001_phe_core_schema.sql`을 Supabase project에 적용하고 pgvector/cron_runs까지 확인한다.
3. Pipeline 계약: Discord 입력 payload, GPT/Hermes output schema, Supabase insert payload, Google Drive 파일/URL 규칙을 한 문서로 고정한다.
4. Cron contract: Supabase cron이 아니라 Hermes cron이 MVP scheduler/control-plane이다. `.harness/project/cron/phe_cron_jobs.yaml`의 gates가 만족되기 전에는 job을 생성하지 않는다.
5. Actions OpenAPI: GPT/Hermes가 호출할 Supabase/Drive 저장 endpoint 명세를 작성한다.
6. Sites 대시보드: 데이터 테이블과 카드 레이아웃을 OpenAI Sites용 prompt/spec으로 작성한다.
7. 검증 CLI: starter `src/`를 분석 결과 JSON 검증 및 Supabase payload preview CLI로 전환한다.
8. Repo 구조 경계: 제품 구조와 하네스 adapter 구조를 구분하고 runtime 정리 기준을 확정한다.
9. Bot runtime 전략: 팀원이 쓰는 접점에는 개인 Hermes gateway bot을 노출하지 않는다. MVP에서는 PHE 전용 collector/learning agent와 team prompt request agent를 분리하고, 두 agent가 제한된 PHE endpoint/profile만 호출하게 한다.
10. 자동 수집/학습: artist/channel watcher, Discord channel ingest, daily AI-prompt hot-topic search, ontology/embedding cluster update cron을 Phase 1 구현 범위로 구체화한다.
11. Source discovery/CPS schema: Bing은 사용하지 않고, Google 기반 discovery와 수동 Discord intake를 우선한다. Supabase schema에는 CPS fields(`c`, `problem`, `s`, evidence, AC), pgvector, ontology cluster, feedback signals를 포함한다.

## 메모

- 현재 `src/index.ts`는 TypeScript CLI starter다. PHE MVP 자체가 완성된 것은 아니며, Phase 1에서는 이 코드를 계약 검증용 도구로 확장할지 별도 생성기로 교체할지 결정한다.
- PRD의 "코드 없음" 전제는 자체 상시 백엔드/크롤러를 만들지 않는다는 뜻으로 해석한다. GPT Action schema, 얇은 서버리스 endpoint 계약, setup SQL, 대시보드 prompt, 검증 CLI는 repo 산출물로 관리한다.
