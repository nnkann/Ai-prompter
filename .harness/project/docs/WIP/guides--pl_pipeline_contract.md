---
title: Pipeline 계약 정의
domain: pipeline
c: "사용자 결정: MVP 미디어 저장소를 R2에서 Google Drive로 전환하고, Supabase는 구조 데이터 DB로 유지하며, GPT/Sites 대시보드와 REST endpoint 영향을 재정의해야 함"
problem: [P1, P2, P3]
s: [S1, S2, S3]
tags: [pipeline, actions, discord]
relates-to:
  - path: ../guides/project_kickoff.md
    rel: extends
  - path: ../PRD.md
    rel: references
status: completed
created: 2026-06-04
updated: 2026-06-04
---

# Pipeline 계약 정의

## 목표

Discord에 공유된 트렌드 소스가 GPT/Hermes 분석 결과, Supabase row, Google Drive file/link, OpenAI Sites 카드, `#prompt-generator` 알림으로 이어지는 최소 계약을 확정한다.

## 범위

- Discord `#reference_artist` 입력 payload 후보 정의.
- GPT/Hermes 분석 결과 JSON schema 정의.
- Supabase `trend_knowledge_hub` insert payload와 실패 응답 규칙 정의.
- Google Drive 폴더, 파일 ID, 보기 URL, 권한 정책 정의.
- GPT Action에서 호출할 REST endpoint 필요 여부와 책임 범위 정의.
- `#prompt-generator` 웹훅 메시지 포맷 정의.
- OpenAI Sites 대시보드가 읽어야 할 필드와 필터 기준 정리.

## 선행 조건

- Discord 서버에는 `#reference_artist`, `#prompt-generator` 채널을 둔다.
- Supabase 프로젝트와 `trend_knowledge_hub` 테이블은 Phase 1 storage 작업에서 실제 생성 SQL로 확정한다.
- Google Drive 팀 폴더는 운영자가 직접 소유하고, MVP에서는 팀 내부 보기 권한을 기본값으로 둔다.
- GPT Actions 인증은 repo에 저장하지 않는 bearer token 또는 provider secret으로 주입한다.
- Supabase REST와 Google Drive 저장을 한 번에 처리해야 하므로, MVP 기본 경로는 얇은 REST endpoint 1개를 둔다.

## CPS Rationale

- C → P: R2에서 Google Drive로 MVP 저장소를 바꾸면 입력 수집(P1), 서버 운영 부담(P2), 재사용 표면(P3)이 함께 바뀐다.
- P → S: `#reference_artist` 입력(S1), Supabase/Drive 저장 계약(S2), `#prompt-generator`와 Sites 노출(S3)을 한 문서에서 연결한다.
- S → AC: AC는 입력·분석·저장·알림·대시보드 필드가 끊기지 않고, 비밀값과 R2 재검토 조건이 분리되는지로 닫는다.

## 데이터 흐름

| 단계 | 소유 표면 | 입력 | 출력 | 실패 시 |
|------|-----------|------|------|---------|
| 1. 수집 | Discord `#reference_artist` | 링크, 이미지 첨부, 짧은 설명 | `discord_source_payload` | 사용자에게 보강 요청 |
| 2. 분석 | GPT/Hermes | 수집 payload, 웹/첨부 컨텍스트 | `analysis_result` | fallback prompt와 `needs_review` 기록 |
| 3. 저장 | REST endpoint | `analysis_result`, 미디어 파일 | Supabase row, Drive file/link | 부분 실패를 JSON으로 반환 |
| 4. 알림 | Discord webhook | 저장 결과 | `#prompt-generator` 메시지 | endpoint result에 `webhook_status` 기록 |
| 5. 노출 | OpenAI Sites | Supabase row 필드 | 카드, 필터, 복사 표면 | row의 `needs_review`를 표시 |

## 필수 필드 계약

### Discord 입력 payload

