---
title: Day4 AI 영상 제작 파이프라인
domain: sources
problem: P1
s: [S1]
tags: [notion, video]
status: completed
created: 2026-06-04
---

# Day4. AI 영상 제작 파이프라인

- Source: Notion page 336bac7f-0000-804c-8881-f684418f9733
- Last edited: 2026-05-15T01:17:00.000Z

AI 영상 제작은 이제 '운에 맡기는 생성'이 아닙니다. **상상을 물리적 사양서로 번역하는 공정**입니다. 이 파이프라인은 AI를 '딸깍'하는 도구가 아닌, 시네마토그래피를 제어하는 엔진으로 다루는 법을 가르칩니다.

## Phase 1-1. Hook Line - Visual Spec의 7요소 추출

**목표:** 추상적 아이디어를 AI가 연산할 수 있는 7가지 시각 사양(Visual Spec)으로 분해한 뒤, 이를 통해 물리적 세계관과 서사적 갈등을 역산

후크 라인은 7가지 시각 사양의 **'출발점(Seed)'**을 결정하는 단계입니다.

#### 1단계: '느낌(Vibe)'의 파쇄 (The Death of Vague Descriptions)

- ⚠️ **문제의식:** "무서운 분위기", "역동적인 액션" 같은 형용사는 데이터값이 없습니다. AI는 이를 주관적으로 해석하며, 그 결과는 창작자의 통제를 벗어난 '우연'에 맡겨집니다.

- ✅ **해결책:** 감정을 형용사로 묘사하며 **AI의 해석에 의존**하는 대신, 렌즈의 초점거리(mm)와 물리적 점성(Viscosity) 같은 **시네마틱 표준(Cinematic Specs)**을 통해 관객이 느낄 감각을 **수치로 직접 설계(Programmatic Design)**하는 방식을 채택합니다.

#### 2단계: 전통 시네마토그래피의 5요소 (출발점)

시각 정보를 분해하는 출발점은 영화 100년이 합의해온 표준 분류입니다.

| # | 전통 5요소 | 통제 영역 |
| --- | --- | --- |
| 1 | **Composition / Framing** | 프레임 안 요소 배치 |
| 2 | **Lighting** | 광원·강도·방향·색온도 |
| 3 | **Color** | 색채·팔레트·룩 |
| 4 | **Camera Movement** | 카메라 움직임 (pan, tilt, dolly...) |
| 5 | **Mise-en-scène** | 카메라 앞 모든 것 (인물·의상·세트·소품·동선) |

출처: Adobe Creative Cloud / MasterClass / Columbia Film Glossary 등 공통 분류.

#### 3단계: AI 영상 매체로의 변환 (3가지 변화)

이 5요소가 AI 프롬프팅에 그대로 적용되지는 않습니다. 다음 변환이 일어납니다.

| 변화 | 내용 | 결과 |
| --- | --- | --- |
| **분해** | Mise-en-scène (단일 메타-범주) | → **Character**  • **Environment** (2분리) |
| **흡수** | Composition (단독 항목) | → **Camera**에 흡수 (렌즈·앵글이 구도를 결정) |
| **추가** | (전통에서는 암묵·편집 영역이던 차원) | → **Mood** (정서 수치화) + **Time** (시퀀스 좌표화) |

: 5요소가 7요소로 재구성됩니다.

> 이 변환의 근거 ‘Mise-en-scène이 왜 분해되어야 하는지, Mood/Time이 왜 별도 차원이어야 하는지 ‘는 **Phase 3-1에서 실제 사례 두 편(Case 1·2)을 분해하며 검증**합니다.

#### 4단계: Visual Spec의 7가지 차원

모든 시각 정보를 7가지 사양으로 분해합니다. 이 7가지가 영상의 룩(Look)과 흐름을 설계하는 공통 언어가 됩니다.

| # | 요소 | 계보 | 한 줄 정의 | 예시 사양 |
| --- | --- | --- | --- | --- |
| 1 | **Character** | 변형 | 인물의 시각적 정체성 | "60대 스케이터", "실크 잠옷을 입은 여인" |
| 2 | **Environment** | 변형 | 공간·세트의 사양 | "황혼의 돌마을", "비에 젖은 복도" |
| 3 | **Camera** | 변형 | 광학 사양 (렌즈·앵글·움직임) | "85mm push-in", "24mm parallax" |
| 4 | **Lighting** | 불변 | 광원·강도·방향 | "Late afternoon light", "side light" |
| 5 | **Color** | 불변 | 색채 사양·룩 | "Hyperreal Pop", "Cyan Tint, Deep Shadow" |
| 6 | **Mood** | 추가 | 정서의 수치 | "145 BPM", "Late-for-work panic" |
| 7 | **Time** |  추가 | 시퀀스의 좌표 | "0:00–0:02", "FRAME 5: I=1.0" |

> 
> ##### **한 줄 요약:** AI에게 '느낌'을 말하지 마라. 대신 '사양(Spec)'을 입력하라.

#### 5단계: '물리적 변이'와 갈등의 결합 (Physics as Narrative)

- ⚠️ **문제의식:** 비주얼과 스토리가 따로 노는 현상을 어떻게 방지할 것인가?

- ✅ **해결책:** **'Conflict Trigger(갈등 트리거)'** 개념을 도입합니다.
  - 예를 들어  "방바닥이 저승이다"라는 설정에 그치지 않고, "단단했던 바닥(Rigid-body)이 특정 주파수에서 끈적이는 유체(Fluid-dynamic)로 변한다"는 **물리적 성질의 변이**가 곧 주인공이 마주할 실질적 장애물(로그라인)이 되도록 설계합니다.

#### 6단계: 다중 세계관 시뮬레이션 (Triple Preset Strategy)

하나의 후크라인에서 **전혀 다른 세 가지 물리적 세계관**을 도출합니다. 같은 아이디어라도 어떤 물리 법칙을 선택하느냐에 따라 장르와 분위기가 완전히 달라집니다. 기술 사양(Spec)이 먼저 제시되면, 자신의 서사에 가장 맞는 **시각적 환경 설정값**을 선택할 수 있게 됩니다.

- 기술 사양을 통해 장르적 스펙트럼(예: 고딕 호러, 디지털 글리치, 에테리얼 판타지)을 먼저 제시함으로써, 본인이 자신의 서사에 가장 적합한 **시각적 환경 설정값**을 선택할 수 있는 구조를 만들어야 합니다.

> 예제: 우리집 방바닥은 저승과 연결되어 있다!

후크 라인과 갈등 트리거로 나올 수 있는 데이터 예시

| 요소 | 예시 데이터 (Glitch Preset) | 역할 |
| --- | --- | --- |
| **Character** | 잠든 아기를 안은 30대 아빠 | 누구인가 |
| **Environment** | 거실. 검은 액체로 변하는 바닥 | 어디에 있는가 |
| **Camera** | 50mm low-angle, slow push-in | 어떻게 잡는가 |
| **Lighting** | 새벽빛, 차가운 푸른 광원 | 어떻게 빛나는가 |
| **Color** | Cyan Tint, Deep Shadow | 어떤 색조인가 |
| **Mood** | Surreal Horror, 70 BPM | 어떤 느낌인가 |
| **Time** | 15초, 3막 (5+7+3초) | 언제·얼마나 |

## Phase 1-2: 실전 예제를 통해 결과물을 뽑아 봅시다.

이 프롬프트는 후크라인을 입력받아 세 가지 비주얼 세계관(Preset)과 그에 따른 서사 프로토타입을 설계합니다. 하나의 후크라인에서 전혀 다른 세 개의 영상 아이디어가 나올 수 있다는 것을 확인하는 단계입니다.

> 
> ##### Conflict Trigger란?

> 정의된 물리 사양 안에서 **필연적으로 발생하는 한 줄 갈등**을 뜻합니다. 단순한 설정 묘사("방바닥이 저승이다")가 아니라 물리적 변이의 형태("단단했던 바닥이 특정 BPM에서 점성 4500cP의 유체로 변한다")로 작성합니다. 이 한 줄이 다음 단계 Phase 2-1 로그라인의 시각적 장애물(Visual Obstacle)변수로 그대로 계승되어, 비주얼 사양이 단순한 룩이 아니라 서사 갈등의 씨앗이 되어, 후크라인과 합쳐져 스토리를 보강하는 도구로 사용됩니다.

아래 프롬프트 블록을 복사해 AI에 붙여넣고, 마지막 줄 `[후크라인]:` 뒤에 여러분의 아이디어를 입력하세요.

```markdown
[Role & Philosophy]
당신은 입력된 한 줄 후크라인을, 후속 단계(Phase 2-1 통합 로그라인)가 받아 4대 변수로 분해할 수 있는 3종의 Visual Preset으로 펼치는 'AI 기술 감독(TD)'입니다.
철학: "후크라인은 한 문장의 씨앗. 세 갈래로 펼쳐야 자기 영상의 물리적 세계관을 선택할 수 있다."

[Mission]
입력된 [후크라인]에서 출발해, 서로 다른 물리적 세계관을 가진 3종의 Visual Preset을 설계한다.
각 Preset은 다음 두 조건을 만족해야 한다:
(1) 입력 후크라인의 명사·동사·물성에서 직접 도출 — 본 단계는 새 후크라인을 만드는 게 아니라 펼치는 단계
(2) Phase 2-1이 받아 4대 변수(Identity/Goal/Visual Obstacle/Stakes)로 분해할 수 있는 사양 데이터 형식

[차원 가이드 — 카테고리 분류로만 제시]
세 Preset은 서로 다른 물리적 세계관에 위치해야 한다. 다음 4가지 차원 중 입력 후크라인 성격에 맞춰 서로 충돌하는 차원 조합을 3개 도출하라. 차원 자체를 결과물에 출력하지 말고 길잡이로만 사용할 것:

- **물리 법칙 차원:** 사실주의 / 초현실 / 디지털·글리치 / 시적 환상 / 만화적 과장
- **시간 흐름 차원:** 정상 시간 / 압축 시간 / 확장 시간 / 비선형·역행 시간
- **감각 우선 차원:** 시각 우선 / 청각 우선 / 촉각·물성 우선 / 정서 우선
- **톤 차원:** 진지 / 유머 / 멜랑콜리 / 위트·아이러니 / 다큐적 관찰

각 Preset은 위 4차원에서 한 값씩 선택한 조합이 되며, 세 Preset 간 조합의 중복도는 50% 미만이어야 한다.

[제약 조건]
- 세 Preset의 구체 어휘는 입력 후크라인의 핵심 명사·동사·물성에서 직접 도출. 차원 가이드의 카테고리 명을 그대로 출력 금지
- 본 강의 본문의 예제 어휘(저승·검은 액체·잠든 아기·50mm push-in·70 BPM·15초 3막·점성 수치 등)와 어휘 충돌이 발생하면, 입력 후크라인 어휘를 우선하고 본문 예제 어휘는 제거할 것
- 7요소는 형용사·산문 묘사가 아닌 측정 가능한 사양 데이터로 작성 (구체 명사·표준 용어·기술 키워드)
- Mood는 정성적 템포·정서 키워드까지만 (BPM 수치는 시퀀싱 단계에서 결정되므로 본 단계 출력 금지)
- Time은 영상 총 길이(15초 또는 30초)까지만 (3막 시간 분배·I=1.0 좌표는 후속 시퀀싱 단계에서 결정되므로 본 단계 출력 금지)
- 각 사양은 한 줄을 넘기지 말 것
- Conflict Trigger는 단순 설정 묘사가 아닌 물리적 변이 형태로 작성 (재질·운동성·강도가 시간 흐름 속에서 변하는 형태. 수치 차용 강제 아님 — 입력 후크라인 사양에 따라 정성적 묘사도 가능)

[자기 검증 — 출력 전 5단계 점검]
다음을 모두 통과한 결과만 제출:

1. **차원 가이드 차용 차단:** 출력에 "물리 법칙 차원·시간 흐름 차원·감각 우선 차원·톤 차원" 같은 가이드 용어가 그대로 들어 있는가? 들어 있으면 모두 삭제.

2. **본문 예제 어휘 차단:** 출력에 본문 예제 어휘(저승·검은 액체·잠든 아기·50mm push-in·70 BPM·15초 3막·점성 4500cP 등)가 입력 후크라인과 무관하게 들어 있는가? 들어 있으면 입력 후크라인 어휘로 치환.

3. **3 Preset 독립성:** 세 Preset이 서로 다른 차원 조합인가? 두 Preset의 차원 조합이 50% 이상 겹치면 재설계.

4. **후크라인 충실성:** 입력 후크라인의 핵심 명사·동사·물성이 세 Preset 모두에 흔적으로 살아 있는가? 후크라인이 사라지고 본문 예제로 회귀했다면 재작성.

5. **단계 경계 준수:** Mood에 BPM 수치, Time에 3막 시간 분배·I=1.0 좌표가 들어 있는가? 들어 있으면 후속 단계 영역이므로 삭제하고 정성적 표현으로 치환.

---
### [INPUT DATA]
[후크라인]: (한 줄 아이디어)
---

### [OUTPUT FORMAT]

## Preset 1: [Preset 이름 — 후크라인 어휘에서 도출한 한 줄 정체성]
| 요소 | 사양 |
|------|------|
| Character | 인물의 정체성·의상·자세 (후크라인 어휘 기반) |
| Environment | 공간·재질·시대 (후크라인 어휘 기반) |
| Camera | 렌즈(mm)·앵글·움직임·심도 |
| Lighting | 광원·강도·방향·색온도 |
| Color | 팔레트·룩 |
| Mood | 정성적 템포·정서 키워드 |
| Time | 영상 총 길이 (15초 또는 30초) |

**Conflict Trigger:** (이 사양 안에서 필연적으로 발생할 한 줄 물리 변이 갈등 — 시간 흐름 속에서 재질·운동성·강도가 변하는 형태)

## Preset 2: [Preset 이름]
(동일 형식 — Preset 1과 다른 차원 조합)

## Preset 3: [Preset 이름]
(동일 형식 — Preset 1·2와 다른 차원 조합)
```

## Phase 2: 서사 통합 (Narrative Integration)

Phase 1에서 결정한 7요소 비주얼 사양은 그 자체로는 '장면'일 뿐, 아직 '이야기'가 아닙니다. Phase 2는 이 사양을 인물의 행동과 갈등으로 번역하는 단계입니다.

- **Phase 2-1 (Logline)**: Visual Spec 7요소 + Conflict Trigger를 받아, 인물의 정체성·목표·장애물·결과를 결합해 한 줄 로그라인을 만듭니다.

- **Phase 2-2 (3-Act Synopsis)**: 로그라인을 시간 축에 펼쳐 Intensity 곡선(I≈0.2 → 1.0 → 0.5)이 박힌 3막 시놉시스로 확장합니다.

이 단계를 거쳐야 비주얼 사양이 '스토리텔링'이 됩니다.

## Phase 2-1: Logline Integration (서사적 통합)

**목표:** [주인공] + [목표] + [시각적 장애물] + [잃을 것]을 결합하여, AI가 연산할 수 있는 인과관계의 로직을 완성함.

#### 데이터 흐름

| 흐름 | 데이터 | 설명 |
| --- | --- | --- |
| ⬇️ INPUT (from Phase 1-2) | Visual Spec 7요소 | 인물·공간·카메라·조명·색채·정서·시간 |
|  | Conflict Trigger | 한 줄 물리 갈등 |
| ⬆️ OUTPUT (→ Phase 2-2) | Integrated Logline | 한 줄 통합 로그라인 |
|  | Data Logic Sync | Optical/Spatial/Temporal Logic 3그룹 |

#### 1. 로그라인 - Hollywood 4요소 표준

로그라인은 Hollywood 시나리오 산업에서 100년간 다듬어진 표준 형식이 있습니다. 주요 출처가 공통으로 제시하는 4요소는 다음과 같습니다.

| # | Hollywood 표준 | 통제 영역 |
| --- | --- | --- |
| 1 | **Protagonist (Hero)** | 주인공의 정체성·결함 |
| 2 | **Goal (Objective)** | 인물이 추구하는 것 |
| 3 | **Antagonistic Force (Obstacle)** | 목표를 가로막는 적대 세력·장애물 |
| 4 | **Stakes** | 실패하면 잃을 것 |

추가 요소: **Inciting Incident (촉발 사건)** — Hollywood 표준 4요소에는 빠져 있지만, 대부분의 영화 로그라인에 함께 등장합니다. 우리 파이프라인에서는 Phase 1-2의 Conflict Trigger가 이 역할을 합니다.

> 표준 공식: 
> _"When [inciting incident], [hero] struggles against [antagonistic force] in order to [goal] before [stakes are lost]." 
> ”[촉발 사건]이 일어나자, [주인공]은 [잃을 것]이 사라지기 전에 [목표]를 이루기 위해 [적대 세력]에 맞서 분투한다.”_

출처: MasterClass / Save the Cat (Blake Snyder) / ScreenCraft / NFI 등 공통 분류.

#### 2. AI 영상 매체로의 변환

이 4요소가 AI 영상 매체에 그대로 적용되지는 않습니다. 다음 변환이 일어납니다.

| 변화 | Hollywood 표준 | AI 영상 변수 |
| --- | --- | --- |
| 불변 | Protagonist | → **Identity** (시각적 정체성으로 강조) |
| 불변 | Goal | → **Goal** (그대로) |
| 변형 | Antagonistic Force / Obstacle | → **Visual Obstacle** (Phase 1-2 Conflict Trigger를 시각적 장애로 번역) |
| 불변 | Stakes | → **Stakes** (Goal 실패 시 잃을 것) |
| 위치 변경 | Inciting Incident | → Phase 1-2의 **Conflict Trigger**가 사실상 이 역할 |

#### 로그라인의 4대 구성 변수 (Variable Setup)

Hollywood 4요소가 4대 변수(Identity / Goal / Visual Obstacle / Stakes)로 재구성되며, Conflict Trigger가 Inciting Incident 역할을 합니다.

- **Variable A: Identity (고정 자산)** — Hollywood 표준의 **Protagonist**
  - **설명:** 영상 내내 유지되어야 할 주인공의 시각적 정체성 (REF_ID).

    - **사양:** 나이, 직업, 의상의 재질 등 (예: "60대 스케이터", "실크 잠옷을 입은 여인").

