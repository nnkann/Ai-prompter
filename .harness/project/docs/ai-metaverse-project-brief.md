---
title: AI Metaverse 강의 기반 프로젝트 초안
domain: product
problem: P1
s: [S1]
tags: [brief, source-notes]
status: completed
created: 2026-06-04
---

# AI Metaverse 강의 기반 프로젝트 초안

출처: Notion `Lecture DB`의 Day1-Day4 문서. 원문 추출본은 `docs/notion-lectures/`에 보관했다.

## 프로젝트 가설

이 프로젝트는 단순한 "프롬프트 생성기"가 아니라, 창작자의 막연한 아이디어를 제작 가능한 사양으로 바꾸는 AI 제작 보조 도구가 되어야 한다.

Day1-Day4 자료의 공통 흐름은 명확하다.

1. 모호한 상상을 구조화된 언어로 바꾼다.
2. 캐릭터와 스타일의 일관성을 보존한다.
3. 텍스트 프롬프트만으로 부족한 영역은 워크플로우 엔진으로 제어한다.
4. 영상 제작에서는 아이디어를 시각 사양, 서사 논리, 프레임 시퀀싱, 샷 프롬프트로 변환한다.

따라서 `ai-prompter`의 초안 방향은 **러프 아이디어를 프롬프트 자산, 캐릭터 자산, ComfyUI 워크플로우 레시피, AI 영상 샷 플랜으로 변환하는 제작 시스템**이다.

## 강의별 핵심 자산

### Day1: 프롬프트 엔지니어링 기초

핵심 메시지: AI는 사용자의 의도를 읽지 못한다. 사용자가 상상을 명확한 구조와 제약으로 변환해야 한다.

재사용 가능한 개념:

- 제로샷과 퓨샷.
- 단계별 분해를 통한 계획과 검증.
- 역할, 맥락, 제약, 예시, 출력 형식, 품질 기준.
- 이미지에서 프롬프트를 추출하는 레퍼런스 분석 워크플로우.
- "Garbage in, garbage out": 모호한 입력은 범용적이고 쓸모없는 결과를 만든다.
- 애니메이션 프롬프트 구성 요소: 장면, 카메라, 조명, 색감, 스타일, 움직임, 출력 사양.

제품화 포인트:

- 사용자가 한 줄 입력만 던지지 않도록 구조화 필드를 제공해야 한다.
- "멋진", "예쁜", "역동적인", "시네마틱한" 같은 약한 표현을 감지하고 구체 사양으로 바꾸게 해야 한다.
- 첫 번째 MVP 흐름은 `러프 아이디어 -> 구조화 프롬프트 -> 품질 점검 -> 최종 프롬프트`가 적합하다.

### Day2: 캐릭터 일관성

핵심 메시지: AI가 그린 한 장의 우연한 이미지는 제작 자산이 아니다. 각도, 포즈, 조명, 화풍이 바뀌어도 같은 인물임을 유지할 수 있어야 한다.

재사용 가능한 개념:

- 캐릭터 일관성은 디지털 정체성 설계 문제다.
- 마스터 캐릭터 시트를 먼저 만든다.
- Gemini에서는 같은 대화 세션 안에서 Identity Anchoring을 활용한다.
- 모델별 프롬프트 전략이 다르다.
  - Gemini: Markdown 구조와 명확한 섹션.
  - GPT/DALL-E: 문맥, 관계, JSON에 가까운 구조.
  - Midjourney: 이미지 레퍼런스와 파라미터.
  - Stable Diffusion/ComfyUI: 가중치 토큰, 어댑터, 제어 이미지.
- 프롬프트 충돌 유형: 스타일 충돌, 논리적 불가능성, 의미론적 모호성.
- 포즈 스켈레톤, 손그림 스케치, 프레임 레이아웃은 시각 제어 입력으로 사용할 수 있다.
- 최종 실습은 앵커링된 캐릭터와 레이아웃 가이드를 이용한 웹툰 한 페이지 제작이다.

제품화 포인트:

- 프롬프트 문자열이 아니라 `CharacterAsset`을 별도 자산으로 다뤄야 한다.
- 바뀌면 안 되는 정체성 속성과 장면마다 바뀌는 속성을 분리해야 한다.
- 레퍼런스 이미지, 캐릭터 시트, 포즈 스켈레톤, 레이아웃 가이드를 첨부 슬롯으로 관리해야 한다.
- 프롬프트 충돌 검사기가 필요하다.

### Day3: ComfyUI 워크플로우 기초

핵심 메시지: 정밀 제어에는 텍스트 프롬프트만으로 부족하다. ComfyUI는 이미지, 포즈, 마스크, 모델 조건을 노드 기반으로 제어한다.

재사용 가능한 개념:

- 노드 기반 생성 그래프.
- 이미지 컨디셔닝을 통한 캐릭터와 스타일 제어.
- ControlNet + DWPose: 포즈 스켈레톤 기반 생성.
- Qwen Image Edit: 이미지 조건 편집.
- Z-Image Turbo: 빠른 탐색과 반복.
- Inpainting: 마스크 기반 부분 수정.
- Wan Animate: 정지 이미지에서 짧은 영상 생성.
- 로컬 GPU가 없는 학습자를 위한 클라우드 ComfyUI 흐름.

제품화 포인트:

- 워크플로우 레시피를 별도 자산으로 표현해야 한다.
- 사용자의 의도와 실제 실행 파이프라인을 분리해야 한다.
- 문제 유형에 따라 워크플로우를 추천할 수 있어야 한다.
  - 포즈 문제: ControlNet/DWPose.
  - 일부 수정: Inpainting.
  - 빠른 탐색: Turbo 계열 모델.
  - 이미지에서 영상: Wan Animate.