| 필드 | 필수 | 설명 |
|------|------|------|
| `discord_message_id` | 예 | 중복 처리와 원문 추적 키 |
| `channel_name` | 예 | MVP 기본값은 `reference_artist` |
| `author_display_name` | 예 | 팀 내부 출처 표시용 |
| `source_platform` | 예 | `x`, `linkedin`, `youtube`, `image`, `unknown` |
| `origin_url` | 조건부 | 링크 입력일 때 원본 URL |
| `attachments[]` | 조건부 | 이미지/캡처 파일명, mime, 임시 URL |
| `user_note` | 아니오 | 사용자가 남긴 맥락 |
| `submitted_at` | 예 | Discord 메시지 시각 |

### GPT/Hermes output

| 필드 | 필수 | 설명 |
|------|------|------|
| `source_platform` | 예 | Discord payload에서 추론하거나 보정한 플랫폼 |
| `creator_name` | 예 | 알 수 없으면 `unknown` |
| `prompt_title` | 예 | Sites 카드 제목 |
| `core_prompt` | 예 | 바로 복사 가능한 최종 프롬프트 |
| `production_specs` | 예 | 스타일, 카메라, 조명, 모델, 비율, 금지 요소 JSON |
| `source_summary` | 예 | 원본에서 뽑은 트렌드 요약 |
| `tags[]` | 예 | 검색·필터용 영문/한글 혼용 태그 |
| `confidence` | 예 | `high`, `medium`, `low` |
| `needs_review` | 예 | 로그인 장벽, 저품질 캡처, 파싱 실패 여부 |

### Supabase insert payload

| 필드 | 필수 | 설명 |
|------|------|------|
| `source_platform` | 예 | 인덱스와 Sites 필터 기준 |
| `creator_name` | 예 | PRD 테이블과 동일 |
| `origin_url` | 아니오 | 링크가 없는 이미지 입력은 null |
| `prompt_title` | 예 | 카드/알림 제목 |
| `core_prompt` | 예 | 검색과 복사 기준 텍스트 |
| `production_specs` | 예 | JSONB |
| `drive_file_ids[]` | 아니오 | 업로드된 파일이 있을 때만 |
| `drive_view_urls[]` | 아니오 | 팀 내부 보기 URL |
| `source_summary` | 예 | PRD 테이블 확장 후보 |
| `needs_review` | 예 | Sites 운영 필터 |

### Google Drive file/link

| 필드 | 필수 | 설명 |
|------|------|------|
| `drive_folder_id` | 예 | 팀 레퍼런스 루트 또는 플랫폼별 하위 폴더 |
| `drive_file_ids[]` | 조건부 | 이미지/캡처를 저장한 파일 ID |
| `drive_view_urls[]` | 조건부 | Supabase와 Discord 알림에 저장할 보기 링크 |
| `permission_scope` | 예 | MVP 기본값은 팀 내부 보기 |
| `retention_note` | 아니오 | 원본 삭제/저작권 이슈 메모 |

### `#prompt-generator` webhook output

| 필드 | 필수 | 설명 |
|------|------|------|
| `title` | 예 | `prompt_title` |
| `summary` | 예 | `source_summary` 1~2문장 |
| `core_prompt` | 예 | 복사용 프롬프트 |
| `drive_links[]` | 아니오 | Drive 보기 URL |
| `dashboard_hint` | 예 | Sites에서 찾을 platform/tag 힌트 |
| `needs_review` | 예 | 사람이 확인해야 할 때 표시 |

## 소스별 파싱 전략