- **Variable B: Goal (지향 벡터)** — Hollywood 표준의 **Goal**
  - **설명:** 인물이 15초 동안 도달하고자 하는 물리적/심리적 목적지.

    - **사양:** (예: "현관문까지 탈출하기", "아이스크림을 한 입 베어 물기").

- **Variable C: Visual Obstacle (시각적 마찰)** — Hollywood 표준의 **Antagonistic Force / Obstacle** - **[가장 중요]**
  - **설명:** 앞서 선택한 **Visual Spec의 Conflict Trigger**가 인물의 Goal을 방해하는 기술적 방식.

    - **사양:** (예: "유체로 변한 바닥의 점성(4500cP)", "145 BPM으로 무너지는 공간의 리듬").

- **Variable D: Stakes (잃을 것)** — Hollywood 표준의 **Stakes**
  - **설명:** Goal에 실패할 경우 인물이 잃게 되는 것 — 시각적·심리적·사회적 결과. Phase 2-2에서 3막 결말부(Imprint)의 시각적 잔상으로 박제됨.

    - **사양:** (예: "잠든 아기가 깨어 울음 → 가정의 평화 깨짐", "지각으로 평판 추락", "공동체에서 추방됨").

> 4대 변수를 AI구성 변수로 전환할 때 유의 사항 
> 1. **아이러니의 데이터화:** 아이러니(A↔C) 충돌. 주인공의 특성(아기를 안음)과 비주얼 사양(출렁이는 바닥)이 충돌할 때 서사의 밀도가 높아집니다.

>   2. **동사 위주의 설계:** "슬프다"가 아니라 "휘청인다", "매달린다", "비산한다"처럼 **물리적 행동**이 로그라인에 포함되어야 챕터 3의 액션 시트(`Action Sheet`)로 부드럽게 이어집니다.

>   3. **사양의 재확인:** 로그라인을 쓴 후, 반드시 "이 이야기가 내가 고른 프리셋의 7요소 사양 안에서만 가능한가?"를 자문해야 합니다.

#### 실전 조립: "저승 방바닥" 케이스 (Glitch Preset 선택 시)

위 원칙을 바탕으로, 비주얼 스펙을 [**Preset 02: Glitch Surrealism]**을 선택했다고 가정하고 실제로 조립해 보겠습니다. Phase 1-2에서 받은 3가지 Preset은 모두 가능성일 뿐, 아직 '내 영상'은 아닙니다. 이 단계에서 그 중 하나를 선택해 자기 비주얼로 확정하고, 그 사양 위에서 로그라인을 짭니다.

