---
title: PRD: Prompt-Hermes-Engine Serverless v2
domain: product
problem: P1
s: [S1]
tags: [prd, prompt-assets, serverless]
relates-to:
  - path: guides/project_kickoff.md
    rel: references
status: completed
created: 2026-06-04
---

# PRD: Prompt-Hermes-Engine (PHE) - Serverless v2

## 1. 개요 및 목적

프로젝트명: Prompt-Hermes-Engine (PHE)

목적: X(트위터), 링크드인, 유튜브 등 전 세계 미디어 프로덕션의 최신 트렌드를 가장 빠르게 포착하여 즉시 사용 가능한 고품질 프롬프트 자산으로 전환하는 시스템 구축.

핵심 가치: 2~3인 소규모 팀에 최적화된 구조로, 자체 백엔드 서버나 복잡한 스크래핑 코딩을 완전히 배제한다. 디스코드를 수집 허브로 삼고, OpenAI 에이전트(Hermes)의 웹 브라우징/Actions 기능과 OpenAI Sites 배포 환경만을 결합해 개발 공수와 인프라 비용을 0에 가깝게 구현한다.

## 2. 파이프라인 아키텍처 및 데이터 흐름

```text
[팀원 큐레이션] X, 링크드인, 유튜브 서핑 중 소스 발견
       |
       v (링크 또는 이미지 업로드)
+--------------------------------------------------------+
| 1. 디스코드 #reference_artist (수집 허브)               |
+---------------------------+----------------------------+
                            | (웹훅 또는 에이전트 메시지 리스닝)
                            v
+--------------------------------------------------------+
| 2. Hermes 에이전트 (뇌 및 손발)                         |
|  - 소스 자동 분석(X 본문, 유튜브 자막, 링크드인 파싱)     |
|  - 실무형 프롬프트 가공 및 이미지/비디오 연출 코드 생성  |
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
| 4. OpenAI Sites 대시보드 (중앙 아카이브)                |
|  - 카테고리별/플랫폼별 프롬프트 자동 정렬 및 RAG 학습 데이터셋 |
+--------------------------------------------------------+
```

## 3. 기능적 요구사항

### 3.1. 디스코드 입력 채널 구조

`#reference_artist`: 팀원들이 트렌드 소스(X, 링크드인, 유튜브 링크 또는 캡처 이미지)를 자유롭게 던지는 공간.

`#prompt-generator`: Hermes가 분석 완료한 프롬프트 세트를 팀원들이 즉시 복사해서 쓸 수 있도록 Incoming Webhook을 통해 실시간 피드로 쏴주는 알림 창구.

### 3.2. 에이전트 처리 엔진

X(트위터) 분석: 공유된 X 링크를 타겟팅하여 포스트 본문, 사용 태그, 연동된 미디어 피처를 결합해 프롬프트셋을 셰이프업한다.

링크드인 분석: 로그인 장벽을 우회하기 위해 디스코드에 공유된 포스트 상세 URL 컨텍스트 및 구글 인덱싱 캐시를 결합해 연출 노하우를 가공한다.

유튜브 분석: 자막 데이터를 고속 파싱하여 긴 영상 내에 숨겨진 프롬프트 팁과 타임라인 요약을 추출한다.

결과 처리: 정제된 프롬프트와 Google Drive 미디어 주소를 Supabase DB에 적재하는 Action 또는 얇은 서버리스 endpoint를 실행한다.

### 3.3. OpenAI Sites 팀 대시보드

프롬프트 자동 정렬: Supabase DB와 직결되어, 별도 코딩 없이 프롬프트 명령만으로 플랫폼별(X, LinkedIn, YouTube), 스타일별(Cinematic, 3D, Storyboard) 탭을 자동 생성 및 정렬한다.

복사 및 피드백: 팀원들이 실무에 바로 쓸 수 있는 Copy to Clipboard 버튼 제공 및 사용성 카운팅.

RAG 선순환 학습: 대시보드에 누적되고 정렬된 데이터는 Hermes가 다음 프롬프트를 만들 때 컨텍스트로 자동 참조되어 에이전트가 팀의 취향에 맞춰 고도화된다.

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

보안 및 권한 제한: OpenAI Sites의 `access_mode: admins_only` 또는 `workspace_members` 옵션을 활용하여 외부 유출 없이 2~3인 팀 전용 프라이빗 보안을 유지한다.

유지보수 제로: 코드가 없으므로 서버 가동 중지나 크롤러 세션 만료로 인한 에러 대응 공수를 줄인다.

## 6. 최종 인프라 셋업 체크리스트

- 디스코드 서버: `#reference_artist`, `#prompt-generator` 채널 개설 및 웹훅 URL 확보.
- Supabase: 프로젝트 생성 후 SQL 구문 실행하여 테이블 생성 및 API Key 확보.
- Google Drive: 팀 전용 레퍼런스 폴더 생성 및 공유 권한 확정.
- OpenAI 에이전트 및 Sites: 에이전트 생성 후 Supabase/Drive 저장 endpoint를 호출할 Actions JSON(OpenAPI) 등록, 대시보드 레이아웃은 Sites 자연어 명령어로 빌드 및 배포.