- 각 레시피는 필요한 입력, 기대 출력, 실패 가능성을 포함해야 한다.

### Day4: AI 영상 제작 파이프라인

핵심 메시지: AI 영상은 운에 맡기는 생성이 아니라, 아이디어를 시각 사양, 서사 논리, 프레임 시퀀싱, 샷 프롬프트로 변환하는 공정이다.

재사용 가능한 개념:

- 후크라인을 Visual Spec 7로 분해한다.
  - Character
  - Environment
  - Camera
  - Lighting
  - Color
  - Mood
  - Time
- Conflict Trigger: 시각적 물리 법칙이 서사적 장애물이 되게 한다.
- Triple Preset Strategy: 하나의 후크에서 세 가지 물리 세계관을 만든다.
- Integrated Logline: 주인공, 목표, 장애물, 이해관계, 시각 논리를 통합한다.
- 3막 시놉시스와 강도 곡선: `I≈0.2 -> I=1.0 -> I≈0.5`.
- 시퀀싱 전략: 시간 길이, 비트, Dynamic SFX, Ambient SFX, BPM, 순환 구조.
- 3x3 Grid Blueprint: GLOBAL 규칙과 Frame 1-9를 분리한다.
- Shot Prompt Synthesis: 그리드 비트를 영상 생성용 샷 프롬프트로 바꾼다.
- 실행 단계: 그리드 생성, 패널 추출, 업스케일, Kling/Seedance 영상화, 편집, 오디오, 최종 QA.

제품화 포인트:

- 고급 플로우는 `후크 -> Visual Spec 7 -> 프리셋 선택 -> 로그라인 -> 3막 시놉시스 -> 9프레임 그리드 -> 샷 프롬프트`가 적합하다.
- 모든 프레임과 샷에 GLOBAL 규칙을 반복 적용해 데이터 드리프트를 줄여야 한다.
- 시각 사양 누락, 시간 좌표 누락, 약한 강도 곡선, 해결되지 않은 Logic Rule을 검사해야 한다.

## 자산 모델 초안

```ts
type VisualSpec7 = {
  character: string;
  environment: string;
  camera: string;
  lighting: string;
  color: string;
  mood: string;
  time: string;
};

type CharacterAsset = {
  name: string;
  identityAnchor: string;
  immutableTraits: string[];
  mutableSceneTraits: string[];
  referenceImages: string[];
  negativeTraits: string[];
};

type WorkflowRecipe = {
  name: string;
  purpose: string;
  requiredInputs: string[];
  output: string;
  bestFor: string[];
  failureModes: string[];
};

type VideoPlan = {
  hookLine: string;
  visualSpecs: VisualSpec7[];
  selectedPreset: string;
  conflictTrigger: string;
  logline: string;
  actSynopsis: {
    act: 1 | 2 | 3;
    intensity: string;
    summary: string;
  }[];
  gridFrames: {
    frame: number;
    beat: string;
    visualSpec: VisualSpec7;
    sfx?: string;
  }[];
};
```

## 초기 기능 백로그

1. Prompt Structurer
   - 러프 요청을 구조화 필드로 변환한다.
   - Gemini, GPT/DALL-E, Midjourney, ComfyUI용 프롬프트를 모델별로 출력한다.

2. Prompt QA
   - 모호한 표현, 출력 형식 누락, 충돌 조건, 약한 제약을 감지한다.
   - 수정 프롬프트와 짧은 수정 이유를 함께 제공한다.

3. Character Asset Builder
   - 캐릭터 시트 프롬프트를 만든다.
   - 정체성 속성과 장면 속성을 분리한다.
   - Identity Anchoring 지시문을 생성한다.

4. Workflow Router
   - 사용자의 제작 문제에 맞는 ComfyUI 계열 워크플로우를 추천한다.
   - 필요한 입력과 다음 행동을 제시한다.

5. Visual Spec Generator
   - 후크라인을 Visual Spec 7로 변환한다.
   - 세 가지 프리셋 세계관을 제안한다.

6. Video Pipeline Generator
   - 로그라인, 3막 시놉시스, 3x3 그리드, 샷 프롬프트를 만든다.
   - 모든 프레임에 GLOBAL 일관성 규칙을 유지한다.

7. Production QA Checklist
   - 캐릭터 일관성, 시각 사양 완성도, 서사 논리, 프레임 타이밍, 프롬프트 드리프트를 검사한다.

## 추천 MVP 흐름

첫 번째 버전은 하나의 완결된 경로에 집중한다.

```text
러프 아이디어
-> 구조화 프롬프트
-> Visual Spec 7
-> 캐릭터/장면 일관성 점검
-> 최종 프롬프트 팩
```

그 다음 확장 경로:

```text
후크라인
-> Triple Preset
-> Integrated Logline
-> 3막 시놉시스
-> 3x3 그리드
-> 샷 프롬프트 팩
```

## 저장된 프로젝트 자산

- `docs/notion-lectures/day1.md`: 프롬프트 엔지니어링 기초.
- `docs/notion-lectures/day2.md`: 캐릭터 일관성과 Identity Anchoring.
- `docs/notion-lectures/day3.md`: ComfyUI 워크플로우 기초.
- `docs/notion-lectures/day4.md`: AI 영상 제작 파이프라인.
- `docs/notion-lectures/index.json`: Notion 페이지 메타데이터.

임시 Notion 미디어 URL은 만료되고 저장소 자산으로 부적합하므로 redacted 처리했다. 이미지 참조가 필요하면 Notion 원본에서 다시 export해야 한다.