| 입력 | 최소 전략 | 실패 fallback |
|------|-----------|---------------|
| X | URL 본문, 첨부 미디어, 해시태그, 작성자명을 우선 추출 | 로그인/삭제로 본문 접근 실패 시 Discord에 붙은 캡처와 사용자 note만으로 `needs_review: true` 생성 |
| LinkedIn | 공유 URL, 페이지 공개 스니펫, Discord 설명을 결합 | 로그인 장벽이면 원문 전문 요청 메시지와 fallback prompt를 생성 |
| YouTube | URL, 제목, 설명, 가능한 자막/타임라인을 분석 | 자막 접근 실패 시 제목·설명·사용자 note 기반으로 low confidence 생성 |
| Custom image | 첨부 이미지 OCR/비전 분석, 사용자 note 반영 | 이미지 품질이 낮으면 Drive 저장만 수행하고 분석 결과를 review 대기 처리 |

## REST endpoint 계약

MVP에서는 GPT Action이 Supabase와 Google Drive를 직접 각각 호출하지 않고, 얇은 REST endpoint 하나를 호출한다. endpoint는 상시 백엔드 서버가 아니라 Google Apps Script Web App, Supabase Edge Function, 또는 동급의 서버리스 함수로 둔다.

| 항목 | 계약 |
|------|------|
| Method | `POST /trend-assets` |
| 책임 | 인증 확인, Drive 업로드, Supabase insert, webhook 발송, 부분 실패 JSON 반환 |
| 입력 | `discord_source_payload`, `analysis_result`, 첨부 파일 참조 또는 base64 |
| 성공 응답 | `status: "ok"`, `supabase_id`, `drive_file_ids`, `drive_view_urls`, `webhook_status` |
| 부분 실패 | `status: "partial"`, 성공한 저장 키, 실패 단계, 재시도 가능 여부 |
| 실패 응답 | `status: "error"`, `error_code`, `message`, `retryable` |
| 인증 | GPT Action secret 또는 bearer token. service role과 Drive credential은 endpoint runtime secret에만 저장 |

## Sites 대시보드 필드

OpenAI Sites는 Phase 1에서 별도 제품 코드를 만들지 않는 노출 표면이다. 이 문서는 Sites 구현 세부 API를 고정하지 않고, 대시보드가 읽어야 할 row 필드만 고정한다.

| UI 요소 | 필드 |
|---------|------|
| 플랫폼 탭 | `source_platform` |
| 스타일/태그 필터 | `production_specs.style`, `tags[]` |
| 카드 제목 | `prompt_title` |
| 카드 본문 | `source_summary`, `core_prompt` |
| 미디어 링크 | `drive_view_urls[]` |
| 검토 대기 뱃지 | `needs_review`, `confidence` |
| 복사/피드백 집계 | 후속 feedback 작업에서 `copy_count`, `last_used_at`, `rating` 확장 |

## 저장소 결정

MVP 기본 미디어 저장소는 Google Drive다. 이유는 팀이 이미 직접 접근 가능한 폴더 단위로 이미지, 캡처, 링크 근거를 확인하고 정리할 수 있으며, 지금 필요한 것은 공개 CDN보다 운영자가 회수 가능한 원본 아카이브이기 때문이다.

Cloudflare R2는 기본값에서 제외한다. 다음 조건 중 하나가 실제로 필요해질 때 재검토한다.

- Sites 카드에서 공개 썸네일 렌더링 안정성이 Drive 링크만으로 부족하다.
- 외부 공유 또는 대량 트래픽 때문에 CDN 캐시가 필요하다.
- Drive 권한 모델이 자동화 계정과 팀 권한을 동시에 만족하지 못한다.
- 이미지 변환, 리사이징, 서명 URL 만료 같은 객체 스토리지 기능이 필요하다.

## 보안 운영 규칙

- Supabase service role key, Google Drive credential, Discord webhook URL, GPT Action secret은 repo와 WIP 문서에 값으로 저장하지 않는다.
- `.env`, dashboard prompt, OpenAPI 예시에는 placeholder만 둔다.
- endpoint 로그에는 원본 credential, webhook URL, bearer token을 남기지 않는다.
- Drive 파일 권한은 MVP에서 팀 내부 보기로 제한하고, 공개 공유가 필요하면 파일 단위로 사유를 기록한다.
- 실패 응답은 사용자에게 조치 가능한 코드와 메시지만 반환하고 secret provider 이름이나 내부 경로를 노출하지 않는다.