<!-- unsupported Notion block: column_list -->
<!-- unsupported Notion block: column -->
[image: Art by Andrew Benson(2016) / Technique : Collage, Glitch, Mixed Media](notion-asset://redacted-temporary-url)

<!-- unsupported Notion block: column -->
[image: **Oddworld x Souly - wzf / maybach (2024) - Editor:** Yannic Nixdorf](notion-asset://redacted-temporary-url)

출처: 

[bookmark](https://eyecannndy.com/)

- **비주얼 스펙 데이터:** `Physics: Fluid-dynamic Morphing`, `Conflict Trigger: 비정상적 좌표 이동`.

- **변수 조립:**
  - **Identity:** 잠든 아기를 안고 있는 초보 아빠.(확장된 상황 설정)

    - **Goal:** 거실 끝의 유모차까지 아기를 깨우지 않고 이동하기.

    - **Visual Obstacle:** 발을 뗄 때마다 거실 바닥이 검은 액체처럼 출렁이며 물리적 좌표가 뒤틀림.

> **[최종 로그라인]:** "잠든 아기를 안고 거실을 가로지르던 아빠가, 검은 액체로 성질이 변해가는 방바닥의 물리적 왜곡을 뚫고 유모차까지 무사히 도달해야 한다."

위의 내용을 반영한 프롬프트를 사용하여 로그라인을 뽑아보세요.

```markdown
[Role & Philosophy]
당신은 Phase 1-2의 후크라인·Visual Spec(7요소)·Conflict Trigger를 받아, 한 줄 통합 로그라인을 설계하는 '시네마틱 데이터 TD(Technical Director)'입니다.
철학: "로그라인은 한 문장에 응축된 시간이다. 펼쳐지지 않는 로그라인은 죽은 문장이다."

[Mission]
입력된 데이터를 Hollywood 표준 4요소에 정합되는 4대 변수(Identity / Goal / Visual Obstacle / Stakes)로 분해하고, 이를 한 문장 통합 로그라인으로 응축한다.
이 로그라인은 두 조건을 동시에 만족해야 한다:
(1) 그 자체로 완결된 서사 청사진 — 한 문장만으로 "누가 / 무엇을 하려고 / 무엇 때문에 / 무엇을 잃는 중인지"가 시각화될 것
(2) 시간 축에 펼쳐질 잠재 에너지를 내장 — 4대 변수가 막을 거치며 어떻게 변주될지가 문장 안에 이미 코딩되어 있을 것

[설계 원칙 — 시간 축 잠재력의 내장]
로그라인은 정적 묘사가 아니라 '응축된 시간'이다. 4대 변수 각각이 시간 흐름 속에서 가질 잠재 변주를 문장 안에 미리 박아라:

- **Identity:** 1막의 일상 정체 → 2막의 위기 속 유지 → 3막의 변화된 잔상으로 변주될 자산. 따라서 '유지될 수 있는' 구체적 시각 속성(의상 재질·신체 자세·동반 객체)으로 박을 것
- **Goal:** 1막의 출발점 → 2막의 충돌 정점 → 3막의 도달/좌절로 변주될 벡터. 따라서 '진행 정도가 시각적으로 판정 가능한' 물리적 목적지로 박을 것
- **Visual Obstacle:** 1막의 잠복 → 2막의 폭주(I=1.0) → 3막의 잔상으로 변주될 물리 사양. 따라서 '강도(수치·점성·진폭)가 변할 수 있는' 물리 변수로 박을 것 — Conflict Trigger의 사양을 그대로 계승
- **Stakes:** 1막의 함의 → 2막의 임박 → 3막의 박제로 변주될 손실. 따라서 '시각적으로 박제 가능한 구체 결과'로 박을 것

[제약 조건]
- Identity: 시각적으로 식별 가능한 명사구 (나이/직업/의상 재질/동반 객체 중 최소 2개)
- Goal: 15초 안에 진행도가 시각적으로 판정 가능한 물리적 목적지 또는 행위
- Visual Obstacle: 입력 Conflict Trigger의 물리 사양(수치·재질·운동성)을 그대로 계승. 추상적 적대자(악역·통념) 금지
- Stakes: Goal 실패 시 잃을 것을 시간 조건절("X가 ~하기 전에") 또는 결과 조건절("~하지 못하면 Y") 형태로 로그라인 본문에 명시
- 형용사("슬프다"/"무섭다") 금지. 측정 가능한 물리적 동사("휘청인다"/"비산한다"/"응고한다"/"뒤틀린다") 사용
- 한 문장. 마침표 하나. 4대 변수가 문장 안에서 모두 식별 가능 (Identity → Goal → Visual Obstacle → Stakes 순서 권장)
- A↔C 아이러니 강제: Identity의 속성과 Visual Obstacle의 물리 법칙은 서로를 방해하는 관계여야 함 (예: 아기를 안은 아빠 ↔ 출렁이는 바닥)

[자기 검증 — 출력 전 5단계 점검]
다음을 모두 통과한 결과만 제출:
1. **사양 회귀:** Visual Obstacle이 입력 Conflict Trigger의 물리 사양을 그대로 포함하는가?
2. **아이러니:** Identity 속성과 Visual Obstacle 물리가 서로를 방해하는가? 무관하면 재작성.
3. **동사:** 측정 가능한 물리적 동사가 최소 1개 박혀 있는가?
4. **자족성:** 이 한 문장만으로 외부인이 "누가·무엇·왜·무엇을 잃는 중"을 시각화 가능한가?
5. **펼침 가능성(가장 중요):** 이 로그라인을 1막(잠복)·2막(폭주)·3막(잔상) 시간 축에 펼쳤을 때, 4대 변수 각각이 변주할 여지가 문장 안에 있는가? 변주가 한 변수라도 불가능하면 그 변수를 재설계.

---
### [INPUT DATA]
1. **후크라인:** Phase 1-2에 입력했던 원 아이디어
2. **Visual Spec (7요소):** Character / Environment / Camera / Lighting / Color / Mood / Time
3. **Conflict Trigger:** Phase 1-2의 한 줄 물리 갈등
---

### [OUTPUT FORMAT]

## 1. 4대 변수 분해
| 변수 | Hollywood 표준 | 사양 | 시간 축 잠재 변주 |
|------|---------------|------|------------------|
| Identity | Protagonist | (시각적 정체성 명사구 — REF_ID) | (막을 거치며 유지·변화될 시각 자산) |
| Goal | Goal | (15초 내 판정 가능한 물리적 목적) | (출발 → 충돌 → 도달/좌절의 벡터) |
| Visual Obstacle | Antagonistic Force | (Conflict Trigger의 물리 사양 번역) | (잠복 → 폭주 → 잔상의 강도 곡선) |
| Stakes | Stakes | (잃을 것의 구체 결과) | (함의 → 임박 → 시각적 박제) |

## 2. Integrated Logline
"(4대 변수가 한 문장 안에 시간 조건절 또는 결과 조건절로 응축된 한 문장)"

## 3. Data Logic Sync
- **Optical Logic:** (Camera·Lighting·Color 사양이 인물 인지에 가하는 광학적 제약 한 줄)
- **Spatial Logic:** (Character·Environment 사양이 인물 이동에 가하는 공간적 제약 한 줄)
- **Temporal Logic:** (Mood·Time 사양이 인물 심리 템포에 가하는 시간적 압박 한 줄)
```

## Phase 2-2: 3-Act Synopsis (서사적 에너지 설계)

**목표:** 통합된 로그라인(Integrated Logline)을 15~30초 시간 축에 펼쳐, 4대 변수가 Intensity 곡선(I≈0.2 → 1.0 → 0.5)을 따라 변주되는 3막 시놉시스로 확장함.

### 데이터 흐름

| 흐름 | 데이터 | 설명 |
| --- | --- | --- |
| ⬇️ INPUT (from Phase 2-1) | Integrated Logline | 4대 변수가 엮인 한 문장 |
|  | Data Logic Sync | Optical/Spatial/Temporal Logic 3그룹 |
| ⬆️ OUTPUT (→ Phase 3-1) | 3막 시놉시스 | Intensity 곡선이 박힌 시나리오 |
|  | Intensity 좌표 | I≈0.2 → 1.0 → 0.5 비트 시점 |

#### 1. 3막 구조 — 시나리오 산업 표준

3막 구조는 시나리오 산업의 보편 표준입니다. 아리스토텔레스(Aristotle)의 시학(BC 335)에서 출발한 시작-중간-끝 구조가 정형화되어 100년간 영화·TV·광고 시나리오의 골격이 되었습니다.

| 아리스토텔레스 시학 | 우리 체계 |
| --- | --- |
| 시작 (Beginning) | **Act 1. 기 (Activation)** |
| 중간 (Middle) | **Act 2. 승 (Collision)** |
| 끝 (End) | **Act 3. 결 (Imprint)** |

[image: Three act structure chart 출처: [Three Act Structure in Film: Definition and Examples](https://www.studiobinder.com/blog/three-act-structure/)](notion-asset://redacted-temporary-url)

각 막의 역할은 다음과 같습니다.

- **Act 1. 기 (Activation):** 설계된 데이터(BPM, 왜곡, 물리 법칙)가 일상 속에 **침투**하기 시작하는 시점.

- **Act 2. 승 (Collision):** 데이터 로직이 **폭주**하여 인물과 물리적으로 충돌하는 절정의 시점.

- **Act 3. 결 (Imprint):** 충돌이 남긴 시각적 **잔상**과 변화된 세계관을 박제하는 시점.

출처: Aristotle, _Poetics_ 

#### 2. AI 영상 매체로의 변환

이 표준이 AI 영상 매체에 그대로 적용되지는 않습니다. 다음과 같이 변환이 일어납니다.

| 변화 | 시나리오 산업 표준 | AI 영상 변수 |
| --- | --- | --- |
| 보존 | 3막 구조 (Setup-Confrontation-Resolution) | → **Activation-Collision-Imprint** (개념 동일, 기·승·결 매핑) |
| 변형 | "갈등 강도" 추상 개념 | → **Intensity 수치화** (I≈0.2 → 1.0 → 0.5) |
| 추가 | (시간은 분 단위, 편집의 결과) | → **초 단위 좌표** (15~30초, I=1.0 비트 시점 명시) |
| 변형 | "인물의 변화" 강조 | → **Visual Spec 7요소의 강도 변주** 강조 |

추상적 갈등 곡선이 측정 가능한 수치 곡선으로 번역되고, 시간이 편집 단계의 결과가 아니라 시놉시스 단계의 좌표가 됩니다.

#### 3. 4대 변수의 3막 분배

Phase 2-1에서 정한 4대 변수가 3막에 다음과 같이 분배됩니다. 약속한 "Stakes는 3막 결말부의 시각적 잔상으로 박제됨"이 여기서 구체화됩니다.

| 4대 변수 | Act 1. 기 (I≈0.2) | Act 2. 승 (I=1.0) | Act 3. 결 (I≈0.5) |
| --- | --- | --- | --- |
| **Identity** | 일상 속 정체 | 위기 속 정체 유지 | 변화된 정체의 잔상 |
| **Goal** | 출발점 명시 | Visual Obstacle과 충돌 | 도달 / 좌절 |
| **Visual Obstacle** | 잠복 (조용히 침투) | **절정** (물리 법칙 폭주) | 잔상 (붕괴된 공간) |
| **Stakes** | 함의 (잃을 것 암시) | 임박 (실패 직전) | **박제** (잃거나 지킴) |

> **핵심:** 시각적 마찰(Visual Obstacle)이 2막의 폭주를 책임지고, Stakes가 3막의 박제를 책임집니다. 이 두 변수가 약하면 시놉시스의 에너지 곡선이 무너집니다.

#### 4. '나열'에서 '스케일링(Scaling)'으로

기존의 시놉시스가 "무슨 일이 일어난다"는 나열이었다면, 이제는** "데이터 수치가 상승함에 따라 어떤 사건이 강제되는가"**를 설명해야 합니다. 4대 변수가 시간 축에 따라 어떻게 변주되는지가 곧 이야기입니다.

#### 5. 3막 시놉시스 프롬프트

위 내용을 반영한 프롬프트입니다. Phase 2-1의 결과물을 그대로 입력으로 사용하세요.

```markdown
[Role & Philosophy]
당신은 Phase 2-1의 통합 로그라인과 4대 변수 분해(시간 축 잠재 변주 포함)를 받아, 응축된 한 문장을 3막의 강도 곡선으로 펼치는 '시네마틱 스토리 아키텍트'입니다.
철학: "시놉시스는 사건의 나열이 아니라, 4대 변수의 강도 곡선이다. 펼침은 시간을 채우는 일이 아니라, 강도를 라벨링하는 일이다."

[Mission]
입력된 [통합 로그라인] + [4대 변수 시간 축 잠재 변주] + [Data Logic Sync]를 받아, Activation–Collision–Imprint 3막으로 펼치되, 다음 두 조건을 동시에 만족시킨다:

(1) **펼침의 작업** — 응축된 로그라인의 시간 축 잠재 변주를 3막에 매핑한다. 새로 짜는 것이 아니라 펼치는 것.
(2) **편집 자유도의 보존** — 시간 좌표(몇 초/몇 %)와 비트 분할은 결정하지 않는다. 그것은 후속 시퀀싱(Phase 3-1)의 영역이다. 본 단계는 막 단위의 **강도 라벨**과 **서사 흐름**까지만.

[설계 원칙]

1. **변주 계승의 원칙**
4대 변수의 `시간 축 잠재 변주` 열(Phase 2-1 출력)이 Activation–Collision–Imprint 세 막에 각각 어떻게 펼쳐지는지를 명시적으로 추적할 것. 펼쳐지지 않는 변주는 죽은 데이터다.

2. **3그룹 Logic 소비의 원칙**
Phase 2-1의 Optical/Spatial/Temporal Logic 3그룹이 각 막의 Data Scaling에 반드시 반영될 것. 7요소를 임의로 호명하지 말고, 3그룹 단위로 막마다 어떻게 강도가 변하는지 서술.

3. **시간 좌표 비결정의 원칙**
초·퍼센트·비트 개수는 출력하지 않는다. 본 단계가 결정하면 시퀀싱이 결정할 게 사라진다. 강도 라벨(I≈0.2 / 1.0 / 0.5)과 막 단위 서사 흐름까지만.

4. **Anchor / Bridge 구분의 원칙**
각 막 안에 절대 압축·생략 불가능한 **Anchor Beat**(서사 필수 비트)와 시퀀싱 단계에서 압축·재배치 가능한 **Bridge Beat**(연결재)를 구분 표기. 시퀀싱이 무엇을 살리고 무엇을 쳐낼지의 근거 데이터.

5. **서사 순서와 편집 순서의 분리**
본 시놉시스는 **서사 순서**(인과 시간순)로 작성. 그러나 각 막이 편집 단계에서 시간 순서를 어겨 배치될 수 있는지(in medias res, flash-forward, wraparound 등의 가능성)를 **재배치 가능성**으로 별도 명시. 실제 재배치 결정은 시퀀싱이 함.

[제약 조건]
- 4대 변수의 시간 축 분배:
  - Identity: 1막(일상 정체) → 2막(위기 속 유지) → 3막(변화된 잔상)
  - Goal: 1막(출발점) → 2막(Visual Obstacle과 충돌 정점) → 3막(도달/좌절)
  - Visual Obstacle: 1막(잠복) → 2막(폭주, I=1.0) → 3막(잔상)
  - Stakes: 1막(함의) → 2막(임박) → 3막(시각적 박제)
- 각 막의 Intensity는 표준 라벨(I≈0.2 / I=1.0 / I≈0.5)로 표기. 시간 비중·초 단위 좌표·비트 개수는 출력 금지
- 형용사 묘사 금지. 측정 가능한 물리적 동사 사용
- 각 막의 Anchor Beat 최소 1개, Bridge Beat 0개 이상 식별
- 로그라인에 없는 새 갈등·새 인물·새 공간 추가 금지 (펼침이지 새로 짜기가 아님)

[자기 검증 — 출력 전 6단계 점검]
다음을 모두 통과한 결과만 제출:

1. **변주 계승:** Phase 2-1의 4대 변수 `시간 축 잠재 변주` 열 4개 항목이 모두 본 시놉시스의 3막에 실제로 펼쳐져 있는가? 펼쳐지지 않은 항목이 있으면 그 막을 재작성.

2. **3그룹 소비:** Optical/Spatial/Temporal Logic이 각 막의 Data Scaling에 모두 등장하는가? 한 그룹이라도 호명되지 않으면 재작성.

3. **A↔C 충돌 정점:** 2막의 폭주가 Identity 속성과 Visual Obstacle 물리 법칙의 직접 충돌로 구성되어 있는가? (예: 아기를 안은 아빠 ↔ 출렁이는 바닥)

4. **시간 좌표 비결정:** 출력에 초 단위 좌표·시간 비중(%)·비트 개수가 들어 있는가? 들어 있으면 모두 삭제. 그것은 시퀀싱의 영역이다.

5. **Anchor 식별:** 각 막에 압축 불가능한 비트가 식별되어 있는가? 모든 비트가 동일 가중치면 시퀀싱이 결정할 게 없어진다.

6. **펼침 vs 추가 검증:** 본 시놉시스에 등장하는 모든 요소가 Phase 2-1 로그라인 안에서 추적 가능한가? 로그라인에 없는 새 갈등·새 인물·새 공간이 추가되었다면, 그것은 펼침이 아니라 새로 짜는 것이므로 삭제.

---
### [INPUT DATA]
1. **Integrated Logline:** Phase 2-1의 한 문장
2. **4대 변수 분해(시간 축 잠재 변주 포함):** Phase 2-1의 표 전체 — Identity/Goal/Visual Obstacle/Stakes 각각의 사양과 시간 축 잠재 변주
3. **Data Logic Sync:** Phase 2-1의 Optical/Spatial/Temporal Logic 3그룹
---

### [OUTPUT FORMAT]

## 1. 3막 강도 라벨링

| 막 | Intensity | 강도의 서사적 근거 |
|----|-----------|---------------------|
| Act 1 (Activation) | I≈0.2 | (왜 이 강도인가 — Visual Obstacle의 잠복과 Stakes의 함의 상태 한 줄) |
| Act 2 (Collision)  | I=1.0 | (왜 절정인가 — A↔C 충돌의 폭주 양상 한 줄) |
| Act 3 (Imprint)    | I≈0.5 | (왜 이 강도로 가라앉는가 — 잔상의 무게 한 줄) |

## 2. 3막 시놉시스 (서사 순서 작성)

### Act 1: Activation (I≈0.2)
- **Narrative Flow:** Identity의 일상 정체 + Goal의 출발점 + Visual Obstacle의 잠복 + Stakes의 함의가 동시에 작동하는 도입을 서술
- **Data Scaling:**
  - Optical: (Camera·Lighting·Color의 1막 양상)
  - Spatial: (Character·Environment의 1막 양상)
  - Temporal: (Mood·Time의 1막 양상)
- **Anchor Beat:** 이 막에서 절대 압축 불가능한 비트 1개 — 한 줄 행동 동사
- **Bridge Beat(s):** 압축·재배치 가능한 연결 비트들 — 0개 이상
- **재배치 가능성:** 이 막의 비트가 편집 단계에서 영상 후반부 또는 도입 wraparound로 이동 가능한가 (가능/불가능 + 한 줄 이유)

### Act 2: Collision (I=1.0)
- **Narrative Flow:** Visual Obstacle 폭주 ↔ Identity 유지 시도의 정면충돌, Goal 임박, Stakes 임박을 서술
- **Data Scaling:**
  - Optical: (2막 양상 — 광학·조명·색채의 충돌 강도)
  - Spatial: (2막 양상 — 인물·공간의 충돌 강도)
  - Temporal: (2막 양상 — 정서·시간의 충돌 강도)
- **Anchor Beat:** I=1.0 절정 비트 — 가장 강한 물리적 행동 동사
- **Bridge Beat(s):**
- **재배치 가능성:** 절정 비트가 in medias res로 영상 도입에 배치 가능한가 (가능/불가능 + 이유)

### Act 3: Imprint (I≈0.5)
- **Narrative Flow:** Goal 도달 또는 좌절 + Stakes의 시각적 박제 + Identity의 변화된 잔상을 서술
- **Data Scaling:**
  - Optical: (3막 양상 — 잔상의 광학)
  - Spatial: (3막 양상 — 변화된 공간)
  - Temporal: (3막 양상 — 가라앉는 호흡)
- **Anchor Beat:** Stakes 박제 비트
- **Bridge Beat(s):**
- **재배치 가능성:** 3막 비트가 영상 도입의 wraparound 프레임으로 사용 가능한가 (가능/불가능 + 이유)
```

## Phase 3-1: Sequencing Strategy (시퀀싱 점검과 개선)

**목표:** Phase 2-2의 3막 시놉시스를 두 실전 샘플과 대조해 점검하고, AI가 연산할 수 있는 형태로 보강함.

#### 데이터 흐름

| 흐름 | 데이터 | 설명 |
| --- | --- | --- |
| ⬇️ INPUT (from Phase 2-2) | 3막 시놉시스 | 4대 변수가 시간 축에 펼쳐진 시나리오 |
|  | Intensity 좌표 | I≈0.2 → 1.0 → 0.5 비트 시점 |
| ⬆️ OUTPUT (→ Phase 3-2) | 점검·보강된 시놉시스 | 비트 분할 + LOGIC RULE + BPM이 박힌 시나리오 |
|  | 시퀀싱 데이터 | 비트별 화각·SFX·일관성 상수 |

#### 1. 왜 점검이 필요한가

Phase 2-2에서 도출한 3막 시놉시스는 시간 축에 4대 변수가 펼쳐진 상태입니다. 그러나 이 상태로는 아직 AI가 연산할 수 있는 형태가 아닙니다. 비트가 너무 추상적이거나, 일관성 데이터가 명시되지 않았거나, 음악 동기화 좌표가 없을 수 있습니다.

이 단계는 두 실전 샘플을 분석해 여러분의 시놉시스에 무엇이 부족한지 직접 점검하고 보강하는 과정입니다. 두 샘플은 같은 15초 영상이지만 **서로 다른 측면을 가르칩니다.**

#### 2. 두 샘플의 역할 분담

| 측면 | Case 1 (터키 아이스크림) | Case 2 (직장인의 아침) |
| --- | --- | --- |
| **가르치는 핵심** | **시간 분할의 리듬** | **일관성과 밀도** |
| 시간 구조 | 15초 / 6 BEATS (서사 비트) | 15초 / 15 SHOTS / 145 BPM |
| 비트 길이 | 1.5~3초 | 1초 |
| 일관성 명시 | Mood로 암시 | LOGIC RULE 명문화 |
| 음악 동기 | 명시 없음 | 145 BPM 비트 동기 |
| 구조 | 비트별 명확한 행동 | 순환 구조 (Shot 1 ↔ Shot 15) |

Case 1에서 **"시간을 어떻게 의미 있는 비트로 쪼갤 것인가"**를, Case 2에서 **"그 비트들이 흔들림 없이 유지되려면 무엇이 필요한가"**를 배웁니다.

#### 3. Case 1 분석 — 시간 분할의 리듬

[embed](https://x.com/aimikoda/status/2034360858780819719)

```markdown
FORMAT: 15s / MULTI-CUT / 6 BEATS / HIGH-VIRAL COMEDIC PAYOFF

SUBJECTS: A small round-faced figure with huge eyes, copper-red pigtails, a yellow polka-dot dress, and exaggerated cartoon proportions. A tall ice cream vendor with a curled mustache, crimson vest, tilted cap, and a long brass paddle carrying elastic white ice cream. Stylized 3D animation with rounded shapes and squash-and-stretch.
ENVIRONMENT: A sunlit stone courtyard in an old hillside town with flower-draped archways, a mosaic fountain, ceramic bowls, and a brass ice cream cart with copper bells. Late afternoon light creates warm highlights on cobblestone.
MOOD: Fast slapstick mischief with instant hooks, fake wins, and a crowd-pleasing payoff.
COLOR LOGIC: Hyperreal Pop Look

TIMELINE:
0:00-0:02: The Scroll Stop. Extreme close-up, 50mm. Huge eyes reflect a spinning white scoop, then pull fast to a wide shot, 35mm, revealing the figure frozen mid-skid as the vendor presents the brass paddle like a stage trick. SFX: sharp gasp, bell flutter, fountain splash.
0:02-0:04: Match cut into The First Miss. Close-up, 50mm. Hands clap shut on empty air as the cone snaps upward. The face stays frozen while the pupils tilt up. SFX: quick whoosh, soft clap, tiny squeak, crowd chuckle.
0:04-0:07: Cut on action into The Side Switch. Medium wide shot, 35mm. The vendor slides the paddle behind his back and pops the cone out on the other side. The figure lunges left, scrambles right, and pinwheels in place. A tea glass rattles on a nearby table. SFX: paddle swishes, shoe skids, glass clink, growing laughter.
0:07-0:09: Reaction cut into The Fake Victory. Medium close-up, 50mm. The cone lands in the waiting hand and the face bursts into victory, then the vendor peels the stretchy scoop away in one smooth move, leaving the cone bare for a beat. SFX: victory chime cut short, peel wobble, laughter pop, offended inhale.
0:09-0:11: Insert cut into The Public Humiliation. Insert shot of a ceramic cat staring from a shelf. Smash cut to a medium shot, 35mm, as the figure sags into noodle posture, then puffs both cheeks and folds both arms while onlookers bounce with silent laughter. SFX: tiny huff, crowd laughter swell, cart bell tinkle.
0:11-0:15: Whip pan transition into The Real Win. Medium close-up, 50mm. The vendor kneels and places the cone gently into the waiting hand with no trick this time. One still beat. The figure looks down, eyes sparkle, then the camera pulls back to a wide shot, 35mm, as the figure leans in for the first taste and the courtyard breaks into applause. SFX: soft handoff, held-breath pause, bright chime bloom, applause burst, warm music lift.
```

#### 분석: 시간이 어떻게 비트로 쪼개졌는가

이 샘플의 핵심은 `FORMAT` 한 줄에 박힌 **6 BEATS**입니다. 15초를 6개 서사 비트로 나누고, 각 비트마다 시작·끝 초를 명시했습니다.

| 시간대 | 비트 명 | 행동 | 화각 | 에너지 |
| --- | --- | --- | --- | --- |
| 0:00-0:02 | The Scroll Stop | 시선 잡기 | ECU 50mm → wide 35mm | I≈0.3 |
| 0:02-0:04 | The First Miss | 빈손 | CU 50mm | I≈0.5 |
| 0:04-0:07 | The Side Switch | 좌우 농락 | MW 35mm | I≈0.7 |
| 0:07-0:09 | The Fake Victory | 가짜 승리 | MCU 50mm | **I≈1.0 (정점)** |
| 0:09-0:11 | The Public Humiliation | 공개 망신 | Insert + Smash cut | I≈0.8 |
| 0:11-0:15 | The Real Win | 진짜 승리 | MCU + wide pull-back | I≈0.5 |

**각 비트마다 한 줄 행동 동사**(snaps, lunges, pinwheels, sags, kneels)가 박혀 있고, 화각 변화가 에너지 곡선과 정확히 동기됩니다.

### 내 3막 시놉시스에 적용하기

여러분의 Phase 2-2 시놉시스를 펴고 다음을 점검하세요.

> 
> - [ ] 내 시놉시스의 15초가 **몇 개의 비트로 나뉘는가?** (4~6개가 적정)

>   - [ ] 각 비트의 시작·끝이 **초 단위로 명시**(예: 0:04-0:07)되어 있는가?

>   - [ ] **I=1.0 비트가 정확히 몇 초~몇 초인가** 좌표가 박혀 있는가?

>   - [ ] 비트마다 **한 줄 물리적 행동 동사**(휘청인다, 비산한다 등)가 있는가?
>     ❌가 하나라도 있으면, Phase 2-2로 돌아가 시놉시스에 비트 단위 좌표를 박은 뒤 다음 단계로 가세요.

### 4. Case 2 분석 — 일관성과 밀도

[embed](https://x.com/i/status/2042840039378542846)

```markdown
FORMAT: 15s / 145 BPM / 15 SHOTS / beat-synced routine

SUBJECT: @[image1] < ATTACH YOUR IMAGE.

WARDROBE: Sleep tee and lounge shorts at home. Tailored jacket, fitted top, trousers, and lace-up shoes outside.

ENVIRONMENT: Tiny apartment, bright fridge glow, rain-dusted hallway, chrome metro, clean office, then a bedroom in cool window light. Everything feels glossy and lived-in.

MOOD: Late-for-work panic, clipped momentum, breathless urgency, then an exhausted exhale.

MUSIC: Fast percussive electro-pop

COLOR LOGIC: Hyperreal Pop Look

STYLE: Ultra-Realistic.

LOGIC RULE: Keep logical consistency in wardrobe, props, locations, and action continuity across all shots.

SHOT 1: ECU, 85mm push-in / 06:50 on the phone screen as it shakes on rumpled sheets. / SFX: alarm, sheet rustle.

SHOT 2: WS, 35mm handheld jolt / Rhythmic cut into her jolting upright through side light, throwing the blanket aside, and planting her feet on the floor in one rushed motion, still in a soft sleep tee and lounge shorts. / SFX: mattress bounce, blanket whip, sharp breath.

SHOT 3: MCU, 50mm slide / Cut on action into face wash at the sink, droplets catching the top light. / SFX: faucet rush, water slap.

SHOT 4: Insert shot, 85mm rack focus / Match cut into the toothbrush held at a natural forward brushing angle against the front teeth, hand relaxed and upright, mint foam and mirror eye. / SFX: bristle scrape, sink drip.

SHOT 5: Interior fridge view, 24mm wide / Object pass into the camera inside the fridge looking out as the door snaps open and her hand darts in, blue fridge light framing a hurried grab for breakfast ingredients. / SFX: fridge hum, bottle clink, shelf rattle.

SHOT 6: Insert shot, 50mm handheld / Rhythmic cut into eggs and toast hitting the pan under warm practical light. / SFX: butter sizzle, chop tap.

SHOT 7: MCU, centered 50mm push-in / Match cut into one rushed bite, a quick clock glance, and an immediate rise from the chair. / SFX: crunch, ceramic clink, chair scrape.

SHOT 8: Bird's-eye insert, 35mm overhead / Cut on action into striped socks snapping on. / SFX: fabric stretch, heel tap.

SHOT 9: MS, 35mm pivot / Camera wipe into a rushed outfit change as the sleep tee disappears under a fitted top and tailored jacket, then her tote, keys, and transit card get scooped up in one messy grab. / SFX: fabric whip, key jingle, zipper pull, bag rustle.

SHOT 10: Insert shot, 50mm overhead / Match cut into lace-up shoes slamming on as the laces yank tight in one impatient pull. / SFX: sole thump, lace tug, short breath.

SHOT 11: WS, 24mm parallax / Whip pan transition into her, now in the tailored outside outfit, rushing through the apartment door into corridor light without breaking stride. / SFX: latch click, rapid footsteps, hallway air.

SHOT 12: MS to CU, 35mm glide into 85mm push-in / Sound bridge into the metro car interior only as she grips the pole, shifts with the carriage sway, checks the passing station lights, and snaps a tense glance toward the closing doors, reflected chrome streaking around her and the city smearing outside the window. / SFX: rail clatter, carriage screech, door warning chime, tight breath.

SHOT 13: Insert to MCU, 50mm snap zoom / Smash cut to the office entrance as her access card hits the reader, the glass door unlocks, and she slips through fast before the chair roll and laptop open. / SFX: badge beep, door click, laptop chime.

SHOT 14: OTS, 35mm handheld / Rhythmic cut into fingers racing across keys, chat windows blinking, coffee by the trackpad, and notifications stacking faster than she clears them. / SFX: keyboard burst, notification ticks, mouse click.

SHOT 15: WS, 50mm pull-out / L-cut with a match from laptop close to apartment re-entry as the jacket drops, work clothes peel away, and she changes back into sleepwear before collapsing into bed in the opening frame shape. / SFX: door shut, bag drop, fabric rustle, blanket rustle, room tone.
```

### 분석: 흔들림 없이 유지하는 4가지 장치

이 샘플은 Case 1보다 더 많은 컷(15개)을 1초당 1개꼴로 박아 넣습니다. 그럼에도 무너지지 않는 이유는 4가지 장치가 명시적으로 박혀 있기 때문입니다.

1. **LOGIC RULE 명문화**

`LOGIC RULE: Keep logical consistency in wardrobe, props, locations, and action continuity across all shots.` — 의상·소품·장소·행동 연속성을 AI에게 미리 강제합니다. 데이터 상수 선언입니다.

1. **145 BPM 비트 동기**

`FORMAT: 15s / 145 BPM / 15 SHOTS / beat-synced routine` — 음악의 다운비트와 컷 포인트가 정확히 일치하도록 BPM을 사양 단계에서 선언합니다. Mood가 추상이 아닌 수치로 박힙니다.

1. **SFX의 시각화**

샷마다 `SFX: alarm, sheet rustle` / `mattress bounce, blanket whip, sharp breath` 식으로 소리가 명시됩니다. 청각이 시각적 강도와 동기됩니다.

1. **순환 구조 (The Loop)**

Shot 1: 침대 위 폰 알람 → Shot 15: 침대에 다시 쓰러짐. 시작과 끝이 같은 프레임 모양으로 맞물려 시간 곡선이 닫힙니다.

### 내 3막 시놉시스에 적용하기

> 
> - [ ] **LOGIC RULE처럼 절대 변하면 안 되는 데이터 상수**(의상·소품·공간)가 명시되어 있는가?

>   - [ ] **음악 BPM**이 정해지고, 컷 빈도가 그 비트와 동기될 수 있는가?

>   - [ ] 각 비트의 **SFX**가 물리적 강도(I)와 동기되어 명시되어 있는가?

>   - [ ] 시놉시스의 **시작과 끝이 같은 프레임 모양**으로 맞물리는가? (순환 구조)

> ❌가 하나라도 있으면, Phase 2-2 시놉시스의 1막 도입과 3막 결말부에 LOGIC RULE·BPM·순환 구조를 보강하세요.

### 5. 7요소 변형의 필연성 (Genealogy Reveal)

Phase 1-1에서 우리는 전통 시네마토그래피의 5요소를 7요소로 변환했습니다. 그 변환의 근거를 Phase 3-1에서 검증한다고 약속했죠. 두 케이스를 5요소·7요소로 동시에 분해해 변환의 필연성을 확인합니다.

### 두 케이스를 7요소로 분해

| 7요소 | Case 1 (터키 아이스크림) | Case 2 (직장인의 아침) | 5요소→7요소 변환 |
| --- | --- | --- | --- |
| **Character** | 둥근 얼굴 캐릭터 + 아이스크림 행상 | 잠옷 → 정장으로 환복하는 인물 | Mise-en-scène 분해 |
| **Environment** | 황혼의 돌마을, 모자이크 분수, 놋쇠 카트 | 아파트 → 지하철 → 사무실 | Mise-en-scène 분해 |
| **Camera** | 50mm ECU, 35mm wide, whip pan | 85mm push-in, 24mm wide, handheld | Composition + Camera Movement 통합 |
| **Lighting** | Late afternoon light | Side light, blue fridge light | 불변 |
| **Color** | Hyperreal Pop Look | Hyperreal Pop Look, glossy lived-in | 불변 |
| **Mood** | Fast slapstick mischief | 145 BPM, Late-for-work panic | 5요소에 없던 차원 |
| **Time** | 0:00–0:15, 6 beats | 15s / 15 shots / beat-synced | 5요소에 없던 차원 |

### 변환의 필연성 — 왜 5요소로는 부족한가

**분해의 증거: Mise-en-scène → Character + Environment**

두 케이스 모두 인물(SUBJECTS / WARDROBE)과 환경(ENVIRONMENT)이 프롬프트에서 **분리 선언**됩니다. Case 1의 squash-and-stretch 비례와 돌마을 건축 양식, Case 2의 의상과 공간 동선은 AI 모델에서 완전히 다른 파라미터로 작동합니다. Mise-en-scène을 한 덩어리로 두면 AI는 인물과 공간의 경계를 구분할 수 없습니다. 분해는 매체적 필연입니다.

**통합의 증거: Composition + Camera Movement → Camera**

두 케이스 어디에도 "Composition" 섹션이 없습니다. "Camera Movement"도 별도 항목이 아닙니다. 대신 `50mm ECU`, `24mm wide`, `whip pan` 같은 **렌즈+앵글+움직임 표기**가 한 라인에 통합되어 있습니다. 50mm ECU 자체가 "타이트한 클로즈업 구도"를 함의하고, AI 영상 모델에서 카메라는 단일 사양 인터페이스로 작동하기 때문에 구도·움직임·렌즈가 한 객체로 묶이는 것이 매체 합리적입니다.

**➕ 추가의 증거 1: Mood**

Case 2의 `145 BPM / Late-for-work panic`은 5요소 어디에도 속하지 않습니다. 음악·정서의 수치화 — 전통 영화에서는 후반 작업에서 음악으로 결정되던 영역이 AI 영상에서는 **사양 단계에서 미리 선언**되어야 합니다. 컷의 빈도와 모션 강도를 결정하는 수치이기 때문입니다.

**➕ 추가의 증거 2: Time**

Case 1의 `0:00-0:02 / 0:02-0:04 ...` 비트 분할과 Case 2의 `15s / 15 shots / beat-synced`는 5요소가 다루지 않는 차원입니다. 전통 영화에서 시간은 편집 단계의 결과지만, AI 영상에서는 **시퀀스 좌표가 곧 프롬프트의 일부**입니다. Phase 3-3의 9프레임 그리드가 결국 Time의 좌표화입니다.

### 결론

> 전통 5요소는 100년 영화가 합의한 표준이지만, **카메라 = 단일 광학 장치**를 전제로 합니다. AI 영상 매체에서는 카메라가 **데이터 모델의 입력 인터페이스**로 변질됐고, 그 결과 인물·공간이 별도 입력이 되어 분해되고, 구도·움직임이 렌즈 사양에 종속되어 통합되며, 정서·시간이 사양 단계에서 미리 결정되어 추가됩니다. **5요소 → 7요소 변환은 임의 재구성이 아니라 매체 변환의 필연적 결과**입니다.

#### 6. 실전 적용 — 내 시놉시스를 시퀀싱 데이터로 보강하기

두 샘플에서 배운 4가지(비트 분할 / LOGIC RULE / BPM / 순환 구조)를 여러분의 Phase 2-2 시놉시스에 직접 박는 단계입니다. 이 작업의 산출물이 Phase 3-2로 넘어갑니다.

#### 적용 흐름

| # | 적용 항목 | 출처 | 작업 |
| --- | --- | --- | --- |
| 1 | 비트 분할 좌표 | Case 1 | 시놉시스를 4~6개 비트로 쪼개고 시간대·행동 동사·화각·Intensity 명시 |
| 2 | LOGIC RULE 데이터 상수 | Case 2 | 영상 전체에 변하면 안 되는 의상·소품·공간 한 줄 선언 |
| 3 | BPM 좌표 | Case 2 | 음악 BPM과 컷 빈도 동기화 기준 수치 명시 |
| 4 | 순환 구조 검증 | Case 2 | 시작과 끝이 같은 프레임 모양으로 맞물리는지 점검 |

#### 시퀀싱 보강 프롬프트

위 4가지 적용을 AI에게 맡기는 프롬프트입니다. Phase 2-2의 결과물을 그대로 입력으로 사용하세요.

테스트용 프롬프트입니다. 

```markdown
[Role & Philosophy]
당신은 Phase 2-2의 3막 시놉시스(강도 라벨링 + Anchor/Bridge + 재배치 가능성)를 받아, 두 실전 샘플(Case 1·2)의 편집 원칙과 현대 AI 영상 모델의 SFX 운용 노하우를 결합해, 시간 좌표가 박힌 완성형 시퀀싱 데이터로 보강하는 'Sequencing Director'입니다.
철학: "시놉시스가 강도의 라벨이라면, 시퀀싱은 그 강도가 시간·운동·소리로 동기되는 좌표계다. SFX는 청각 보조가 아니라 운동 강도의 프롬프트다."

[Mission]
입력된 [3막 시놉시스 + Anchor/Bridge + 재배치 가능성]을 받아, 6단계 결정 절차를 순서대로 수행해 시퀀싱 데이터 6종을 출력하시오.

본 단계의 본질은 두 갈래의 결합이다:
(1) **서사 자유도의 소비** — Phase 2-2가 남긴 Anchor/Bridge/재배치 가능성을 시간 좌표·비트·SFX 결정의 근거로 사용
(2) **편집 원칙의 적용** — Case 1(시간 분할의 리듬) + Case 2(일관성과 밀도) + 현대 AI 영상 SFX 운용을 결정 절차에 박는다

[설계 원칙]

1. **Anchor 우선의 원칙**
Phase 2-2가 표기한 Anchor Beat는 절대 압축·생략 불가. 독립 비트로 보존. Bridge Beat는 묶거나 잘라낼 수 있음. 비트 분할 자유도는 Bridge에만 존재한다.

2. **강도 곡선과 비트 밀도 동기의 원칙**
Intensity가 높을수록 비트가 짧고 빠르게, 낮을수록 길고 느리게 분할. 즉 비트 길이는 강도의 역함수. I=1.0 막은 0.5–1초/비트, I≈0.2 막은 2–3초/비트, I≈0.5 막은 1.5–2초/비트 권장. (Case 1의 가르침)

3. **Dynamic SFX = 운동 강도 프롬프트의 원칙**
현대 AI 영상 모델은 운동성 SFX 토큰을 동작의 속도·재질·강도를 코딩하는 메타-사양으로 해석한다. SFX는 청각 보조가 아니라 모션 프롬프트의 일부. 따라서 비트별 행동 동사와 Dynamic SFX는 페어링되어야 한다.

4. **SFX 밀도와 강도 곡선 동기의 원칙**
Dynamic SFX 개수도 강도 곡선과 동기된다. I≈0.2 비트는 Dynamic SFX 0–1개 + Ambient 위주, I=1.0 비트는 Dynamic SFX 3–4개 집중, I≈0.5 비트는 Dynamic SFX 1–2개 + 잔향. (Case 2의 가르침을 현대 AI 영상 노하우로 확장)

5. **두 층위 SFX 분리의 원칙**
- **Ambient SFX (공간 질감):** 막 단위로 박힘. 배경음·환경음·지속음
- **Dynamic SFX (운동·속도 토큰):** 비트 단위로 박힘. 동사를 증폭하는 운동성 토큰
두 층위가 한 비트 안에서 동시에 작동하지만, 결정 단위는 다르다.

6. **LOGIC RULE의 데이터 상수 선언 원칙**
9패널/9컷 전체에 걸쳐 변하면 안 되는 의상·소품·공간을 명문화. Phase 2-1 Identity의 시각 자산 + Phase 2-2 Optical/Spatial Logic의 불변 요소가 출처. (Case 2의 가르침)

7. **순환 구조의 시각적 맞물림 원칙**
시작 비트와 끝 비트의 시각적 모양이 맞물려 시간 곡선이 닫히도록 설계. Phase 2-2의 재배치 가능성 항목(wraparound 가능 여부)을 참조. (Case 2의 가르침)

8. **시놉시스 사양 우선의 원칙 (어휘 도출의 출처)**
모든 동사·SFX 토큰은 입력 시놉시스의 Visual Obstacle 물리 사양·Mood·Data Scaling에서 도출할 것. 본 프롬프트에 등장하는 카테고리 명은 길잡이일 뿐, 결과물의 어휘가 아니다. 시놉시스 성격과 무관한 어휘를 끼워 넣지 말 것.

[어휘 도출 가이드 — 카테고리 분류로만 제시]

**행동 동사 카테고리** (시놉시스 Visual Obstacle 물리 사양에 정합하는 카테고리를 선택하고, 구체 동사는 사양에서 직접 도출)
- 균형 상실형: 출렁이는 바닥·기울어지는 공간·중력 왜곡 사양에 정합
- 분산·파열형: 충격·폭발·파편화·고속 운동 사양에 정합
- 응축·정지형: 응고·동결·정적·점성 증가 사양에 정합
- 마찰·변성형: 재질 변화·표면 왜곡·서서히 변형되는 사양에 정합

**Dynamic SFX 카테고리** (시놉시스 Mood + 비트 행동 동사에 정합하는 카테고리에서 토큰을 새로 도출)
- 충격·파열 카테고리: 액션·호러·즉발성 사양에 정합
- 마찰·유동 카테고리: 변성·왜곡·점도 변화 사양에 정합
- 정지·응축 카테고리: 서스펜스·멜랑콜리·고요 사양에 정합
- 잔향·여운 카테고리: 3막 잔상·박제·해소 단계에 정합

**Ambient SFX 카테고리** (시놉시스 Environment + Mood에 정합하는 공간 질감)
- 일상·생활 카테고리
- 자연·기상 카테고리
- 기계·전자 카테고리
- 추상·비현실 카테고리

[제약 조건]
- 행동 동사는 측정 가능한 물리적 동사. 형용사 묘사 금지
- 행동 동사·SFX 토큰의 구체 어휘는 위 카테고리 가이드를 참조하되, 시놉시스 사양에서 직접 도출. 가이드의 카테고리 명을 그대로 출력하지 말 것
- 비트는 4–6개로 분할. Anchor는 독립 비트로 보존
- 비트 길이는 강도와 역함수
- I=1.0 비트가 영상 어디에 위치할지(황금비 또는 in medias res)는 Phase 2-2의 재배치 가능성과 정합되어야 함
- LOGIC RULE은 영상 전체에 걸쳐 변하면 안 되는 데이터 상수만 명시
- BPM은 단일 수치로 선언
- 시작 비트와 끝 비트의 시각적 연결점 명시

[작업 절차 — 다음 6단계를 순서대로 수행할 것]

**Step 1. 시간 길이 분배**
- 입력: 영상 총 길이(15초 또는 30초) + Phase 2-2의 3막 강도 라벨 + 막별 Anchor 개수
- 작업: 각 막의 시간 비중을 % → 초로 환산
- 결정 근거: I=1.0 막이 가장 긴 시간을 차지하는 게 일반적. 단, Anchor가 많은 막은 더 길게. Phase 2-2의 재배치 가능성이 "in medias res"로 표시된 경우 1막을 짧게 압축 가능

**Step 2. 비트 분할 + 행동 동사 박기**
- 입력: 각 막의 Narrative Flow + Anchor/Bridge + 강도 라벨
- 작업: 영상 전체를 4–6개 비트로 분할. Anchor는 반드시 독립 비트로, Bridge는 묶거나 잘라낼 수 있음. 비트 길이는 강도와 역함수 (I=1.0 비트 0.5–1초, I≈0.2 비트 2–3초)
- 각 비트마다 한 줄 물리적 행동 동사 박기. 동사는 시놉시스 Visual Obstacle 물리 사양에서 직접 도출 (위 어휘 도출 가이드 참조)

**Step 3. I=1.0 좌표 확정**
- 입력: Phase 2-2 Act 2의 Anchor Beat + Phase 2-2 재배치 가능성
- 작업: I=1.0 비트의 시작·끝 초 단위 좌표 확정
- 결정 근거: 영상 60% 황금비 지점 부근이 기본값. 단, Phase 2-2가 "절정의 in medias res 배치 가능"으로 표시했다면 절정을 영상 도입부 5–15% 지점으로 이동시키는 대안 가능 (이 경우 1막은 절정 후 회상 구조가 됨)

**Step 4. LOGIC RULE 데이터 상수**
- 입력: Phase 2-1의 Identity 시각 자산 + Phase 2-2의 Optical/Spatial Logic의 불변 요소
- 작업: 영상 전체에 변하면 안 되는 의상·소품·공간을 한 줄씩 명문화

**Step 5. Dynamic SFX 페어링 (비트별)**
- 입력: Step 2의 비트별 행동 동사 + 각 비트의 Intensity 라벨 + 시놉시스 Mood
- 작업: 각 비트의 행동 동사에 운동 강도·속도·재질을 코딩하는 Dynamic SFX 토큰 페어링. 토큰은 시놉시스 Mood와 비트 동사에서 직접 도출
- 개수는 강도와 동기 (I≈0.2: 0–1개, I=1.0: 3–4개, I≈0.5: 1–2개)

**Step 6. Ambient SFX + BPM + 순환 구조**
- 입력: Phase 2-2 Temporal Logic + Phase 2-2 Mood + Phase 2-2 Environment + Phase 2-2 재배치 가능성(wraparound)
- 작업:
  - 막별 Ambient SFX 1–2개 (시놉시스 Environment + Mood에서 도출)
  - 음악 BPM 단일 수치 선언 + 컷 빈도 동기 가능 여부
  - 시작 비트와 끝 비트의 시각적 연결점 한 줄

[자기 검증 — 출력 전 8단계 점검]
다음을 모두 통과한 결과만 제출:

1. **Anchor 보존:** Phase 2-2의 모든 Anchor Beat가 독립 비트로 분할표에 살아 있는가?

2. **강도-길이 역함수:** I=1.0 비트가 가장 짧고 I≈0.2 비트가 가장 긴가? 역전되어 있으면 재분할.

3. **재배치 가능성 소비:** Phase 2-2의 재배치 가능성 표기가 Step 3(I=1.0 배치)·Step 6(순환 구조) 결정에 반영되었는가?

4. **Dynamic SFX 페어링:** 모든 비트에 행동 동사와 Dynamic SFX가 페어링되어 있는가?

5. **SFX 밀도-강도 동기:** Dynamic SFX 개수가 비트 Intensity와 동기되어 있는가? I=1.0 비트의 SFX 개수가 I≈0.2 비트보다 많은가?

6. **두 층위 분리:** Ambient SFX(막 단위)와 Dynamic SFX(비트 단위)가 출력에서 분리되어 있는가?

7. **순환 구조:** 시작 비트와 끝 비트의 시각적 연결점이 한 줄로 명시되었는가?

8. **사양 도출 검증:** 출력된 행동 동사와 SFX 토큰이 입력 시놉시스의 Visual Obstacle 물리 사양·Mood와 정합하는가? 시놉시스 성격과 무관한 어휘가 끼어 있으면 시놉시스 사양에서 다시 도출. 어휘 도출 가이드의 카테고리 명(균형 상실형·충격 파열 카테고리 등)이 결과물에 그대로 들어 있다면 모두 삭제. 카테고리는 길잡이일 뿐 출력 어휘가 아니다.

---
### [INPUT DATA]
1. **3막 시놉시스(Phase 2-2 전체):** 강도 라벨 + 막별 Narrative Flow + Data Scaling(3그룹) + Anchor Beat + Bridge Beat(s) + 재배치 가능성
2. **영상 총 길이:** 15초 또는 30초
3. **(선택) 음악 BPM 의도:** 학생이 원하는 BPM이 있으면 명시. 없으면 시놉시스 분위기에서 추정
---

### [OUTPUT FORMAT]

## 1. 시간 길이 분배 (Step 1)
- **Act 1 (Activation):** X초 (X%)
- **Act 2 (Collision):** Y초 (Y%)
- **Act 3 (Imprint):** Z초 (Z%)
- **분배 근거:** (한 줄)

## 2. 비트 분할 + 행동 + Dynamic SFX (Step 2 + Step 5)

| 시간대 | 비트 명 | 행동 동사 | Dynamic SFX | 화각 | Intensity |
|-------|---------|----------|-------------|------|-----------|
| 0:00-0:0X | (비트 1) | (시놉시스 사양에서 도출한 물리 동사) | (시놉시스 Mood·동사에서 도출한 토큰 0–1개) | (mm + 샷 타입) | I≈0.2 |
| ... | | | | | |
| (I=1.0 비트) | (절정 비트) | (가장 강한 동사) | (토큰 3–4개) | (Close-up) | **I=1.0** |
| ... | | | | | |

## 3. I=1.0 좌표 확정 (Step 3)
- **I=1.0 비트 좌표:** (예: 9–11초)
- **배치 선택:** 황금비(영상 55–65%) / in medias res(영상 5–15%) 중 선택
- **선택 근거:** (한 줄 — Phase 2-2의 재배치 가능성과 정합 여부 명시)

## 4. LOGIC RULE 데이터 상수 (Step 4)
- **의상:** (한 줄)
- **소품:** (한 줄)
- **공간:** (한 줄)

## 5. Ambient SFX 막별 (Step 6-a)

| 막 | Ambient SFX | Intensity 동기 |
|----|-------------|-----------------|
| Act 1 | (시놉시스 Environment에서 도출한 지속음 1–2개) | I≈0.2 |
| Act 2 | (긴장음·압박음 1개) | I=1.0 — Dynamic 폭증과 결합 |
| Act 3 | (잔향·여운 1–2개) | I≈0.5 — 사라짐 |

## 6. BPM 좌표 (Step 6-b)
- **음악 BPM:** XXX BPM
- **컷 빈도 동기:** (예: 1막 2–3초/컷, 2막 0.5–1초/컷, 3막 1.5–2초/컷)

## 7. 순환 구조 (Step 6-c)
- **시작 비트:** (시각적 모양 한 줄)
- **끝 비트:** (시작과 어떻게 맞물리는지 한 줄)

## 8. 보강된 3막 시놉시스
위 1–7번 데이터가 모두 박힌 최종 시놉시스를 Act 1·2·3 형식으로 재서술. 각 막마다 비트 분할·행동·SFX·LOGIC RULE이 살아 있는 형태로.
```

위 프롬프트의 출력(시퀀싱 데이터 5종)이 Phase 3-2(Data Refining)에서 **4대 데이터 레이어**(Lens / Time / SFX / Intensity)로 정밀하게 사양화되고, Phase 3-3(3×3 Grid)에서 9프레임 그리드의 GLOBAL 섹션으로 박제됩니다.

#### 최종 마스터 통합본(Master Prompt)

로그라인 > 시퀀싱까지 통합된 프롬프트

> 위 Phase 2-1·2-2·3-1을 분리해 학습한 이유는 각 단계의 인과 사슬을 이해하기 위함입니다. 실전에서는 후크라인과 Conflict Trigger가 정해진 시점부터 시퀀싱까지 한 번에 처리하는 게 효율적입니다. 다음은 세 단계를 한 흐름으로 합친 집약 프롬프트입니다. 첫 학습 후 또는 다른 후크라인으로 영상을 만들 때 사용하세요.

```markdown
[Role & Philosophy]
당신은 한 줄 후크라인과 선택된 Visual Preset(7요소 + Conflict Trigger)을 받아, 통합 로그라인 → 3막 강도 라벨링 시놉시스 → 시퀀싱 데이터를 단일 흐름으로 설계하는 'Cinematic Pipeline Director'입니다.
철학: "후크라인은 한 문장의 씨앗, 로그라인은 응축된 시간, 시놉시스는 강도의 라벨, 시퀀싱은 좌표계다. 네 단계는 분리된 작업이 아니라 한 흐름의 네 호흡이다."

[Mission]
입력 데이터를 받아 3개 Stage를 순서대로 수행하시오. 각 Stage는 이전 Stage의 산출물을 입력으로 받으며, 단계 건너뛰기·순서 섞기·산출물 누락은 금지된다.

- Stage 1. 통합 로그라인 설계 (한 문장 응축 + 4대 변수 분해 + Data Logic Sync)
- Stage 2. 3막 강도 라벨링 시놉시스 (펼침 + Anchor/Bridge + 재배치 가능성)
- Stage 3. 시퀀싱 데이터 (시간 좌표·비트 분할·SFX·LOGIC RULE·BPM·순환 구조)

세 Stage의 산출물 모두 최종 출력에 포함되어야 한다. 압축·생략 금지.

[공통 설계 원칙 — 모든 Stage에 적용]

1. **사양 우선의 원칙**
모든 동사·SFX 토큰·시각 어휘는 입력 후크라인과 선택 Preset의 물리 사양에서 직접 도출. 본 프롬프트의 카테고리 가이드 용어는 길잡이일 뿐 출력 어휘가 아니다.

2. **본문 예제 어휘 차단의 원칙**
강의 본문 예제 어휘(저승·검은 액체·잠든 아기·50mm push-in·70 BPM·15초 3막·점성 4500cP 등)가 입력과 무관하게 침투하면, 입력 어휘로 치환할 것.

3. **물리적 동사의 원칙**
형용사 묘사("슬프다·무섭다") 금지. 측정 가능한 물리적 동사로 작성. 구체 동사는 선택 Preset의 Visual Obstacle 물리 사양에서 도출.

4. **단계 경계의 원칙**
Stage 1은 시간 좌표를 결정하지 않는다 (변주 잠재력까지). Stage 2는 강도 라벨까지만 (초·% 단위 시간 비결정). Stage 3에서 시간 좌표·비트 분할·SFX 결정이 모두 일어난다.

---

### Stage 1. 통합 로그라인 설계

[작업]
입력 후크라인 + Visual Spec 7요소 + Conflict Trigger를 Hollywood 표준 4요소에 정합되는 4대 변수(Identity / Goal / Visual Obstacle / Stakes)로 분해하고, 한 문장 통합 로그라인으로 응축한다. 동시에 4대 변수 각각이 시간 축에서 어떻게 변주될지의 잠재력을 표에 박는다.

[Stage 1 설계 원칙]
- 로그라인은 그 자체로 완결된 서사 청사진 (한 문장만으로 "누가 / 무엇을 하려고 / 무엇 때문에 / 무엇을 잃는 중인지" 시각화 가능)
- 동시에 시간 축에 펼쳐질 잠재 에너지를 내장 (4대 변수가 막을 거치며 어떻게 변주될지가 문장에 코딩되어 있을 것)
- A↔C 아이러니 강제: Identity 속성과 Visual Obstacle 물리 법칙이 서로를 방해하는 관계여야 함
- Visual Obstacle은 입력 Conflict Trigger의 물리 사양(수치·재질·운동성)을 그대로 계승
- Stakes는 시간 조건절("X가 ~하기 전에") 또는 결과 조건절("~하지 못하면 Y") 형태로 로그라인 본문에 명시
- 한 문장. 마침표 하나. 4대 변수가 문장 안에서 모두 식별 가능

[Stage 1 출력]

#### 1-A. 4대 변수 분해
| 변수 | Hollywood 표준 | 사양 | 시간 축 잠재 변주 |
|------|---------------|------|------------------|
| Identity | Protagonist | (시각적 정체성 명사구 — REF_ID) | (막을 거치며 유지·변화될 시각 자산) |
| Goal | Goal | (15초 내 판정 가능한 물리적 목적) | (출발 → 충돌 → 도달/좌절 벡터) |
| Visual Obstacle | Antagonistic Force | (Conflict Trigger의 물리 사양 번역) | (잠복 → 폭주 → 잔상 강도 곡선) |
| Stakes | Stakes | (잃을 것의 구체 결과) | (함의 → 임박 → 시각적 박제) |

#### 1-B. Integrated Logline
"(4대 변수가 시간 조건절 또는 결과 조건절로 응축된 한 문장)"

#### 1-C. Data Logic Sync
- **Optical Logic:** (Camera·Lighting·Color 사양이 인물 인지에 가하는 광학적 제약 한 줄)
- **Spatial Logic:** (Character·Environment 사양이 인물 이동에 가하는 공간적 제약 한 줄)
- **Temporal Logic:** (Mood·Time 사양이 인물 심리 템포에 가하는 시간적 압박 한 줄)

[Stage 1 자기 검증 — 통과 후 Stage 2로 진행]
- ✓ Visual Obstacle이 입력 Conflict Trigger의 물리 사양을 그대로 포함
- ✓ Identity 속성과 Visual Obstacle 물리가 서로를 방해 (A↔C 아이러니)
- ✓ 측정 가능한 물리적 동사 최소 1개 박혀 있음
- ✓ 4대 변수의 `시간 축 잠재 변주` 4개 항목 모두 채워져 있음 (Stage 2가 받을 재료)
- ✓ 자족성: 이 한 문장만으로 외부인이 "누가·무엇·왜·무엇을 잃는 중"을 시각화 가능

---

### Stage 2. 3막 강도 라벨링 시놉시스

[작업]
Stage 1의 통합 로그라인 + 4대 변수 시간 축 잠재 변주 + Data Logic Sync를 받아, Activation–Collision–Imprint 3막의 강도 곡선으로 펼친다. 시간 좌표(초·%·비트 개수)는 결정하지 않는다. Stage 3의 영역이다.

[Stage 2 설계 원칙]
- **변주 계승:** Stage 1의 `시간 축 잠재 변주` 4개 항목을 3막에 매핑. 새로 짜는 게 아니라 펼치는 작업
- **3그룹 Logic 소비:** Optical/Spatial/Temporal Logic 3그룹이 각 막의 Data Scaling에 반드시 등장
- **시간 좌표 비결정:** 초·퍼센트·비트 개수 출력 금지. 강도 라벨(I≈0.2 / 1.0 / 0.5)까지만
- **Anchor/Bridge 구분:** 각 막에 압축 불가능한 Anchor Beat와 압축·재배치 가능한 Bridge Beat 식별
- **재배치 가능성:** 각 막이 in medias res / wraparound / flash-forward 등 편집적 재배치가 가능한지 명시 (Stage 3가 결정)
- **펼침 vs 추가:** Stage 1 로그라인에 없는 새 갈등·새 인물·새 공간 추가 금지

[Stage 2 출력]

#### 2-A. 3막 강도 라벨링
| 막 | Intensity | 강도의 서사적 근거 |
|----|-----------|---------------------|
| Act 1 (Activation) | I≈0.2 | (Visual Obstacle 잠복과 Stakes 함의 상태 한 줄) |
| Act 2 (Collision)  | I=1.0 | (A↔C 충돌의 폭주 양상 한 줄) |
| Act 3 (Imprint)    | I≈0.5 | (잔상의 무게 한 줄) |

#### 2-B. Act 1: Activation (I≈0.2)
- **Narrative Flow:** Identity 일상 정체 + Goal 출발점 + Visual Obstacle 잠복 + Stakes 함의가 동시에 작동하는 도입
- **Data Scaling:**
  - Optical: (Camera·Lighting·Color의 1막 양상)
  - Spatial: (Character·Environment의 1막 양상)
  - Temporal: (Mood·Time의 1막 양상)
- **Anchor Beat:** (압축 불가능한 비트 1개 — 한 줄 물리 동사)
- **Bridge Beat(s):** (압축·재배치 가능한 연결 비트 — 0개 이상)
- **재배치 가능성:** (영상 후반부 또는 도입 wraparound로 이동 가능한가 / 가능/불가능 + 이유)

#### 2-C. Act 2: Collision (I=1.0)
- **Narrative Flow:** Visual Obstacle 폭주 ↔ Identity 유지 시도의 정면충돌, Goal 임박, Stakes 임박
- **Data Scaling:** Optical / Spatial / Temporal 각각 2막 양상
- **Anchor Beat:** (I=1.0 절정 비트 — 가장 강한 물리 동사)
- **Bridge Beat(s):**
- **재배치 가능성:** (절정 비트가 in medias res로 영상 도입 배치 가능한가 / 가능/불가능 + 이유)

#### 2-D. Act 3: Imprint (I≈0.5)
- **Narrative Flow:** Goal 도달 또는 좌절 + Stakes 시각적 박제 + Identity 변화된 잔상
- **Data Scaling:** Optical / Spatial / Temporal 각각 3막 양상
- **Anchor Beat:** (Stakes 박제 비트)
- **Bridge Beat(s):**
- **재배치 가능성:** (3막 비트가 도입 wraparound로 사용 가능한가 / 가능/불가능 + 이유)

[Stage 2 자기 검증 — 통과 후 Stage 3로 진행]
- ✓ Stage 1의 `시간 축 잠재 변주` 4개 항목이 모두 3막에 펼쳐져 있음
- ✓ Optical/Spatial/Temporal Logic이 각 막의 Data Scaling에 모두 등장
- ✓ 2막의 폭주가 Identity ↔ Visual Obstacle의 직접 충돌로 구성
- ✓ 출력에 초 단위 좌표·시간 비중(%)·비트 개수 없음 (있으면 모두 삭제)
- ✓ 각 막에 Anchor Beat 최소 1개 식별
- ✓ Stage 1 로그라인에 없는 새 요소가 추가되지 않음

---

### Stage 3. 시퀀싱 데이터

[작업]
Stage 2의 3막 시놉시스를 받아, 두 실전 샘플(Case 1·2)의 편집 원칙과 현대 AI 영상 모델의 SFX 운용 노하우를 결합해 시간 좌표가 박힌 완성형 시퀀싱 데이터로 보강한다.

[Stage 3 설계 원칙]
- **Anchor 우선:** Stage 2의 Anchor Beat는 절대 압축·생략 불가. 독립 비트로 보존. Bridge만 묶거나 잘라낼 수 있음
- **강도-길이 역함수:** 비트 길이는 강도의 역함수. I=1.0 비트 0.5–1초, I≈0.2 비트 2–3초, I≈0.5 비트 1.5–2초 권장
- **Dynamic SFX = 운동 강도 프롬프트:** 현대 AI 영상 모델은 운동성 SFX 토큰을 동작 속도·재질·강도의 메타-사양으로 해석. 청각 보조가 아니라 모션 프롬프트
- **SFX 밀도-강도 동기:** I≈0.2 비트 Dynamic SFX 0–1개, I=1.0 비트 3–4개, I≈0.5 비트 1–2개
- **두 층위 SFX 분리:** Ambient SFX(막 단위, 공간 질감) / Dynamic SFX(비트 단위, 운동 토큰) 분리
- **LOGIC RULE 데이터 상수:** 영상 전체에 변하면 안 되는 의상·소품·공간 명문화. Stage 1 Identity + Stage 2 Optical/Spatial Logic의 불변 요소가 출처
- **순환 구조:** 시작 비트와 끝 비트의 시각적 모양이 맞물려 시간 곡선이 닫힘. Stage 2의 재배치 가능성(wraparound) 참조

[어휘 도출 가이드 — 카테고리 분류로만 제시. 결과물에 가이드 용어 자체를 출력 금지]

**행동 동사 카테고리** (Visual Obstacle 물리 사양에 정합하는 카테고리 선택, 구체 동사는 사양에서 도출)
- 균형 상실형 / 분산·파열형 / 응축·정지형 / 마찰·변성형

**Dynamic SFX 카테고리** (Mood + 비트 동사에 정합하는 카테고리에서 토큰 도출)
- 충격·파열 / 마찰·유동 / 정지·응축 / 잔향·여운

**Ambient SFX 카테고리** (Environment + Mood에 정합하는 공간 질감)
- 일상·생활 / 자연·기상 / 기계·전자 / 추상·비현실

[Stage 3 작업 절차 — 6단계 순서 수행]

- **Step 3-1. 시간 길이 분배:** 영상 총 길이 × 3막 강도 라벨 + 막별 Anchor 개수 → 각 막의 시간 비중 결정
- **Step 3-2. 비트 분할:** N개 비트로 분할 — N은 시놉시스의 강도 곡선 변곡점·Anchor 개수·BPM 의도가 자연스럽게 결정한다 (인위적 개수 강제 없음, 비트 개수는 시나리오의 결과물). Anchor는 독립 비트로 보존, Bridge는 묶거나 잘라낼 수 있음. 비트 길이는 강도와 역함수
- **Step 3-3. I=1.0 좌표 확정:** 영상 60% 황금비 기본값. Stage 2의 in medias res 가능성 표기 시 영상 5–15% 지점 이동 옵션
- **Step 3-4. LOGIC RULE:** 의상·소품·공간 데이터 상수
- **Step 3-5. Dynamic SFX 페어링:** 비트별 행동 동사에 운동 토큰 페어링. 개수는 강도와 동기
- **Step 3-6. Ambient SFX + BPM + 순환 구조**

[Stage 3 출력]

#### 3-A. 시간 길이 분배
- Act 1: X초 (X%) / Act 2: Y초 (Y%) / Act 3: Z초 (Z%)
- 분배 근거: (한 줄)

#### 3-B. 비트 분할 + 행동 + Dynamic SFX
| 시간대 | 비트 명 | 행동 동사 | Dynamic SFX | 화각 | Intensity |
|-------|---------|----------|-------------|------|-----------|
| 0:00-0:0X | (비트 1) | (사양에서 도출한 물리 동사) | (Mood·동사에서 도출한 토큰 0–1개) | (mm + 샷 타입) | I≈0.2 |
| ... | | | | | |
| (I=1.0 비트) | (절정) | (가장 강한 동사) | (토큰 3–4개) | (Close-up) | **I=1.0** |
| ... | | | | | |

#### 3-C. I=1.0 좌표 확정
- 좌표: (예: 9–11초)
- 배치 선택: 황금비(영상 55–65%) / in medias res(영상 5–15%) 중 선택
- 선택 근거: (한 줄 — Stage 2 재배치 가능성과 정합 여부)

#### 3-D. LOGIC RULE 데이터 상수
- 의상: (한 줄)
- 소품: (한 줄)
- 공간: (한 줄)

#### 3-E. Ambient SFX 막별
| 막 | Ambient SFX | Intensity 동기 |
|----|-------------|-----------------|
| Act 1 | (Environment에서 도출한 지속음 1–2개) | I≈0.2 |
| Act 2 | (긴장음·압박음 1개) | I=1.0 — Dynamic 폭증 결합 |
| Act 3 | (잔향·여운 1–2개) | I≈0.5 — 사라짐 |

#### 3-F. BPM 좌표
- 음악 BPM: XXX BPM
- 컷 빈도 동기: (예: 1막 2–3초/컷, 2막 0.5–1초/컷, 3막 1.5–2초/컷)

#### 3-G. 순환 구조
- 시작 비트: (시각적 모양 한 줄)
- 끝 비트: (시작과 어떻게 맞물리는지 한 줄)

#### 3-H. 보강된 3막 시놉시스
1–7번 데이터가 모두 박힌 최종 시놉시스를 Act 1·2·3 형식으로 재서술

[Stage 3 자기 검증 — 통과 후 최종 출력]
- ✓ Stage 2의 모든 Anchor Beat가 독립 비트로 분할표에 살아 있음
- ✓ I=1.0 비트가 가장 짧고 I≈0.2 비트가 가장 김 (강도-길이 역함수)
- ✓ Stage 2의 재배치 가능성 표기가 Step 3-3·3-6 결정에 반영됨
- ✓ 모든 비트에 행동 동사와 Dynamic SFX 페어링
- ✓ Dynamic SFX 개수가 비트 Intensity와 동기 (I=1.0 비트가 가장 많음)
- ✓ Ambient SFX(막 단위)와 Dynamic SFX(비트 단위) 분리됨
- ✓ 시작·끝 비트의 시각적 연결점 명시

---

### 최종 통합 자기 검증 (Stage 1·2·3 공통)

다음을 통과한 결과만 최종 출력:
- ✓ 출력 어휘가 입력 후크라인·Preset 사양에서 도출됨 (카테고리 가이드 용어 그대로 출력 금지)
- ✓ 본문 예제 어휘(저승·검은 액체·50mm push-in·70 BPM·점성 4500cP 등)가 입력과 무관하게 침투하지 않음
- ✓ 모든 동사가 측정 가능한 물리 동사 (형용사 묘사 없음)
- ✓ Stage 1 → Stage 2 → Stage 3 인과 사슬이 끊김 없이 이어짐 (Stage 2 출력이 Stage 1을 펼친 것, Stage 3 출력이 Stage 2를 좌표화한 것)

---

### [INPUT DATA]
1. **후크라인:** (Phase 1-2에 입력했거나 본인이 새로 만든 한 줄 아이디어)
2. **선택한 Visual Preset (Phase 1-2 출력 중 1개 선택):**
   - Character: 
   - Environment: 
   - Camera: 
   - Lighting: 
   - Color: 
   - Mood: 
   - Time: (영상 총 길이 15초 또는 30초)
3. **Conflict Trigger:** (선택한 Preset의 한 줄 물리 갈등)
4. **(선택) 음악 BPM 의도:** 원하는 BPM이 있으면 명시. 없으면 시놉시스 분위기에서 추정

---

### [OUTPUT FORMAT]

위 Stage 1 · Stage 2 · Stage 3의 모든 출력을 순서대로 제시. 각 Stage의 자기 검증을 통과한 결과만 출력에 포함.

## STAGE 1 OUTPUT — 통합 로그라인
(1-A · 1-B · 1-C 전부)

## STAGE 2 OUTPUT — 3막 강도 라벨링 시놉시스
(2-A · 2-B · 2-C · 2-D 전부)

## STAGE 3 OUTPUT — 시퀀싱 데이터
(3-A · 3-B · 3-C · 3-D · 3-E · 3-F · 3-G · 3-H 전부)
```

## Phase 3-2: Data Refining (Specification Layer 정리)

이 과정에서 각 시놉시스 항목은 다음과 같은 **4대 데이터 레이어**를 갖추게 됩니다.

#### 1. 광학적 데이터: Lens (mm)

- **목적:** 관찰자와 피사체 사이의 심리적/물리적 거리 확정.

- **적용:** 와이드 앵글(14mm–24mm)을 통한 압도적 환경 강조 vs 타이트 망원(85mm–200mm)을 통한 감정의 밀도 압축.

#### 2. 시간적 데이터: Timecode (s)

- **목적:** 생성형 AI 비디오 모델의 토큰 소모와 모션 강도를 제어하기 위한 타임라인 설계.

- **적용:** 각 씬의 지속 시간과 전환 시점을 초 단위로 명시하여, 3x3 그리드 구성 시 '리듬감'을 미리 계산.

#### 3. 청각적 데이터: SFX Layer

- **목적:** 시각적 정보가 가지지 못하는 '공간의 질감' 보강.

- **적용:** 앰비언스(배경음), 다이내믹 SFX(타격음, 기계음)를 텍스트 데이터로 치환하여 프롬프트의 밀도를 높임.

#### 4. 에너지 수치: Intensity (I)

- **목적:** 영상의 긴장감과 시각적 정보량을 수치화.

- **수식:** I≈0.2→1.0→0.5 (도입 → 절정 → 여운)

- **적용:** 수치가 높을수록 카메라 워킹의 복잡도와 피사체의 움직임, 편집 점의 간격이 비례하여 설계됨.

| **구분** | **1막: Hook (I≈0.2)** | **2막: Conflict (I≈1.0)** | **3막: Resolution (I≈0.5)** |
| --- | --- | --- | --- |
| **Narrative** | 황폐한 미래 도시의 전경 | 추격전 중 엔진 폭발 | 연기 속에서 걸어 나오는 인물 |
| **Lens** | **24mm Wide-angle** | **85mm Tight-shot** | **35mm Medium-shot** |
| **Time** | **0s ~ 4s (4초)** | **4s ~ 11s (7초)** | **11s ~ 15s (4초)** |
| **SFX** | **Deep Wind, Low Drone** | **Screeching, Explosion** | **Heavy Breathing, Echo** |
| **Physics** | Smoke drift, Dust particles | High velocity, Fire debris | Slow-motion embers |

> 위 예시를 참고해 아래 템플릿에 여러분의 프로젝트 데이터를 직접 채워보세요.

| 구분 | 1막: Hook (I≈0.2) | 2막: Conflict (I=1.0) | 3막: Resolution (I≈0.5) |
| --- | --- | --- | --- |
| Narrative | (직접 입력) | (직접 입력) | (직접 입력) |
| Lens |  |  |  |
| Time |  |  |  |
| SFX |  |  |  |
| Physics |  |  |  |

## Phase 3-3: 3×3 Grid Blueprint (9프레임 마스터 프롬프트 설계)

**목표:** Phase 3-2의 4대 데이터 레이어를 받아, 9개 패널을 한 번에 생성하는 마스터 프롬프트로 압축함.

### 데이터 흐름

| 흐름 | 데이터 | 설명 |
| --- | --- | --- |
| ⬇️ INPUT (from Phase 3-2) | 4대 데이터 레이어 | Lens / Time / SFX / Intensity 막별 표 |
|  | LOGIC RULE | Phase 3-1의 의상·소품·공간 데이터 상수 |
| ⬆️ OUTPUT (→ Phase 4) | 3×3 마스터 프롬프트 | GLOBAL 4섹션 + Frame 1~9 사양 + Negative Prompt |

### 1. 왜 9프레임 그리드인가

지금까지 두 케이스를 분해하고, 그 안에서 작동하던 4대 레이어를 Refining 단계에서 정리했습니다. 그런데 이 모든 과정에는 공통된 전제가 있습니다. 장면을 하나씩, 순서대로, 따로따로 생성한다는 것입니다. 이 방식은 샷이 늘어날수록 캐릭터 의상·공간 데이터가 샷 간에 어긋나는 **Data Drift**가 발생합니다.

이제 다른 질문을 해야 합니다. **9개의 장면을 하나의 이미지로 동시에 설계할 수 있다면?**

> 이것이 3×3 Cinematic Storyboard Grid입니다. 한 장의 프롬프트가 9개의 서로 다른 시각적 비트를 한 번에 생성합니다. 캐릭터의 의상, 공간의 조명, 분위기의 밀도가 9개 패널에 걸쳐 일관되게 유지됩니다. Phase 2-2에서 설계한 3막의 에너지 곡선(I≈0.2 → 1.0 → 0.5)이 그대로 9개 프레임에 매핑됩니다.

### 2. 9프레임 그리드의 3대 구성 요소

샘플 프롬프트를 분해하면 명확한 3개 컴포넌트 구조가 드러납니다.

| 구성 요소 | 역할 | Phase 1·2·3에서 받은 어떤 데이터가 박히는가 |
| --- | --- | --- |
| **GLOBAL 섹션** | 9개 패널 전체에 일관 적용되는 데이터 상수 | Phase 1-2의 Visual Spec + Phase 3-1의 LOGIC RULE |
| **Frame 1~9** | 각 프레임의 개별 사양 (비트·샷 타입·Intensity) | Phase 3-1의 비트 분할 + Phase 3-2의 Lens·Time·SFX·Intensity |
| **Negative Prompt** | 7요소 사양의 반대편을 정의하는 메타-사양 | "이 세계에 있어선 안 되는 것" 8~12개 키워드 |

이 3개 컴포넌트가 한 프롬프트에 함께 박힐 때만 9개 패널이 무너지지 않습니다.

### 3. 샘플 분석 — 역사 이벤트 그리드

아래 샘플은 역사적 사건을 9프레임으로 분해하는 3×3 그리드 프롬프트입니다. 읽으면서 각 프레임이 어느 막(Act)에 속하는지 직접 찾아보세요.

[embed](https://x.com/ai_gezgini/status/2047020250051346483)

```markdown
[HISTORICAL EVENT INPUT]: (write the historical event you want here)

MASTER PROMPT – 9-FRAME HISTORICAL STORYBOARD
HISTORICAL CINEMATIC STORYBOARD (3×3 GRID)
A 3×3 cinematic storyboard grid, captured with a professional cinema camera, using anamorphic lens optics, visually narrating [HISTORICAL EVENT INPUT] across nine sequential frames.
Each frame represents a distinct narrative beat of the historical event, progressing chronologically from cause to consequence.
The overall tone is serious, cinematic, grounded, and historically respectful.
No modern elements unless historically accurate.
CAMERA & LENS (GLOBAL – IMPORTANT)
Shot on professional cinema camera
Anamorphic lens optics (2.39:1 cinematic feel within each grid cell)
Subtle anamorphic traits:
Horizontal light streaks
Oval bokeh
Mild edge distortion
Camera always stable and deliberate
No handheld look
Composition inspired by high-end historical cinema
LIGHTING (GLOBAL)
Naturalistic, period-accurate lighting
Strong use of:
Directional sunlight
Firelight / torchlight / candlelight (if era-appropriate)
High contrast where drama demands
Shadows used narratively, not cosmetically
No modern beauty lighting
Color palette reflects the emotional weight of the event
ENVIRONMENT & SET
Architecturally and culturally accurate to the historical period
Materials must feel real:
Stone, wood, iron, cloth, leather, dust, smoke
Atmosphere:
Smoke, haze, mist, dust, weather elements if relevant
No futuristic or anachronistic details
CHARACTERS (GENERIC TEMPLATE)
Characters represent historical roles, not stylized heroes
Clothing, posture, age, and expressions match the era
Faces show:
Fear, resolve, doubt, ambition, exhaustion, triumph (as relevant)
No exaggerated acting, no modern expressions

3×3 GRID STRUCTURE – NARRATIVE FLOW
FRAME 1 – Historical Tension Before the Event (Wide / Establishing)
Wide anamorphic establishing shot
Shows the world before the turning point
Calm or tense atmosphere depending on context
Visual foreshadowing of conflict or change
FRAME 2 – Gathering Forces (Wide / Movement)
Wider scene with preparations, crowds, or mobilization
Subtle motion implied (marching, assembling, planning)
Rising tension
FRAME 3 – Key Figures Introduced (Medium / Authority)
Medium shot of important historical figures or symbolic leaders
Strong posture, controlled expressions
Camera slightly lower to imply significance
FRAME 4 – The Spark (Medium / Conflict Begins)
First visible action that triggers the event
Emotion breaks through restraint
Lighting becomes more contrast-heavy
FRAME 5 – The Turning Point (Close / Emotional Core)
Close-up or tight medium shot
The emotional heart of the historical moment
Fear, determination, realization, or sacrifice clearly visible
Shallow depth of field isolates the subject
FRAME 6 – Chaos or Struggle (Wide / Dynamic Composition)
Wider shot showing conflict, upheaval, or dramatic transformation
Diagonal compositions
Smoke, debris, motion frozen cinematically
FRAME 7 – Consequence Unfolding (Medium / Aftermath)
Immediate aftermath
Characters reacting to what just happened
Silence implied through visuals
FRAME 8 – Resolution (Wide / Symbolic)
Wide symbolic shot
Power shift, victory, loss, or irreversible change
Environment visually altered compared to Frame 1
FRAME 9 – Historical Echo (Wide / Final Statement)
Final, emotionally resonant frame
Feels like a history book cover
Calm after chaos or heavy stillness
Leaves the viewer reflecting on long-term impact
NEGATIVE PROMPT (GLOBAL)
anime, cartoon, illustration, fantasy, sci-fi, cyberpunk, neon colors, modern clothing, modern weapons, futuristic architecture, beauty lighting, glossy skin, exaggerated expressions, superhero poses, handheld camera, wide-angle distortion, modern cities, text overlays, subtitles, logos
```

### 3막 → 9프레임 매핑

| 막 | 프레임 | 제목 | Intensity | 샷 타입 |
| --- | --- | --- | --- | --- |
| Act 1 (기) | Frame 1 | Historical Tension | I≈0.2 | Wide / Establishing |
| Act 1 (기) | Frame 2 | Gathering Forces | I≈0.3 | Wide / Movement |
| Act 1 (기) | Frame 3 | Key Figures | I≈0.4 | Medium / Authority |
| Act 2 (승) | Frame 4 | The Spark | I≈0.6 | Medium / Conflict |
| Act 2 (승) | Frame 5 | The Turning Point | **I=1.0** | **Close / Emotional Core** |
| Act 2 (승) | Frame 6 | Chaos or Struggle | I≈0.9 | Wide / Dynamic |
| Act 3 (결) | Frame 7 | Consequence | I≈0.7 | Medium / Aftermath |
| Act 3 (결) | Frame 8 | Resolution | I≈0.5 | Wide / Symbolic |
| Act 3 (결) | Frame 9 | Historical Echo | I≈0.3 | Wide / Final |

Frame 5가 I=1.0의 클로즈업으로 설계된 것은 우연이 아닙니다. **Phase 2-2에서 정의한** 에너지 곡선이 그대로 실현된 것입니다.

### Case 1·2 (영상 프롬프트)와의 차이

| 구분 | Case 1·2 (영상 프롬프트) | 3×3 Grid 프롬프트 |
| --- | --- | --- |
| 생성 단위 | 샷 하나씩 순차 생성 | 9개 장면을 한 번에 생성 |
| 일관성 제어 | 샷마다 재입력 필요 | GLOBAL 섹션으로 전체 고정 |
| 에너지 곡선 | 타임코드로 설계 | 프레임 번호와 샷 타입으로 설계 |
| 수정 방식 | 개별 샷 재생성 | 그리드 전체 재생성 또는 패널 부분 수정 |

### 이 샘플에서 흡수해야 할 3가지 구조

- **GLOBAL 섹션의 역할:** CAMERA / LIGHTING / ENVIRONMENT / CHARACTERS를 전체 9개 패널에 걸쳐 고정하는 '데이터 상수' 선언입니다. Phase 1-2의 Visual Spec 7요소와 Phase 3-1의 LOGIC RULE이 여기서 물리적으로 박제됩니다.

- **FRAME 번호 = 서사의 좌표:** "Frame 5 — The Turning Point"는 순서 표시가 아니라 I=1.0이 터지는 좌표를 지정하는 명령어입니다. 시놉시스에서 절정이 몇 번 프레임이어야 하는지 먼저 결정하고 프롬프트를 쓰세요.

- **NEGATIVE PROMPT의 기능:** 샘플 마지막 줄의 `anime, cartoon, modern clothing...`은 7요소 사양의 반대편을 정의하는 메타-사양입니다. "이 세계에 있어서는 안 되는 물질"을 명시하면 Data Drift를 사전에 차단할 수 있습니다.

### 4. 실전 적용 — 내 9프레임 마스터 프롬프트 채우기

GLOBAL 4섹션은 직접 채우고, Frame 1~9는 표준 슬롯에 자기 비트만 끼워 넣습니다. 빈칸 약 8개 — Phase 3-1·3-2에서 만든 데이터를 옮기는 작업이지 새로 만드는 작업이 아닙니다.

### 4-1. GLOBAL vs FRAME 판단 기준

> **한 줄 룰:** 9패널 전부에서 변하지 않으면 **GLOBAL**, 패널마다 바뀌면 **FRAME**.

| 섹션 | 들어가는 데이터 | 출처 |
| --- | --- | --- |
| **CAMERA & LENS (GLOBAL)** | 영상 전체 카메라 미학 (anamorphic / handheld 등) — 패널마다 바뀌는 mm·움직임은 FRAME으로 | Phase 1-2 Camera (전체 톤만) |
| **LIGHTING (GLOBAL)** | 시간대·광원 종류·방향성 — 영상 내내 변하지 않는 광원 설정 | Phase 1-2 Lighting |
| **ENVIRONMENT & SET (GLOBAL)** | 공간의 재질·시대·물리 법칙 | Phase 1-2 Environment + Phase 3-1 LOGIC RULE 공간 |
| **CHARACTERS (GLOBAL)** | 인물의 정체성·의상·재질 (REF_ID) | Phase 1-2 Character + Phase 3-1 LOGIC RULE 의상·소품 |

### 4-2. Frame 1~9 표준 슬롯

Intensity 곡선과 샷 타입은 3막 분배의 표준입니다. 학생은 **비트 명·행동·디테일**만 자기 데이터로 채웁니다.

| Frame | 막 | Intensity | Lens (표준) | 샷 타입 | 학생이 채울 칸 |
| --- | --- | --- | --- | --- | --- |
| 1 | Act 1 (기) | I≈0.2 | 24mm | Wide / Establishing | 비트 명, 행동, 디테일 |
| 2 | Act 1 (기) | I≈0.3 | 35mm | Wide / Movement | 비트 명, 행동, 디테일 |
| 3 | Act 1 (기) | I≈0.4 | 50mm | Medium / Setup | 비트 명, 행동, 디테일 |
| 4 | Act 2 (승) | I≈0.6 | 50mm | Medium / Conflict Begins | 비트 명, 행동, 디테일 |
| **5** ⭐ | Act 2 (승) | **I=1.0** | **85mm** | **Close / Emotional Core** | **Phase 3-1의 I=1.0 비트** |
| 6 | Act 2 (승) | I≈0.9 | 24mm | Wide / Dynamic | 비트 명, 행동, 디테일 |
| 7 | Act 3 (결) | I≈0.7 | 50mm | Medium / Aftermath | 비트 명, 행동, 디테일 |
| 8 | Act 3 (결) | I≈0.5 | 35mm | Wide / Symbolic | 비트 명, 행동, 디테일 |
| 9 | Act 3 (결) | I≈0.3 | 35mm | Wide / Final | **Frame 1과 맞물리는 순환 구조 디테일** |

Phase 3-1의 비트가 4~6개라면, 비슷한 비트를 묶어 9칸에 분배하세요. 절정 비트는 무조건 Frame 5.

### 4-3. 그리드 프롬프트

최종 Grid Prompt

```markdown
[Role & Philosophy]
당신은 Master Prompt(통합본)의 Stage 1·2·3 출력 전체를 받아, 이미지 모델용 그리드 프롬프트로 합성하는 'Storyboard Grid Director'입니다.
철학: "9프레임 그리드는 데이터 일관성의 도구다. 내용은 시퀀싱이 결정한 것을 그대로 계승하고, 포맷만 비트 개수 N에 맞춰 자동 분기한다."

[Mission]
입력된 Master Prompt 출력 전체를 받아, 시퀀싱의 비트 개수 N에 맞는 그리드 프롬프트를 합성한다. 새 시각 정보·새 갈등·새 공간 생성 금지. 본 단계는 합성이지 창작이 아니다.

[그리드 형식 자동 분기]

| N (비트 개수) | 그리드 형식 | 슬롯 수 |
|--------------|-----------|--------|
| 1 | 싱글 이미지 1장 | 1 |
| 2 | 1×2 그리드 | 2 |
| 3 | 1×3 그리드 | 3 |
| 4–6 | 2×3 그리드 | 6 (N<6 시 빈 슬롯 또는 Anchor 확장) |
| 7–9 | 3×3 그리드 (표준) | 9 (N<9 시 빈 슬롯 또는 Anchor 확장) |
| 10+ | 3×3 그리드 + 보너스 개별 이미지 N-9장 | 9 + 보너스 |

[설계 원칙]

1. **비트-프레임 1:1 매핑 우선**
N개 비트는 N개 슬롯에 시간 순서대로 1:1 매핑. 비트의 순서가 프레임 순서.

2. **절정 위치 강제**
I=1.0 비트는 영상 60% 황금비 위치의 슬롯에 배치. 그리드별 표준 위치:
- 1×2: Frame 2 / 1×3: Frame 2 / 2×3: Frame 4 / 3×3: Frame 5
- Stage 3가 in medias res로 표시한 경우 Frame 1 또는 2가 절정

3. **빈 슬롯 처리**
N이 그리드 슬롯 수보다 적으면, 인접 Anchor 비트의 다른 순간·앵글로 확장 채움. 또는 빈 슬롯 명시.

4. **잉여 비트 처리 (N>9)**
3×3 그리드에 모든 Anchor + 강도 높은 Bridge 9개 우선 배치. 나머지 N-9개는 보너스 개별 이미지로 분리.

5. **GLOBAL 4섹션 합성**
Stage 1의 Visual Preset 7요소 + Stage 3의 LOGIC RULE이 CAMERA·LIGHTING·ENVIRONMENT·CHARACTERS 4섹션으로 합성. 모든 프레임에 일관 적용 가능한 상수만.

6. **Negative Prompt 도출 — 카테고리 사고로만**
입력 톤·물리 사양의 반대편 8–12개 키워드를 다음 카테고리에서 도출:
- 시각 스타일 반대편
- 톤·장르 반대편  
- 시대·재질 반대편
구체 키워드는 Master Prompt 출력의 톤에서 도출. 카테고리 명을 결과물에 출력하지 말 것.

7. **시놉시스 사양 우선 (anchoring 차단)**
모든 시각 어휘는 Master Prompt 출력에서 도출. 본 프롬프트 가이드 용어와 흔한 NEG 키워드 예시(anime, cartoon 등)가 입력 톤과 무관하면 침투 금지.

[작업 절차 — 6단계]

**Step 1. N 파악 + 그리드 형식 결정**
Stage 3의 비트 분할표에서 비트 개수 N 카운트 → 자동 분기 표에서 형식 결정.

**Step 2. 비트-프레임 매핑**
N개 비트를 슬롯에 시간 순서로 배치. I=1.0 비트가 그리드별 절정 위치(또는 in medias res 위치)에 오도록 매핑.

**Step 3. 빈·잉여 슬롯 처리**
빈 슬롯은 Anchor 확장 또는 빈 슬롯 허용. 잉여 비트는 보너스로 분리.

**Step 4. GLOBAL 4섹션 합성**
- CAMERA & LENS: Stage 1 Camera의 전체 톤 (패널마다 바뀌는 mm/움직임은 Frame으로)
- LIGHTING: Stage 1 Lighting + 영상 내내 불변 광원
- ENVIRONMENT & SET: Stage 1 Environment + Stage 3 LOGIC RULE 공간
- CHARACTERS: Stage 1 Identity + Stage 3 LOGIC RULE 의상·소품

**Step 5. Frame 1~N 사양 합성**
각 Frame에 비트 명 + 샷 타입 + Intensity + 렌즈 + 행동 동사 + 디테일 + Dynamic SFX 컨텍스트 박기. Stage 3 비트 분할표의 데이터를 옮기는 작업. 첫 Frame과 마지막 Frame은 Stage 3 순환 구조 데이터 반영.

**Step 6. Negative Prompt 도출**
Master Prompt 출력의 톤 반대편 8–12개 키워드.

[자기 검증 — 출력 전 7단계 점검]

1. **N-그리드 정합:** 그리드 형식이 자동 분기 표를 따르는가?
2. **Anchor 보존:** 모든 Anchor Beat가 독립 프레임으로 살아 있는가?
3. **절정 위치:** I=1.0 비트가 그리드별 황금비 위치(또는 in medias res 위치)에 배치됐는가?
4. **GLOBAL 일관성:** 4섹션이 모든 프레임에 적용 가능한 상수인가? 프레임마다 바뀔 사양이 GLOBAL에 끼어 있으면 Frame으로 이동.
5. **순환 구조:** 첫 Frame과 마지막 Frame이 Stage 3의 순환 구조 데이터로 맞물리는가?
6. **사양 도출 검증:** 출력 어휘가 Master Prompt 출력에서 도출됐는가? 본 프롬프트 가이드 용어(시각 스타일·톤·시대 카테고리 명)가 결과물에 그대로 들어 있으면 삭제.
7. **새 정보 차단:** Master Prompt 출력에 없는 새 인물·새 공간·새 갈등이 추가되지 않았는가? 있으면 삭제.

---
### [INPUT DATA]
Master Prompt(통합본) 전체 출력:
- Stage 1: 4대 변수 분해 + Integrated Logline + Data Logic Sync (Visual Preset 7요소 포함)
- Stage 2: 3막 강도 라벨링 + 막별 시놉시스 + Anchor/Bridge + 재배치 가능성
- Stage 3: 시간 길이 분배 + 비트 분할표(N개) + I=1.0 좌표 + LOGIC RULE + Ambient/Dynamic SFX + BPM + 순환 구조 + 보강된 시놉시스
---

### [OUTPUT FORMAT]

## 1. 그리드 형식 결정
- **비트 개수 N:** X
- **그리드 형식:** (싱글 / 1×2 / 1×3 / 2×3 / 3×3 / 3×3 + 보너스)
- **슬롯 처리:** 빈 슬롯 / 잉여 보너스 명시 (있는 경우만)

## 2. 비트 ↔ 프레임 매핑

| Frame | 비트 명 | Intensity | 화각·렌즈 | 시간대 |
|-------|---------|-----------|----------|--------|
| 1 | (Stage 3 비트 1) | I≈0.X | (Stage 3 화각) | (Stage 3 시간) |
| ... | | | | |
| (절정 Frame) | (Stage 3 I=1.0 비트) | **I=1.0** | (Close-up) | (Stage 3 I=1.0 좌표) |
| ... | | | | |

## 3. 그리드 마스터 프롬프트

## 4. (해당 시) 보너스 개별 이미지
N>9 경우, 그리드에 배치되지 않은 N-9개 비트를 동일 형식으로 개별 이미지 사양 제시.

## 5. (해당 시) 빈 슬롯 메모
N이 그리드 슬롯 수보다 적은 경우 (예: N=4 with 2×3 grid), 인접 Anchor의 어떤 순간을 빈 슬롯에 확장할지 명시. 또는 빈 슬롯 그대로 둠을 권장.
```

A [그리드 형식] cinematic storyboard [grid/single image] visually narrating [Stage 1 Integrated Logline 한 줄 요약] across [N] sequential [frames/frame]. Each frame represents a distinct beat from Activation to Imprint, progressing chronologically.

#### CAMERA & LENS (GLOBAL)

- [Stage 1 Camera 전체 톤]

#### LIGHTING (GLOBAL)

- [Stage 1 Lighting]

#### ENVIRONMENT & SET (GLOBAL)

- [Stage 1 Environment + Stage 3 LOGIC RULE 공간]

#### CHARACTERS (GLOBAL)

- [Stage 1 Character + Stage 3 LOGIC RULE 의상·소품]

#### GRID STRUCTURE — NARRATIVE FLOW

**FRAME 1 — [비트 명] ([샷 타입]) — I≈0.X / [렌즈]mm**

- 행동: [Stage 3 비트 행동 동사]

- 디테일: [핵심 시각 요소]

- Motion context: [Stage 3 Dynamic SFX 토큰 — 모션 함의 강화용]

**FRAME 2 — ...**

**FRAME [절정] — [Stage 3 I=1.0 비트] (Close / Emotional Core) — I=1.0 / 85mm** ⭐

- 행동: [Stage 3 가장 강한 동사]

- 디테일: [충돌의 시각 요소]

- Motion context: [Stage 3 절정 토큰 3–4개]

... (N개 모두)

**FRAME [마지막] — [Stage 3 끝 비트] — I≈0.X / [렌즈]mm**

- 디테일: Frame 1과 시각적으로 맞물리는 순환 구조 — [Stage 3 순환 구조 한 줄]

### NEGATIVE PROMPT (GLOBAL)

[입력 톤의 반대편 키워드 8–12개]

```markdown
## 4. (해당 시) 보너스 개별 이미지
N>9 경우, 그리드에 배치되지 않은 N-9개 비트를 동일 형식으로 개별 이미지 사양 제시.

## 5. (해당 시) 빈 슬롯 메모
N이 그리드 슬롯 수보다 적은 경우 (예: N=4 with 2×3 grid), 인접 Anchor의 어떤 순간을 빈 슬롯에 확장할지 명시. 또는 빈 슬롯 그대로 둠을 권장.
```

### 4-4. Phase 4로 넘기기 전 자가 점검

> 
> - [ ] **GLOBAL 4섹션이 9패널 전부에 적용 가능한가?** 패널마다 바뀌는 사양이 GLOBAL에 들어가 있으면 빼서 FRAME으로 옮기세요.

>   - [ ] **Frame 5(I=1.0)에 Phase 3-1의 절정 비트가 정확히 박혀 있는가?** 다른 위치에 절정이 있으면 시퀀싱이 무너집니다.

>   - [ ] **CHARACTERS의 LOGIC RULE이 9패널 내내 강제 가능한가?** "절대 변하지 않는 것"만 명시. 막마다 변하는 의상은 GLOBAL이 아닙니다.

>   - [ ] **Frame 1과 Frame 9의 시각적 연결점이 한 줄로 명시됐는가?** Phase 3-1에서 정의한 순환 구조가 그대로 박혀야 합니다.

> ❌가 하나라도 있으면 해당 섹션을 다시 채운 뒤 Phase 4로 넘기세요.

### 5. Phase 4로 넘기는 데이터

이 마스터 프롬프트는 두 갈래로 활용됩니다. **(1) Phase 4-1**에서 이미지 모델에 직접 입력되어 9패널 그리드 한 장으로 출력되고, **(2) Phase 3-4**에서 영상 SHOT 프롬프트 9개로 합성하기 위한 입력 데이터가 됩니다.

| 산출물 | 다음 단계에서의 용도 |
| --- | --- |
| MASTER PROMPT (전체) | Phase 4-1: 이미지 모델에 직접 입력 |
| GLOBAL 4섹션 | Phase 4-3 영상화 시 모든 SHOT에 그대로 복사 — 일관성 강제 |
| Frame별 Lens·Intensity·행동 | Phase 4-3 영상화 모델 SHOT 입력 (Master Prompt Stage 3 비트 분할표와 동치) |
| Negative Prompt | Phase 4-1: 이미지 모델 메타-사양 |

## Phase 3-4: Shot Prompt Synthesis (영상 프롬프트 합성)

**목표:** Phase 3-3의 9프레임 마스터 프롬프트를 받아, 영상화 모델(Kling 3.0 / Seedance 2.0)이 한 컷씩 영상화할 9개의 SHOT 프롬프트로 합성함.

### 데이터 흐름

| 흐름 | 데이터 | 설명 |
| --- | --- | --- |
| ⬇️ INPUT (from Phase 3-3) | 9프레임 마스터 프롬프트 | 학생이 직접 채운 GLOBAL 4섹션 + Frame 1~9 |
|  | Phase 3-1 비트 분할 | 시간대·행동 동사·Intensity |
|  | Phase 3-2 4대 레이어 | Lens / Time / SFX / Intensity 막별 표 |
| ⬆️ OUTPUT (→ Phase 4-3) | 9개 SHOT 프롬프트 | Case 2 형식의 영상 모델 입력 |

### 1. 정적 사양 vs 동적 사양

Phase 3-3의 그리드 프롬프트는 **이미지 모델용 정적 사양**입니다. N개 패널을 한 장으로 그릴 때의 사양입니다. 그러나 영상화 모델은 **모션·시간·SFX가 명시된 동적 사양**을 입력으로 받습니다. Case 2 샘플의 SHOT 형식이 그 사양 표준입니다.

> SHOT 1: ECU, 85mm push-in / 06:50 on the phone screen as it shakes on rumpled sheets. / SFX: alarm, sheet rustle.

샷 타입·렌즈·카메라 움직임 / 행동 묘사 / SFX - 세 부분이 슬래시로 구분되어 영상 모델에게 전달됩니다. **9개 패널 각각을 이 형식으로 합성하는 것이 Phase 3 시리즈의 마지막 단계입니다.**

여기서 AI에게 맡기는 이유는 명확합니다. 정적 이미지 사양을 동적 영상 사양으로 변환하면서 동시에 모션·SFX를 9개 패널에 일관되게 분배하는 작업이기 때문입니다. 이 변환은 단순 끼워넣기가 아니라 합성입니다.

### 2. Master Prompt Stage 3 ↔ SHOT 형식의 동치

Master Prompt(통합본) Stage 3의 비트 분할표는 이미 SHOT 형식과 동치 구조입니다. 별도 AI 합성 작업이 필요하지 않고, **단순 재포맷**으로 영상화 모델에 입력 가능합니다.

| Stage 3 비트 분할표 열 | SHOT 형식 위치 |
| --- | --- |
| 화각 (mm + 쇷 타입) | `SHOT N:` 다음 위치 |
| 행동 동사 | 슬래시 사이 위치 `/ ... /` |
| Dynamic SFX | `SFX:` 다음 위치 |
| 시간대 | 클립 길이 결정 |

**예시 — Stage 3 한 행을 SHOT 형식으로 변환:**

- Stage 3 행: `0:00-0:02 | Hook Beat | 휘청인다 | lurch, splash | 35mm wide | I≈0.3`

- → SHOT 형식: `SHOT 1: 35mm wide / 휘청인다 / SFX: lurch, splash.`

비트 분할표의 모든 행에 동일하게 적용하면 N개의 SHOT 프롬프트가 완성됩니다. 영상화 모델에 입력할 때는 GLOBAL 4섹션을 모든 SHOT 앞에 함께 붙여야 합니다.

### 3. GLOBAL 4섹션 강제 반복 (Data Drift 차단)

> AI 영상 모델은 이미지 모델보다 일관성이 약합니다. Master Prompt Stage 1·3에서 정의된 GLOBAL 섹션(CAMERA / LIGHTING / ENVIRONMENT / CHARACTERS)을 **모든 영상화 프롬프트에 그대로 복사**해서 붙입니다. 글로벌 사양을 매번 강제로 명시해야 Data Drift가 줄어듭니다.

### 4. (선택) 자동화 합성 프롬프트

변환 작업을 AI에게 자동으로 맡기고 싶다면 다음 프롬프트를 사용할 수 있습니다.

```markdown
[Role & Philosophy]
당신은 Phase 3-3의 9프레임 마스터 프롬프트(정적 이미지 사양)와 Phase 3-1·3-2의 비트 분할·4대 레이어를 받아, 영상화 모델(Kling 3.0 / Seedance 2.0) 입력용 SHOT 프롬프트 9개를 합성하는 'Shot Prompt Director'입니다.
철학: "정적 사양이 동적 사양으로 번역될 때만 영상이 박힌다."

[Mission]
입력 데이터를 받아, Case 2 샘플 형식의 SHOT 프롬프트 9개를 출력하시오. 각 SHOT은 Phase 4-3의 영상화 모델에 그대로 입력 가능한 완성된 텍스트여야 함.

[제약 조건]
- 각 SHOT 한 줄 형식: `SHOT N: [샷 타입+렌즈+카메라 움직임] / [행동 묘사] / SFX: [소리]`
- 행동 묘사는 물리적 동사 위주 (휘청인다·비산한다·뒤틀린다 등)
- SHOT 5(I=1.0)는 가장 강한 동사·가장 타이트한 렌즈
- SHOT 1과 SHOT 9는 시각적 모양이 맞물리는 순환 구조 반영
- 클립 길이는 Phase 3-2의 Time 표에 따라 분배 (1~2초 권장)
- GLOBAL 4섹션은 Phase 3-3 결과물을 그대로 보존하여 모든 SHOT에 적용 가능하도록 명시

---
### [INPUT DATA]
1. **Phase 3-3 마스터 프롬프트:** 학생이 채운 GLOBAL 4섹션 + Frame 1~9 사양 (그대로)
2. **Phase 3-1 비트 분할:** 시간대·행동 동사·화각·Intensity (4~6개 비트)
3. **Phase 3-2 4대 레이어:** Lens·Time·SFX·Intensity 막별 표
---

### [OUTPUT FORMAT]

## SHOT PROMPTS — [Project Title]

### GLOBAL (모든 SHOT에 그대로 복사하여 일관성 강제)
[Phase 3-3의 GLOBAL 4섹션 그대로 — CAMERA / LIGHTING / ENVIRONMENT / CHARACTERS]

### SHOT 1~9

**SHOT 1:** [샷 타입, 렌즈, 카메라 움직임] / [물리적 행동] / SFX: [소리들]
**SHOT 2:** ...
**SHOT 3:** ...
**SHOT 4:** ...
**SHOT 5:** ⭐ I=1.0 절정 — 가장 강한 동사, 85mm CU
**SHOT 6:** ...
**SHOT 7:** ...
**SHOT 8:** ...
**SHOT 9:** [SHOT 1과 시각적으로 맞물리는 순환 구조]

### 클립 길이 분배
- Act 1 (SHOT 1~3): I≈0.2~0.4, 각 1.5~2초
- Act 2 (SHOT 4~6): I≈0.6~1.0, SHOT 5는 0.5~1초 (가장 짧고 강하게)
- Act 3 (SHOT 7~9): I≈0.7~0.3, 잔상 박제 1.5~2초
```

### 5. Phase 4-3로 넘기는 데이터

| 산출물 | Phase 4-3에서의 용도 |
| --- | --- |
| SHOT N 영상 프롬프트 (Stage 3 비트 분할표 재포맷) | 옵션 A (I2V): 영상화 모델에 패널별 입력 |
| GLOBAL 4섹션 (Master Prompt Stage 1+3) | 모든 영상화 프롬프트에 일관성 강제 반복 |
| Stage 3 시간 길이 분배 | 옵션 B (Multi-shot): 막별 묶음 길이 결정 |

## Phase 4. Execution (생성과 영상화의 실전)

Phase 1·2·3에서 여러분은 시놉시스를 데이터로 번역하고 9프레임 그리드로 압축했습니다. 이제 그 그리드를 실제로 '뽑아내는' 단계입니다. 도구의 손에 맡기되, Spec과 Intensity 곡선이 그대로 살아남게 통제합니다.

### Phase 4-1: 도구 선택 & 그리드 생성

#### 1. 왜 Nano Banana Pro인가?

(2026년 4월 기준) 9개 패널을 한 장에 동시에 그릴 수 있는 이미지 모델 중 가장 안정적인 것이 **Nano Banana Pro**(Gemini 3 Pro Image)입니다. 이유는 셋입니다.

- **다국어 텍스트 렌더링:** 9개 프레임에 걸쳐 `Frame 1: Setup`, `Frame 5: Turning Point` 같은 좌표 라벨을 정확하게 박을 수 있습니다. 그리드 안에서 어느 프레임이 어느 막인지 한눈에 검증됩니다.

- **참조 이미지 14개까지 입력:** 캐릭터, 의상, 공간 레퍼런스를 동시에 던져 9패널 전체에 일관성을 강제할 수 있습니다.

- **4K 네이티브 출력:** 그리드 한 장이 4K이므로, 패널 하나당 약 1280×720 이상이 확보됩니다. 별도 업스케일 없이 영상화 모델에 바로 입력 가능한 수준입니다.

#### 2. 그리드 생성 워크플로우

1. Phase 3-3에서 만든 3×3 마스터 프롬프트 준비

2. 캐릭터 레퍼런스 이미지(있다면) 1~3장 첨부

3. Nano Banana Pro에 입력

4. 출력된 9패널이 LOGIC RULE을 위반하지 않는지 1차 검증 (의상, 공간, Texture)

5. 위반 패널이 있으면 → 해당 패널만 지목해서 부분 수정 요청

> **Negative Prompt 필수:** Phase 3-3 마스터 프롬프트 끝에 있는 "anime, cartoon, modern clothing..." 식의 Negative Prompt를 빼지 마세요. Tone/Color 사양의 반대편을 정의하지 않으면 AI가 자기 평균치로 회귀합니다.

### Phase 4-2: 패널 추출 & 업스케일

#### 1. 추출

9패널 그리드는 한 장의 이미지입니다. 영상화 모델에 입력하려면 패널을 개별 이미지로 잘라야 합니다.

- 가장 간단한 방법: 이미지 편집 도구에서 9등분 크롭

- Photoshop의 Slice Tool, Photopea(브라우저), CapCut 등으로 가능

- 각 패널 파일명은 `frame_01.png` ~ `frame_09.png`로 통일. Phase 2-2에서 정한 Intensity 좌표와 1:1로 맞아야 후반 작업이 흔들리지 않습니다.

#### 2. 업스케일 (필요 시)

Nano Banana Pro의 4K 그리드를 9등분하면 패널은 약 1280×720입니다. 영상화 모델 대부분이 1080p 입력을 권장하므로, 패널을 1.5~2배 업스케일하면 더 안전합니다.

- **Topaz Gigapixel** ($29/월~): 사실적 업스케일. 원본 디테일 보존 우선. AI 생성 이미지에는 다소 보수적.

- **Magnific AI** ($39/월~): 생성형 업스케일. 새로운 디테일을 환각으로 추가. AI 이미지 업스케일에 강하지만 얼굴 변형 위험 있음 — Creativity 슬라이더 0~1 권장.

- **Upscayl** (무료, 오픈소스): 로컬 처리. 무료 옵션 중 가장 안정적.

> **얼굴 패널은 Magnific 주의:** Phase 2-1의 Identity(고정 자산)가 무너지지 않도록 Resemblance를 높게 유지하세요.

### Phase 4-3: 영상화 (Kling 3.0 / Seedance 2.0)

#### 1. 두 도구의 분기

(2026년 4월 기준) 9패널을 영상화하는 데 가장 적합한 두 옵션입니다.

| **항목** | **Kling 3.0 (Video 3.0 Omni)** | **Seedance 2.0** |
| --- | --- | --- |
| **출시** | 2026.02.05 (Kuaishou) | 2026.04 글로벌 (ByteDance) |
| **해상도** | 네이티브 4K @ 60fps | 2K |
| **길이** | 3~15초 | 4~15초 |
| **멀티샷** | 단일 생성 안에 6컷 시퀀스 | 멀티샷 지원 |
| **레퍼런스 입력** | 이미지 + 비디오 (캐릭터 일관성) | 이미지 9 + 비디오 3 + 오디오 3 |
| **네이티브 오디오** | 영/중/일/한/스페인어 + 영어 억양 3종 | 다국어 립싱크, 음악 동기화 |
| **고유 강점** | Multi-shot Storyboard, Motion Brush, 텍스트 렌더링 | 카메라 모션 복제, I2V Elo 1위 |
| **접근** | [klingai.com](http://klingai.com/), [fal.ai](http://fal.ai/), Higgsfield | [seedance.ai](http://seedance.ai/), Comfy Cloud, [fal.ai](http://fal.ai/), CapCut |
| **단가** | $0.084~0.168/초 | $0.081/초 (Fast), $0.10/초 (Standard) |

#### 2. 어느 쪽을 언제 쓰는가

**Kling 3.0이 유리한 경우**

- 인접한 3~6컷을 한 번의 생성으로 묶어 캐릭터/공간 일관성을 끝까지 끌고 가고 싶을 때 (Multi-shot Storyboard)

- 4K @ 60fps가 필요한 출력

- 한국어 네이티브 오디오·립싱크가 필요할 때

**Seedance 2.0이 유리한 경우**

- 패널을 Image-to-Video로 개별 영상화할 때 (I2V 벤치마크 1위)

- 레퍼런스 영상의 카메라 동작을 그대로 복제하고 싶을 때 (예: 실사 핸드헤드의 흔들림을 AI 영상에 이식)

- Comfy Cloud 워크플로우 안에서 다른 노드와 연결해 작업하고 싶을 때

**혼합 전략:** 1막은 Kling Multi-shot으로 한 번에, 2막 절정 컷(I=1.0)은 Seedance Image-to-Video로 정밀 제어, 3막 잔상은 Kling Start/End Frame으로 복귀 — 같은 분할도 가능합니다.

#### 3. 실전 워크플로우 (예시)

**옵션 A — 패널별 I2V (가장 직관적)**

> 패널 1 (frame_01.png) → Seedance I2V → clip_01.mp4 (1~2초)
패널 2 (frame_02.png) → Seedance I2V → clip_02.mp4
...
패널 9 (frame_09.png) → Seedance I2V → clip_09.mp4

각 패널의 영상 프롬프트는 **Phase 3-4에서 합성한 SHOT 1~9를 그대로 입력**하세요. GLOBAL 4섹션도 함께 붙여야 LOGIC RULE이 영상화 단계까지 살아남습니다.

**옵션 B — Multi-shot 묶음 (Kling 3.0)**

> 패널 1·2·3 (Act 1, I≈0.2~0.4) → Kling Multi-shot → act1.mp4 (5초)
패널 4·5·6 (Act 2, I≈0.6~1.0) → Kling Multi-shot → act2.mp4 (7초)
패널 7·8·9 (Act 3, I≈0.5~0.3) → Kling Multi-shot → act3.mp4 (3초)

**옵션 C — Start/End Frame 트랜지션**

> 연속한 두 패널 사이 자연스러운 모션이 필요할 때, 패널 N을 Start, 패널 N+1을 End로 입력해 트랜지션 생성. Kling 3.0과 Seedance 2.0 모두 지원.

#### 4. LOGIC RULE 적용

> Phase 3-3에서 정의한 GLOBAL 섹션(CAMERA / LIGHTING / ENVIRONMENT / CHARACTERS)을 **모든 영상화 프롬프트에 그대로 복사**해서 붙입니다. AI 영상 모델은 이미지 모델보다 일관성이 약하므로, 글로벌 사양을 매번 강제로 명시해야 Data Drift가 줄어듭니다.

## Phase 5. Post-Production (편집과 마감)

Phase 4에서 생성한 클립들은 그 자체로는 영상이 아닙니다. Phase 2-2에서 설계한 Intensity 곡선이 실제로 살아 움직이게 만드는 단계가 후반 작업입니다.

### Phase 5-1: 클립 스티칭 & 편집

#### 1. 도구

- **DaVinci Resolve** (무료): 색보정·트랜지션·VFX까지 한 번에. AI 영상 후반 작업의 표준.

- **CapCut**: 빠른 편집과 SNS 포맷 자동 출력. ByteDance 도구라 Seedance와 호환 좋음.

- **Premiere Pro**: 익숙하다면.

#### 2. 컷 편집 원칙 — Intensity 곡선의 시각화

Phase 2-2에서 정의한 I≈0.2 → 1.0 → 0.5의 곡선을 컷의 **빈도와 길이**로 번역합니다.

- **1막 (I≈0.2):** 컷 1개당 2~4초. 호흡이 길어야 함. 와이드 샷 위주.

- **2막 (I=1.0):** 컷 1개당 0.3~0.8초. 빠른 교차 편집. 145 BPM 같은 음악 비트에 컷을 맞춤(beat-synced).

- **3막 (I≈0.5):** 컷 1개당 1.5~3초. 호흡이 다시 길어지되 1막보다 짧게 — 잔상의 박제.

#### 3. 트랜지션

- **Match cut:** 인물의 행동 모양이 다음 컷의 다른 행동과 겹쳐 이어지게.

- **Whip pan:** 카메라 빠른 회전으로 두 컷을 잇기. 2막의 절정 직전에 효과적.

- **Smash cut:** 정적인 프레임에서 갑자기 동적인 프레임으로. I=0.4에서 I=1.0으로의 점프에 사용.

- **L-cut / J-cut:** 오디오와 영상의 시작점을 어긋나게 — Phase 5-2와 연동.

### Phase 5-2: 오디오 레이어

#### 1. 네이티브 오디오 활용

Kling 3.0과 Seedance 2.0은 영상 생성 시 오디오를 함께 만듭니다. 이걸 그대로 쓸지, 떼어내고 새로 깔지 결정해야 합니다.

- **그대로 쓰기:** 립싱크가 중요한 대사 컷. 자연 동기화 보장.

- **떼어내고 새로 깔기:** 음악과 SFX의 의도를 더 정밀하게 제어하고 싶을 때. AI 생성 오디오는 음질이 영화 후반 표준에는 못 미침.

#### 2. SFX / 앰비언스

Phase 3-2의 SFX 레이어에서 정한 사운드를 실제 라이브러리에서 찾아 깝니다.

- **[Freesound.org](http://freesound.org/)** (무료, CC 라이선스): 앰비언스, 자연음, 일상 SFX

- **Splice** (구독): 음악 샘플 + SFX. 비트 동기화 작업에 강점

- **Epidemic Sound / Artlist** (구독): 영상 사용권 포함 음악·SFX 라이브러리

- **ElevenLabs SFX**: 텍스트로 SFX 직접 생성

#### 3. 음악 — BPM 매칭

Phase 1-2에서 정한 Mood의 BPM을 음악으로 변환:

- **Suno v4 / Udio**: 텍스트로 음악 생성. BPM 지정 가능

- **AIVA / Soundraw**: 영상 길이에 맞춘 자동 트랙 생성

- 기존 라이선스 음원: Splice / Artlist에서 BPM 필터로 검색

> **2막의 컷 = 비트:** 음악의 다운비트와 컷 포인트가 맞아야 145 BPM 류의 Mood가 데이터 그대로 영상에 박힙니다. CapCut의 'Beat Sync' 기능이 이 작업을 자동화합니다.

### Phase 5-3: 최종 검토 체크리스트

영상이 완성됐다고 느낄 때, 아래 6개를 한 번씩 확인하세요. Phase 1~4에서 설계한 데이터가 실제 영상에 박혀 있는지 검증하는 단계입니다.

> 
> - [ ] **LOGIC RULE 일관성** — 의상·소품·공간이 9개 컷에 걸쳐 어긋나지 않는가? 캐릭터 얼굴이 컷마다 미세하게 변하지 않는가? (Identity Drift)

>   - [ ] **Optical 일관성 (Camera·Lighting·Color)** — Phase 1-2에서 정한 렌즈(mm)·조명·색감이 영상에 살아 있는가? I=1.0 컷이 실제로 망원(85mm 이상) 또는 와이드(24mm 이하)인가?

>   - [ ] **Temporal 일관성 (Mood·Time)** — 음악 BPM이 컷의 빈도와 일치하는가? 2막 절정에서 호흡이 가장 빠른가? Time 좌표와 실제 타임라인이 맞는가?

>   - [ ] **Spatial 일관성 (Character·Environment)** — Phase 1-2에서 정한 인물·공간 사양과 Physics(Rigid-body / Fluid 등)가 영상에서 일관되는가? 같은 재질·의상이 컷마다 다르게 표현되지 않는가?

>   - [ ] **Intensity 곡선 검증** — 1막은 호흡이 길고 와이드 위주인가? 2막에 가장 짧은 컷·가장 강한 충돌이 들어 있는가? 3막에 잔상이 남는가?

>   - [ ] **Data Drift 발생 여부** — 어느 컷에서 의상/공간/조명이 맥락 없이 튀는가? 튀는 컷은 재생성 또는 부분 수정 필요.

체크리스트의 한 줄이라도 ❌가 나오면, Phase 4-3으로 돌아가 해당 컷만 재생성하세요. 전체를 다시 만들지 마세요. **재생성의 비용을 통제하는 능력이 곧 AI 영상 작업자의 실력**입니다.

## 전체 프로세스 표

| 단계 | 입력 | 핵심 산출물 | 다음 단계로 넘기는 변수 |
| --- | --- | --- | --- |
| Phase 1-1 | 후크라인(아이디어) | 7요소 어휘 정의 | Visual Spec 7요소 체계 |
| Phase 1-2 | 후크라인 + 7요소 체계 | 3 Preset (각 Visual Spec 7) | Visual Spec + Conflict Trigger |
| Phase 2-1 | Visual Spec + Conflict Trigger | Integrated Logline + Data Logic Sync | 로그라인 + 3그룹 Logic |
| Phase 2-2 | Integrated Logline + Logic Sync | 3막 Intensity 곡선 시놉시스 | I≈0.2→1.0→0.5 곡선 |
| Phase 3-1 | 3막 시놉시스 + Intensity | 9프레임 시퀀싱 전략 | 프레임별 Intensity 좌표 |
| Phase 3-2 | 9프레임 좌표 | 4대 데이터 레이어 정리 | Lens·Time·SFX·Intensity 표 |
| Phase 3-3 | 4대 레이어 정리 | 3×3 Grid 마스터 프롬프트 | GLOBAL 4섹션 + Frame 1~9 + Negative Prompt |
| Phase 3-4 | Master Prompt Stage 3 비트 분할표 | 영상화 SHOT 형식 재포맷 | SHOT N + GLOBAL + 클립 길이 |
| Phase 4 | 마스터 프롬프트 | 9패널 그리드 → 영상 클립 | clip_01~09.mp4 |
| Phase 5 | 영상 클립 | 편집·오디오·검토 | 최종 영상 |

> AI 작업 프로세스에 정답은 없습니다. 위의 작업을 해 보면서 본인만의 파이프라인을 만들어 보세요.
