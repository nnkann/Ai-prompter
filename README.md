# Prompt-Hermes-Engine

Prompt-Hermes-Engine(PHE)는 Discord에 공유된 X, LinkedIn, YouTube 트렌드 소스를 Hermes 에이전트가 분석해 즉시 사용 가능한 프롬프트 자산으로 저장하고 OpenAI Sites 대시보드에 노출하는 서버리스 팀 도구다.

## Setup

```sh
npm install
npm run dev
```

Pass a topic to generate a starter prompt:

```sh
npm run dev -- "new product launch"
```

## Scripts

- `npm run dev` - run the app from TypeScript source
- `npm run check` - type-check without emitting files
- `npm run build` - compile to `dist`
- `npm start` - run the compiled app

## Environment

Copy `.env.example` to `.env` when provider credentials are needed.

## Project Assets

- `src/` - PHE 계약 검증과 보조 CLI를 둘 제품 코드 영역.
- `.harness/project/docs/PRD.md` - PHE PRD 원문.
- `.harness/project/docs/guides/project_kickoff.md` - CPS, 스택, 도메인 결정.
- `.harness/project/docs/guides/pipeline_contract.md` - Source intake, analysis, storage, request/notification/dashboard field contract.
- `.harness/project/docs/guides/bot_runtime_strategy.md` - Discord/Hermes bot runtime 분리 정책.
- `.harness/project/docs/guides/agent_boundary_and_learning_architecture.md` - 자동 수집/학습 agent와 팀 요청 prompt agent의 제품 경계.
- `.harness/project/docs/guides/source_discovery_cps_schema_cron_policy.md` - 무료/저비용 source discovery, CPS Supabase schema, cron/dedupe 정책.
- `.harness/project/docs/guides/bootstrap_sequence_and_cron_contract.md` - Supabase/Drive/endpoint 선행 bootstrap 순서와 Hermes cron 생성 gate.
- `.harness/project/cron/phe_cron_jobs.yaml` - 상세 Hermes cron job 계약.
- `.harness/project/docs/WIP/` - 아직 완료되지 않은 제품/하네스 작업 문서.
- `.harness/project/docs/ai-metaverse-project-brief.md` - AI Metaverse 강의 노트에서 정리한 draft brief.
- `.harness/project/docs/notion-lectures/` - Day1-Day4 Notion lecture exports used as source material.

## Runtime Adapter Boundary

이 repo의 PHE 제품 구조는 `src/`, `.harness/project/docs/PRD.md`, `.harness/project/docs/guides/project_kickoff.md`, `.harness/project/docs/WIP/`를 기준으로 읽는다. 루트의 하네스/에이전트 adapter 파일은 작업 실행과 검증을 위한 운영 표면이며, PHE 앱 아키텍처 자체로 보지 않는다.

| Path | 역할 | 현재 판단 |
|------|------|-----------|
| `.claude/` | 하네스 스크립트, 검증, 문서 운영 규칙 | 보존. `python3 .claude/scripts/pre_commit_check.py`와 docs 검증에 필요하다. |
| `.codex/` | Codex hook/config adapter | 보존. 현재 Codex 작업 진입점이다. |
| `.agents/` | 프로젝트 로컬 skill/agent 정의 | 보존. `/implementation`, `/commit` 등 작업 계약에 필요하다. |
| `.harness/` | upstream starter binding metadata | 보존. downstream harness-upgrade 연결에 필요하다. |
| `AGENTS.md` | Codex 작업 지침 | 보존. 현재 세션의 repo 규칙 SSOT다. |
| `CLAUDE.md` | Claude adapter 작업 지침 | 조건부 보존. Claude runtime을 쓰지 않더라도 upstream adapter sprawl 정리 전에는 문서상 격리한다. |

현재 기본 작업 runtime은 Codex이며, kanban/LiveOps 관리는 Hermes가 맡는다. Claude adapter는 하네스 호환성 표면으로 남겨두고, upstream `harness-starter`에서 adapter sprawl 정리가 확정되기 전까지 실행부를 삭제하지 않는다.