## Acceptance Criteria

- [x] Goal: P1/P2/P3를 줄이기 위해 S1/S2/S3 pipeline 계약이 입력, 분석, 저장, 알림, 대시보드까지 끊기지 않고 정의된다.
  검증:
    review: self
    tests: `npm run check`
    실측: `python3 .claude/scripts/docs_ops.py verify-relates`
- [x] Problem AC (P1): X, LinkedIn, YouTube, custom image 입력이 팀의 프롬프트 자산으로 축적되는 필드와 fallback이 정의된다.
- [x] Problem AC (P2): 자체 상시 백엔드 서버 없이 얇은 REST endpoint와 managed storage로 처리하는 책임 경계가 정의된다.
- [x] Problem AC (P3): Supabase row, Drive link, `#prompt-generator`, Sites 카드가 같은 필드를 공유하도록 연결된다.
- [x] Solution AC (S1): `#reference_artist` Discord 입력 payload와 GPT/Hermes output 필드가 표로 정의된다.
- [x] Solution AC (S2): Supabase `trend_knowledge_hub` insert payload와 Google Drive file/link 계약, R2 재검토 조건이 정의된다.
- [x] Solution AC (S3): webhook output과 Sites 대시보드 필드, feedback 확장 지점이 정의된다.
- [x] Guardrail AC (P2/S2): Supabase service role, Google Drive credential, Discord webhook URL은 repo에 저장하지 않는 운영 규칙이 포함된다.
- [x] Verification AC (S1/S2/S3): `npm run check`와 `docs_ops.py verify-relates`가 통과한다.

## 구현 계획

1. 기존 PRD와 kickoff가 정의한 pipeline 범위를 WIP 계약 표로 구체화한다.
2. R2 제외와 Google Drive 기본값의 이유, endpoint 책임, 비밀값 보관 규칙을 명시한다.
3. `npm run check`와 `docs_ops.py verify-relates`로 문서 링크와 TypeScript 상태를 확인한다.

## 결정 사항

- MVP 기본 미디어 저장소는 Google Drive로 둔다. R2는 CDN/공개 썸네일/객체 스토리지 기능이 실제 요구될 때 재검토한다.
- Supabase는 구조 데이터와 검색 기준의 DB로 유지하고, Drive에는 원본 이미지/캡처와 보기 링크를 둔다.
- GPT Action은 Supabase와 Drive를 각각 직접 호출하기보다 얇은 REST endpoint 하나를 호출하는 구조를 기본값으로 둔다.
- OpenAI Sites 계약은 구현 API가 아니라 읽어야 할 row 필드와 UI 표면 요구사항으로 고정한다.
- CPS 갱신: 없음. 기존 P1/P2/P3와 S1/S2/S3 범위 안에서 계약을 구체화했다.

## 메모

- PRD는 "서버리스 v2"를 전제로 하므로 Phase 1에서는 자체 상시 백엔드 API 서버를 만들지 않는다. 단, GPT Actions가 Google Drive와 Supabase에 안전하게 쓰기 위해 Google Apps Script Web App 같은 얇은 REST endpoint가 필요할 수 있다.
- OpenAI Sites와 GPT Actions의 실제 최신 제약은 Actions OpenAPI와 Sites 구현 작업 직전에 공식 문서 기준으로 재확인한다.
- Google Drive는 팀이 직접 보관/정리/관리하기 쉬운 장점이 있으나, 대시보드 이미지 렌더링 안정성이나 공개 CDN 성능이 필요해지면 Cloudflare R2를 다시 검토한다.
- 실측: `npm run check` 통과.
- 실측: `python3 .claude/scripts/docs_ops.py verify-relates` 통과(미연결 0건).
- 실측: `python3 .claude/scripts/docs_ops.py validate` 통과(오류 0, 경고 0).
