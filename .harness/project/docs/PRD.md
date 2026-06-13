---
title: PRD: Prompt-Hermes-Engine Serverless v2
domain: product
problem: P1
s: [S1]
tags: [prd, prompt-assets, serverless]
relates-to:
  - path: guides/project_kickoff.md
    rel: references
  - path: guides/agent_boundary_and_learning_architecture.md
    rel: refined-by
  - path: guides/source_discovery_cps_schema_cron_policy.md
    rel: refined-by
  - path: guides/bootstrap_sequence_and_cron_contract.md
    rel: governed-by
status: completed
created: 2026-06-04
---

# PRD: Prompt-Hermes-Engine (PHE) - Serverless v2

## 1. 개요 및 목적

프로젝트명: Prompt-Hermes-Engine (PHE)

목적: X(트위터), 링크드인, 유튜브 등 전 세계 미디어 프로덕션의 최신 트렌드를 가장 빠르게 포착하여 즉시 사용 가능한 고품질 프롬프트 자산으로 전환하는 시스템 구축.

핵심 가치: 2~3인 소규모 팀에 최적화된 구조로, Discord를 MVP 팀 인터페이스로 삼고, PHE 전용 collector/request bot과 제한된 내부 Hermes profile을 결합해 개인 Hermes gateway를 팀원에게 노출하지 않으면서 최신 프롬프트 자산을 축적·검색·생성한다. 자체 상시 백엔드는 최소화하되, 자동 수집 cron, Supabase pgvector, Google Drive 저장, OpenAI Sites/대시보드 표면은 제품 경계 안에 둔다.

## 2. 파이프라인 아키텍처 및 데이터 흐름

```text
[자동/수동 수집] X, 링크드인, 유튜브, Discord, 일일 hot AI prompt 검색
       |
       v (링크 또는 이미지 업로드)
+--------------------------------------------------------+
| 1. PHE collector bot / cron / #reference_artist         |
+---------------------------+----------------------------+
                            | (웹훅 또는 에이전트 메시지 리스닝)
                            v
+--------------------------------------------------------+
| 2. 제한된 PHE 내부 Hermes profile/lane                  |
|  - 소스 자동 분석(X 본문, 유튜브 자막, 링크드인 파싱)    |
|  - 실무형 프롬프트 가공 및 이미지/비디오 연출 코드 생성 |
+---------------------------+----------------------------+
                            | (Actions API 호출을 통해 직결 저장)
                            v
+--------------------------------------------------------+
| 3. 데이터 및 저장소 레이어                              |
|  - Supabase DB: 메타데이터 및 프롬프트 벡터 적재         |
|  - Google Drive: 레퍼런스 이미지/캡처/링크 자산 보관     |
+---------------------------+----------------------------+
                            | (실시간 데이터 바인딩)
                            v
+--------------------------------------------------------+
| 4. Team prompt bot + OpenAI Sites 대시보드              |
|  - 팀 요청 응답, 프롬프트 정렬, RAG 학습 데이터셋       |
+--------------------------------------------------------+
```

## 3. 기능적 요구사항

### 3.1. 디스코드 입력 채널 구조

`#reference_artist`: 팀원들이 트렌드 소스(X, 링크드인, 유튜브 링크 또는 캡처 이미지)를 자유롭게 던지는 공간. 자동 collector/cron도 특정 아티스트·채널의 신규 포스트를 이 수집 계약으로 정규화한다.

`#prompt-generator`: Hermes가 분석 완료한 프롬프트 세트를 팀원들이 즉시 복사해서 쓸 수 있도록 Incoming Webhook을 통해 실시간 피드로 쏴주는 알림 창구.

### 3.2. 에이전트 처리 엔진

PHE는 두 개의 제품 agent boundary를 갖는다.

- Collection / learning agent: X, YouTube, LinkedIn, Discord, 웹 검색, 지정 아티스트/채널 watcher, 일일 AI prompt hot-topic cron에서 자료를 수집하고 분석·저장·클러스터링한다.
- Team prompt request agent: 팀원이 Discord에 요청/링크/자료를 올리거나 scheduled request가 발생하면 Supabase pgvector와 Google Drive 레퍼런스에서 최신·적합 자료를 검색해 프롬프트를 생성한다.

두 agent는 PHE 전용 bot/API 표면으로만 노출하고, 개인 Hermes gateway나 개인 프로젝트 context는 팀원 요청 경로에 포함하지 않는다.

X(트위터) 분석: MVP에서는 유료 X API에 의존하지 않고, 팀 수동 링크/스크린샷 intake, Google Alerts/Search 기반 발견, 제한된 실험용 mirror/scraper fallback을 조합한다. 공유된 X 링크를 타겟팅하여 포스트 본문, 사용 태그, 연동된 미디어 피처를 결합해 프롬프트셋을 셰이프업하고, 접근 실패 시 `needs_review`와 보강 요청으로 처리한다.

링크드인 분석: 로그인 장벽을 우회하기 위해 디스코드에 공유된 포스트 상세 URL 컨텍스트 및 구글 인덱싱 캐시를 결합해 연출 노하우를 가공한다.

