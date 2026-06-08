---
title: "Repo 구조 정리: 제품 구조와 하네스 adapter 경계"
domain: meta
c: "사용자 지적: repo 루트에 .claude/.codex/.agents/.harness가 동시에 보여 제품 구조와 하네스 runtime adapter 구조가 구분되지 않음"
problem: [P4]
s: [S4]
tags: [harness, cleanup, adapters]
relates-to:
  - path: ../guides/project_kickoff.md
    rel: extends
status: completed
created: 2026-06-04
updated: 2026-06-04
---

# Repo 구조 정리: 제품 구조와 하네스 adapter 경계

## 목표

`Ai-prompter` repo에서 제품 코드/문서와 하네스 runtime adapter 파일을 명확히 구분해, PHE 제품 구조가 하네스 설치 산출물에 가려지지 않게 한다.

## 범위

- README 또는 kickoff 문서에 제품 구조와 하네스 구조를 분리해 명시한다.
- 제품 구조는 `src/`, `docs/PRD.md`, `docs/guides/project_kickoff.md`, `docs/WIP/*` 중심으로 정의한다.
- 하네스 adapter 구조는 `.claude/`, `.codex/`, `.agents/`, `.harness/`, `AGENTS.md`, `CLAUDE.md`로 별도 분류한다.
- 현재 실제로 사용할 runtime을 Codex/Hermes/Claude 중에서 정하고, 삭제 후보와 보존 후보를 표로 정리한다.
- upstream `harness-starter`의 adapter sprawl 보고가 처리되기 전까지는 실행부 삭제보다 문서상 격리를 우선한다.

## 선행 조건

- `harness-starter` upstream 보고 카드 확인: `t_71fa4ee9`
- `Ai-prompter`에서 실제 사용할 runtime 결정

## CPS Rationale

- C → P: 사용자는 repo 루트에 `.claude`, `.codex`, `.agents`, `.harness`가 동시에 보이는 상태를 제품 아키텍처로 읽었다. 이는 P4의 "하네스 runtime adapter 파일이 제품 구조와 구분되지 않아 실제 PHE 아키텍처 판단이 어려움"에 해당한다.
- P → S: S4는 제품 코드/문서와 하네스 runtime adapter를 분리하고, 실제 사용할 runtime별 보존/정리 기준을 문서화하는 해결책이다.
- S → AC: AC는 README 또는 kickoff에 경계 설명이 남고, 각 adapter 디렉터리의 보존/정리 판단이 표로 기록되며, 검증 실행부를 근거 없이 삭제하지 않는지로 S4 충족을 확인한다.

## Acceptance Criteria

- [x] Goal: S4 기준으로 신규 작업자가 repo 루트에서 제품 구조와 하네스 adapter 구조를 구분할 수 있다.
  검증:
    review: self
    tests: `npm run check`
    실측: `python3 .claude/scripts/docs_ops.py validate` 및 `python3 .claude/scripts/docs_ops.py verify-relates`
- [x] Solution AC (S4): README와 `project_kickoff.md`에 제품 구조와 하네스 adapter 구조의 경계가 기록된다.
- [x] Step AC (S4): `.claude`, `.codex`, `.agents`, `.harness`, `AGENTS.md`, `CLAUDE.md` 각각의 보존/정리 판단이 표로 기록된다.
- [x] Guardrail AC (P4/S4): `.claude/scripts` 등 현재 검증에 필요한 실행부는 upstream 대안 없이 삭제하지 않는다고 명시한다.
- [x] Verification AC (S4): `npm run check`, `docs_ops.py validate`, `docs_ops.py verify-relates`가 통과한다.

## 구현 계획

1. README에 제품 구조와 runtime adapter 경계를 추가한다.
2. `project_kickoff.md`에 PHE 구조 판단 기준과 runtime별 보존/정리 표를 추가한다.
3. 문서 검증과 TypeScript check를 실행해 완료 증거를 남긴다.

## 결정 사항

- PHE 제품 구조의 기준점을 `src/`, `docs/PRD.md`, `docs/guides/project_kickoff.md`, `docs/WIP/`로 명시한다.
- `.claude/`, `.codex/`, `.agents/`, `.harness/`, `AGENTS.md`, `CLAUDE.md`는 runtime adapter 표면으로 분류한다.
- 현재 작업 runtime은 Codex, kanban/LiveOps orchestration은 Hermes로 기록하고, Claude adapter는 upstream adapter sprawl 정리 전까지 보존한다.
- CPS 갱신: 없음. 기존 P4/S4 범위 안에서 문서상 격리 기준만 구체화한다.

## 메모

이 작업은 upstream 하네스 개선과 별개로 downstream `Ai-prompter`의 가독성을 회복하기 위한 로컬 정리 태스크다.

- 실측: `npm run check` 통과.
- 실측: `python3 .claude/scripts/docs_ops.py validate` 통과(오류 0, 경고 0).
- 실측: `python3 .claude/scripts/docs_ops.py verify-relates` 통과(미연결 0건).