유튜브 분석: 자막 데이터를 고속 파싱하여 긴 영상 내에 숨겨진 프롬프트 팁과 타임라인 요약을 추출한다.

결과 처리: 정제된 프롬프트와 Google Drive 미디어 주소를 Supabase DB에 적재하는 Action 또는 얇은 서버리스 endpoint를 실행한다. Supabase에는 prompt vector, 최신 키워드, 트렌드, ontology cluster, feedback/preference signal을 함께 축적한다.

Cron 정책: 수동/channel-triggered artist intake는 즉시 실행하고, web/source/artist 검색과 AI prompt hot-topic discovery는 하루 1회 실행한다. 초기 수집량은 platform/query family별 2-3개, hot-topic discovery는 3-5개 accepted item/day로 제한하고 dedupe 후 저장한다.

실행 순서: Supabase 프로젝트 생성, pgvector schema migration, Google Drive 팀 폴더/자동화 credential, PHE endpoint/bot boundary, manual Discord intake 검증이 끝나기 전에는 Hermes cron job을 만들지 않는다. Hermes cron은 MVP scheduler/control-plane이며 Supabase는 DB/vector store로만 둔다.

### 3.3. OpenAI Sites 팀 대시보드

프롬프트 자동 정렬: Supabase DB와 직결되어, 별도 코딩 없이 프롬프트 명령만으로 플랫폼별(X, LinkedIn, YouTube), 스타일별(Cinematic, 3D, Storyboard) 탭을 자동 생성 및 정렬한다.

복사 및 피드백: 팀원들이 실무에 바로 쓸 수 있는 Copy to Clipboard 버튼 제공 및 사용성 카운팅.

RAG 선순환 학습: 대시보드와 Supabase에 누적되고 정렬된 데이터는 다음 프롬프트를 만들 때 컨텍스트로 자동 참조된다. 여기서 학습은 MVP 기준 fine-tuning이 아니라 prompt/result/trend 분석, 템플릿 개선, 선호도/피드백 반영, ontology cluster 연결, pgvector 기반 retrieval 고도화를 뜻한다.

## 4. 데이터베이스 및 스토리지 명세

### 4.1. Supabase 테이블 구조

```sql
CREATE EXTENSION IF NOT EXISTS pgvector;

CREATE TABLE trend_knowledge_hub (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    source_platform VARCHAR(50) NOT NULL,
    creator_name VARCHAR(100) NOT NULL,
    origin_url TEXT,
    prompt_title VARCHAR(255) NOT NULL,
    core_prompt TEXT NOT NULL,
    production_specs JSONB,
    drive_file_ids TEXT[],
    drive_view_urls TEXT[],
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_platform_created ON trend_knowledge_hub(source_platform, created_at DESC);
```

### 4.2. Google Drive 가이드라인

MVP에서는 Cloudflare R2 대신 Google Drive를 기본 미디어 저장소로 둔다. 현재 필요한 자산은 고용량 CDN 서빙보다 팀이 직접 보고, 정리하고, 지속 관리하기 쉬운 이미지/캡처/링크 보관에 가깝기 때문이다.

Supabase row에는 Drive 원본 파일의 `drive_file_ids`와 보기용 `drive_view_urls`를 저장한다. 대시보드에서 안정적인 썸네일 렌더링, 공개 CDN, 대량 트래픽이 필요해지는 시점에는 Cloudflare R2를 확장 후보로 재검토한다.

## 5. 비기능적 요구사항

속도 및 가성비: 복잡한 백엔드 아키텍처가 없으므로 딜레이 요소가 최소화된다. 디스코드 투척 후 대시보드 동기화까지의 과정을 에이전트 단일 루프로 처리하여 속도를 극대화한다.

보안 및 권한 제한: OpenAI Sites의 `access_mode: admins_only` 또는 `workspace_members` 옵션을 활용하여 외부 유출 없이 2~3인 팀 전용 프라이빗 보안을 유지한다. 팀원은 PHE 프로젝트 데이터 전체를 검색할 수 있지만, 개인 Hermes gateway, 개인 프로젝트 파일/터미널, 개인 memory/session에는 접근하지 못한다.

유지보수 제로: 코드가 없으므로 서버 가동 중지나 크롤러 세션 만료로 인한 에러 대응 공수를 줄인다.

## 6. 최종 인프라 셋업 체크리스트

- 디스코드 서버: `#reference_artist`, `#prompt-generator`, 팀 요청 채널, review queue 채널 개설 및 웹훅 URL 확보.
- Supabase: 프로젝트 생성 후 SQL 구문 실행하여 테이블 생성 및 API Key 확보.
- Google Drive: 팀 전용 레퍼런스 폴더 생성 및 공유 권한 확정.
- OpenAI 에이전트 및 Sites: 에이전트 생성 후 Supabase/Drive 저장 endpoint를 호출할 Actions JSON(OpenAPI) 등록, 대시보드 레이아웃은 Sites 자연어 명령어로 빌드 및 배포.
