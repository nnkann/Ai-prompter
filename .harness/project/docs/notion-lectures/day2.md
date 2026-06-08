---
title: Day2 AI Character Class
domain: sources
problem: P1
s: [S1]
tags: [notion, character]
status: completed
created: 2026-06-04
---

# Day2. AI Character Class

- Source: Notion page 272bac7f-0000-80ae-9108-d1da39378618
- Last edited: 2026-04-29T06:17:00.000Z

## "캐릭터는 일관성(Consistency)이 곧 생명이다."

AI가 그린 '우연한 한 장'은 작품이 될 수 없습니다.

어떤 각도, 어떤 조명, 어떤 화풍 속에서도 **동일 인물임을 증명할 수 있는 '디지털 유전자'**를 설계하는 것.

이것이 진정한 생성형 AI 활용의 시작입니다.

> 오늘은 AI에게 '잘 그리라'고 명령하는 대신, '이 캐릭터를 기억하라'고 명령하는 법을 배웁니다.

## "왜 내가 그린 캐릭터는 매번 얼굴이 바뀔까?"

### 활동: 5장의 사진 비교

동일한 프롬프트로 생성했지만, 미묘하게 얼굴이 다른 5장의 이미지를 봅시다.

> Portrait of a young female warrior, age 20, short silver bob hair, emerald green eyes,light leather armor with bronze buckles,neutral expression, looking at camera.Style: Anime, Studio MAPPA, clean linework.Background: Simple gradient.Lighting: Soft studio lighting. 1:1 ratio

<!-- unsupported Notion block: column_list -->
<!-- unsupported Notion block: column -->
[image](notion-asset://redacted-temporary-url)

<!-- unsupported Notion block: column -->
[image](notion-asset://redacted-temporary-url)

<!-- unsupported Notion block: column_list -->
<!-- unsupported Notion block: column -->
[image](notion-asset://redacted-temporary-url)

<!-- unsupported Notion block: column -->
[image](notion-asset://redacted-temporary-url)

<!-- unsupported Notion block: column -->
[image](notion-asset://redacted-temporary-url)

| Image 1 | Image 2 | Image 3 | Image 4 | Image 5 |
| --- | --- | --- | --- | --- |
| 가슴 아머 닫힘 | 목 부분 파임 | 2번과 비슷 | 얼굴형 귀여워짐 | 머리결 다름 |

> 
> #### 질문

> "이 5명은 같은 인물일까요, 자매일까요?"

> "웹툰 작가가 매 컷 주인공의 얼굴을 다르게 그린다면, 독자가 몰입할 수 있을까요?"

AI에게 **'운'을 맡기는 것이 아니라**, 캐릭터를 **박제(Fix)**하는 워크플로우가 있습니다. 오늘은 **Gemini의 캐릭터 기억 기능**으로 이 문제를 해결합니다.

## Gemini 3 Pro Image (Nano Banana Pro) 기반

제미나이는 아주 다재다능한 AI지만 한계는 있습니다. 알려진 한계에 대해서 알아보면, 

| 항목 | 스펙 |
| --- | --- |
| 최대 입력 이미지 | 14개 |
| 동시 인물 일관성 | 5명 |
| 기억 범위 | 같은 대화 세션 내 |

---

## 먼저 알아두기: 왜 모델마다 프롬프트가 다를까?

AI 모델들은 각자 공부한 배경(학습 데이터)에 따라 명령을 해석하는 방식이 완전히 다릅니다. 각각이 가지는 특징은  아래와 같습니다. 

**AI 모델별 프롬프트 제어 비교**

| 구분 | Gemini | GPT/DALL-E 3 | Midjourney | Stable Diffusion |
| --- | --- | --- | --- | --- |
| **핵심 철학** | 문서 구조 이해 | 문맥과 관계 서술 | 시각적 직관 참조 | 데이터 노드 제어 |
| **선호 구조** | Markdown / HTML | Natural Language / JSON | Visual Ref / Parameters | Tag / Weighted Tokens |
| **강조 방법 1** | `**Bold**` | "Primary focus on..." | `--sw`, `--cw` 수치 | `(Keyword:1.5)` 가중치 |
| **강조 방법 2** | `### Heading` 구역 분리 | 형용사/부사 중첩 | `Keyword::2` 텍스트 가중치 | `((Keyword))` 괄호 중첩 |
| **일관성 도구** | Identity Anchoring | Seed / Gen_ID | `--cref`, `--sref` | IP-Adapter, ControlNet |
| **비유** | 🏗️ 건축가 | 📖 이야기꾼 | 🎨 예술가 | ⚙️ 엔지니어 |

### **모델별 실전 제어 전략**

> 
> #### Gemini (The Architect)

> **전략:** 마크다운 태그를 활용해 AI에게 '설계도'를 보여주세요.

> **팁:** `### Subject`, `### Lighting` 처럼 구획을 나누고, 핵심 키워드는 `**Bold**` 처리

> **이유:** 전 세계의 웹 문서(HTML, Markdown)를 학습하여 구조와 위계를 중요시합니다.

> 
> #### GPT/DALL-E 3 (The Storyteller)

> **전략:** JSON 형식으로 속성을 정의하거나, 상세한 문장으로 상황을 묘사하세요.

> **팁:** "이 캐릭터는 무엇보다 얼굴 특징이 가장 중요하다"는 식의 우선순위를 문장으로 직접 언급

> **이유:** 코드(JSON)와 방대한 대화 맥락을 학습하여 관계와 서술에 강합니다.

> 
> #### Midjourney (The Artist)

> **전략:** 말보다 이미지 링크와 파라미터를 사용하세요.

> **팁:** 캐릭터 일관성을 위해 `-cref`와 함께 `-cw 0`(얼굴만 참조) 파라미터 조합

> **이유:** 예술적 데이터와 파라미터 조합을 통해 시각적 직관을 우선합니다.

> 
> #### Stable Diffusion/ComfyUI (The Engineer)

> **전략:** 자연어 문법을 버리고 '단어'와 '숫자'에 집중하세요.

> **팁:** 괄호와 수치 `(keyword:1.2)`를 통해 AI의 뉴런에 직접적인 가중치 부여

> **이유:** 단어 하나하나를 수치화된 토큰으로 처리하여 수학적 정밀도로 제어합니다.

따라서 **"같은 말이라도 누구에게 하느냐에 따라 다르게 말해야 한다."**가 중요합니다. 

오늘 우리가 Gemini용 프롬프트를 **마크다운 구조**로 작성하는 이유가 여기 있습니다.

### AI 프롬프트 충돌 사례집 (Conflict Case Study)

프롬프트를 잘못 작성하면 어떤 일이 벌어지는지 봅시다. **실수에서 배우는 것이 가장 빠릅니다.**

---

### 1. 스타일 충돌 (Style Conflict)

### "둘 다 내놓으라니요?"

가장 흔한 실수입니다. 하나의 이미지에 **상반된 두 가지 화풍**을 동시에 요구하면, AI는 어느 장단에 맞춰야 할지 몰라 기괴한 결과물을 내놓습니다.

| 항목 | 내용 |
| --- | --- |
| **의도** | 극사실주의적인 인물 사진인데, 느낌은 유화처럼 내고 싶다 |
| **충돌 프롬프트** | "극사실주의 실사 사진(Photorealistic raw photo), 두껍게 칠한 유화 질감(Thick impasto oil painting texture)" |

[image: 스타일 충돌 결과물](notion-asset://redacted-temporary-url)

AI가 두 명령어를 모두 만족시키려다 보니, **얼굴 반쪽은 사진으로, 나머지 반쪽은 그림으로 **그려버렸습니다.

### 해결책: 우선순위(Weighting) 정하기

`❌ 충돌: "Photorealistic raw photo, Thick impasto oil painting"

✅ 해결 (Gemini): "**Photorealistic portrait** as the primary style, with subtle painterly color grading inspired by oil paintings"

✅ 해결 (SD 가중치): "(photorealistic:1.5), (oil painting style:0.3)"`

원칙: '실사'가 기본이고 '유화 느낌'은 살짝만 → 실사 키워드를 더 많이, 유화는 "inspired by" 수준으로

---

### 2. 논리적 충돌 (Logical Impossibility)

### "물리 법칙을 거스르라고요?"

AI는 물리 엔진이 아닙니다. 사용자가 **상식적으로 불가능한 상황**을 요구하면, 그 모순을 그대로 시각화합니다.

| 항목 | 내용 |
| --- | --- |
| **의도** | 비가 오는 어두운 밤거리의 분위기 있는 사진 (그림자도 멋지게) |
| **충돌 프롬프트** | "비 오는 어두운 밤(Dark rainy night), 선명하고 강한 그림자(Sharp, strong shadows)" |

[image: 논리적 충돌 결과물](notion-asset://redacted-temporary-url)

하늘은 어둡고 비가 오는데, 바닥에는 **대낮처럼 밝고 선명한 그림자 **가 드리워진 기묘한 이미지

### 💡 해결책: 상황의 개연성 맞추기

`❌ 충돌: "Dark rainy night" + "Sharp strong shadows"
   (비 오는 밤에 선명한 그림자는 물리적으로 불가능)

✅ 해결 A (비 오는 밤을 살리려면): "Dark rainy night, wet pavement reflecting neon lights,
soft diffused ambient glow, no harsh shadows"

✅ 해결 B (선명한 그림자를 살리려면):"Clear night after rain, wet streets, sharp shadows from bright street lamps"`

원칙: 조명 조건과 그림자는 물리적으로 연결되어 있음. 하나를 선택하면 다른 하나는 따라와야 함.

---

### 3. 의미론적 충돌 (Semantic Ambiguity)

### "그 '배'가 아니잖아요!"

동음이의어(같은 소리, 다른 뜻)를 사용할 때 AI가 문맥을 파악하지 못해 **엉뚱한 해석**을 합니다.

| 항목 | 내용 |
| --- | --- |
| **의도** | 건설 현장에서 기중기(Crane)를 작동하는 사람의 멋진 사진 |
| **충돌 프롬프트** | "A person holding a crane" ('holding'은 '작동하다'의 비유적 표현) |

[image: 의미론적 충돌 결과물](notion-asset://redacted-temporary-url)

AI는 'Crane'의 두 가지 의미(기중기 , 학 )와 'holding'(들고 있다)을 모두 글자 그대로 해석하여, **사람이 장난감 기중기와 실제 학을 동시에 들고 있는 **황당한 장면

---

### 💡 해결책: 명확하고 구체적인 단어 사용

`❌ 충돌: "A person holding a crane"
   (Crane = 기중기? 학? / Holding = 들고 있다? 조작하다?)

✅ 해결: "A construction worker operating a tower crane, sitting inside the crane cabin,
hand on control lever, construction site background"`

원칙:

- 'Crane' → 'construction crane', 'tower crane', 'heavy machinery'

- 'Holding' → 'operating', 'controlling', 'sitting in the cabin of'

- **비유적 표현 금지, 직접적 동사 사용**

---

> 
> #### 충돌 방지 체크리스트

> 프롬프트 작성 후, 사용하기 전에 확인하세요:

>   - [ ] **스타일 충돌:** 상반된 화풍을 동시에 요구하고 있지 않은가?

>   - [ ] **논리적 충돌:** 물리적으로 불가능한 조합이 있지 않은가?

>   - [ ] **의미론적 충돌:** 동음이의어나 비유적 표현이 있지 않은가?

>   - [ ] **우선순위:** 가장 중요한 요소가 명확히 강조되어 있는가?

## Step 1. 마스터 캐릭터 시트 제작

### 왜 캐릭터 시트가 필요한가?

애니메이션 스튜디오에서는 캐릭터를 그리기 전에 **반드시** 캐릭터 시트를 만듭니다. 모든 각도에서 캐릭터가 어떻게 보이는지 정의하는 **설계도**입니다. AI도 마찬가지입니다. **명확한 레퍼런스가 있어야 일관된 기억**이 가능합니다.

### Step 1-A: 기준 캐릭터 완성하기

앞서 우리는 "은발 여전사"를 5번 생성해 봤습니다. 하지만 매번 미묘하게 달랐죠. 이제 **마음에 드는 1장을 골라서 완성**합니다.

**목표: 고유 특징 추가하기**

2단계에서 만든 기본 캐릭터에 **식별 가능한 고유 특징**을 추가합니다:  **왜 고유 특징이 중요한가? **나중에 각도가 바뀌어도 "이 흉터가 있으니 같은 캐릭터"라고 확인할 수 있습니다.

| 추가할 특징 | 위치 | 목적 |
| --- | --- | --- |
| **작은 흉터** | 오른쪽 눈 밑 | 일관성 체크 포인트 |
| **은색 귀걸이** | 왼쪽 귀 | 좌우 구분 + 디테일 |

> 
> - Small scar under her RIGHT eye

>   - Silver hoop earring on her LEFT ear

> ---

> 이 내용을 이미지와 함께 넣어서 이미지를 생성하세요.

[image](notion-asset://redacted-temporary-url)

생성된 이미지를 확인하세요:
  - [x] 원본과 동일한 얼굴인가?

  - [x] **오른쪽 눈 밑 흉터**가 있는가?

  - [x] **왼쪽 귀 귀걸이**가 있는가?

> 마음에 들 때까지 재생성하세요. 이 이미지가 **모든 후속 작업의 기준점**이 됩니다.

### Step 1-B: 전신 이미지로 확장

상반신 이미지가 완성되었으면, 이제 **전신**으로 확장합니다.

> 이 캐릭터의 전신을 그려줘.
> - 하반신: 검은색 바지, 갈색 가죽 부츠

>   - 포즈: 정면, A-pose

>   - 배경: 흰색

[image](notion-asset://redacted-temporary-url)

Step 1-B에서 **전신 정면 이미지**가 완성되었습니다. 이제 이 이미지를 기준으로 **4방향 턴어라운드**를 만듭니다.

### 실전: 4방향 턴어라운드 시트 (16:9)

이제 **텍스트만으로** 4방향 캐릭터 시트를 만들어봅니다. **비율:** 16:9 가로형 (4개 캐릭터가 나란히 배치되기 좋음)

| 위치 | 뷰 | 설명 |
| --- | --- | --- |
| 왼쪽 1 | **Front (정면)** | 전신, 카메라 정면 응시 |
| 왼쪽 2 | **3/4 View** | 전신, 45° 회전 |
| 오른쪽 1 | **Side (측면)** | 전신, 완전 90° 프로필 |
| 오른쪽 2 | **Back (후면)** | 전신, 뒷모습 |

Step B: 4방향 턴어라운드 프롬프트

> [생성한 캐릭터 이미지 첨부]
> 이 캐릭터의 4방향 턴어라운드 시트를 만들어줘.
> 16:9 비율, 순서: 정면 → 3/4 → 측면 → 후면
> 배경 흰색, 하단에 컬러 팔레트 바.

[image](notion-asset://redacted-temporary-url)

생성된 이미지를 보고 다음을 체크하세요:

- [x] 4개 뷰가 모두 나왔는가?

- [x] 순서가 맞는가? (정면 → 3/4 → 측면 → 후면)

- [x] 첨부한 이미지와 동일 인물인가?

- [x] 키/비율이 일관적인가?

- [x] 흉터/귀걸이 위치가 정확한가?

- [x] 컬러 팔레트 바가 있는가?

> 
> #### 흔히 발생하는 문제

> | 문제 | 원인 | 임시 해결책 |
> | --- | --- | --- |
> | 3개만 나옴 | AI가 4개를 다 그리기 어려워함 | 2개씩 나눠서 생성 |
> | 순서가 뒤바뀜 | 레이아웃 지시 무시 | "왼쪽에서 오른쪽으로" 강조 |
> | 캐릭터가 다르게 생김 | 참조 실패 | "첨부 이미지와 동일하게" 반복 강조 |
> | 측면이 안 나옴 | 90° 프로필 어려움 | "완벽한 90도" 강조 |

사실 텍스트만으로는 아무래도 한계가 발생합니다. 4개가 다 안 나오거나, 순서가 뒤바뀌거나 캐릭터가 다르게 나오거나 목이 돌아가거나 하는 것들이 발생합니다. 이를 보완하기 위해 텍스트+시각적 가이드를 함께 추가하여 정확도를 올리도록 합시다. 

#### 최종 참고용 캐릭터 시트 프롬프트

```markdown
당신은 캐릭터의 구조와 시각적 개연성을 설계하는 '리드 비주얼 아키텍트'입니다. 사용자가 제공하는 텍스트나 이미지를 분석하여 아래의 5단계 절차에 따라 최적화된 캐릭터 시트를 생성하세요.

### [1단계: 사용자 입력 요청]
반드시 아래 문장을 그대로 출력하여 질문합니다.
"캐릭터의 특징들을 나열하고, 캐릭터 시트의 art style을 입력해주세요. (참조할 이미지가 있다면 함께 업로드해주세요.)"

### [2단계: 전문가적 캐릭터 설계 및 이미지 분석]
사용자가 입력을 하면, 즉시 생성하지 않고 아래의 [분석 보고서]를 먼저 작성합니다.

1. **[참조 이미지 분석]**: 이미지가 제공된 경우, 해당 이미지의 조형적 특징, 실루엣, 색상 팔레트, 재질감을 정밀하게 분석하여 핵심 요소를 추출합니다.
2. **[디자인 크리틱]**: "제공된 이미지/텍스트를 바탕으로 볼 때, ~한 부분의 디테일을 강화하면 시각적 설득력이 더 높아질 것으로 판단됩니다. ~한 요소를 추가 설계에 반영하겠습니다."와 같이 전문가적 의견을 개진합니다.
3. **[보완 설정]**: 사용자가 명시하지 않았거나 이미지에서 보이지 않는 부분(후면 구조, 세부 질감 등)을 전체 컨셉에 맞춰 일관성 있게 설정합니다.

### [3단계: Art Style 확정]
- 사용자가 명시한 스타일을 반영합니다. 
- 이미지와 텍스트가 충돌할 경우 사용자의 텍스트 명령을 우선하되, 별도 지시가 없으면 제공된 이미지의 스타일을 계승합니다.
- 미입력 시 기본값: "Hyper-realistic photo, pure white background"

### [4단계: 이미지 생성 (Technical Layout)]
확정된 설계를 바탕으로 16:9 비율의 단일 이미지를 생성합니다. 제공된 참조 이미지의 핵심 특징을 모든 섹션에 완벽히 동기화하십시오.

**[이미지 기본 조건]**
- 비율: 16:9 / 배경: 순백색 (#FFFFFF) / 조명: 중립적 플랫 조명 (그림자 최소화)

**[포즈 규칙]**
- 인간형: 팔을 30~45도 벌린 A포즈 (중립 자세)
- 사족보행 및 기타: 신체 구조에 맞는 자연스러운 기립 자세 (과도한 액션 금지)

**[섹션 레이아웃 구성 (Horizontal 4-Split)]**
1번 섹션: 피사체 기준 우측 45도 전신 (측면 구조와 질감 강조)
2번 섹션: 정면 전신 (좌우 대칭 및 정면 디테일 명확화)
3번 섹션: 후면 전신 (등, 소품, 꼬리 등 후면 구조 명확화)
4번 섹션: 세로 3단 두상 상세 (상: 우측 45도 / 중: 정면 / 하: 좌측 45도)

### [5단계: 생성 후 무결성 검토]
이미지 생성 후, 아래 항목을 체크하여 보고합니다.
- [참조 일치성]: 제공된 이미지의 특징이 결과물에 얼마나 정확하게 반영되었는지 확인.
- [수평 일치성]: 각 섹션의 관절 및 비례가 수평적으로 일치하는지 검증.
- [일관성 검증]: 모든 섹션에서 동일 개체로 인식되는지 확인.
```

> 
> #### ControlNet이 뭐야? (30초 설명)

> ControlNet은 AI에게 "이 뼈대 구조를 따라 그려"라고 명령하는 기술입니다.

> | 개념 | 비유 |
> | --- | --- |
> | 스켈레톤(뼈대) | 만화가가 쓰는 막대 인간 스케치 |
> | ControlNet | "이 막대 인간 위에 살을 붙여줘" |
> | 결과 | 정확한 포즈와 구도의 캐릭터 |

### 포즈 스켈레톤 이미지

아래는 캐릭터 시트용 포즈 스켈레톤입니다:

[image: 캐릭터 시트(턴어라운드+표정) - 제미나이에서는 안됩니다. Comfy전용](notion-asset://redacted-temporary-url)

이미지 표시

| 영역 | 용도 |
| --- | --- |
| 상단 3개 | 정면 / 측면 / 정면 (T-pose, A-pose) |
| 하단 왼쪽 | 다양한 얼굴 각도와 표정 |
| 하단 오른쪽 | 위에서 본 각도 (탑뷰) |

### 실습: 스켈레톤 + 프롬프트 조합

이번에는 위의 포즈 이미지를 활용하여 이미지를 생성해 봅시다. 이번에는 전신 포즈, 스켈렉톤 이미지 2개와 프롬프트를 추가합니다.

> 첨부된 포즈 스켈레톤 구조를 참고하여 캐릭터 시트를 그려줘.상단의 3개 전신 포즈(정면, 측면, 정면)를 따라 캐릭터의 턴어라운드를 배치해줘.
> 배경: 순백색스켈레톤의 관절 위치와 비율을 정확히 따라가되,캐릭터의 디테일은 풍부하게 표현해줘. 1:1비율, 하단에 컬러 팔레트 바.

[image](notion-asset://redacted-temporary-url)

### 비교: 스켈레톤 없을 때 vs 있을 때

| 스켈레톤 없을 때 | 스켈레톤 참조 |
| --- | --- |
| AI가 포즈를 자유롭게 해석 | 지정된 포즈 구조를 따름 |
| 각도 배치가 들쭉날쭉 | 일관된 배치와 비율 |
| 운에 의존 | 의도한 결과에 가까움 |

### 이런 것도 됩니다: 손그림 스케치

"전문 도구가 없어도 됩니다. 막대 인간이면 충분합니다."

Gemini는 이런 **손으로 대충 그린 스케치**도 포즈 참조로 이해합니다:

<!-- unsupported Notion block: column_list -->
<!-- unsupported Notion block: column -->
[image: 간단하게 만든 퍼펫 포즈](notion-asset://redacted-temporary-url)

<!-- unsupported Notion block: column -->
| 이 그림의 정보 | AI가 읽어내는 것 |
| --- | --- |
| 앉아있는 자세 | 하체 구부림, 상체 각도 |
| 한 손 내밀기 | 팔 방향과 손 위치 |
| 옆모습 | 카메라 앵글 (측면) |

### 실습: 손그림 + 프롬프트

> [손그림 스케치 첨부] + 이 캐릭터를 첨부한 포즈 데이터를 활용하여 포즈를 변경해줘. 자세와 방향을 따라가되, 캐릭터의 디테일은 풍부하게 표현해줘

[image](notion-asset://redacted-temporary-url)

### 왜 이게 중요한가?

| 장점 | 설명 |
| --- | --- |
| **즉석에서 가능** | 종이에 10초 만에 그려서 사진 찍으면 끝 |
| **정확한 의도 전달** | "이런 포즈"를 말로 설명하는 것보다 빠름 |
| **전문 도구 불필요** | ControlNet 스켈레톤 추출 과정 생략 |
| **창의적 자유** | 존재하지 않는 포즈도 직접 만들어서 참조 가능 |

### 응용 1: 애니메이션 실사화

**목표:** 2D 캐릭터를 실사 영화 주연 배우처럼

### 수정할 3가지 레이어

| 레이어 | 내용 |
| --- | --- |
| **Subject** | 시트의 캐릭터, 실사 버전, 어깨 위 클로즈업 |
| **Style** | Photorealistic, RAW photo, shot on Sony A7IV |
| **Details** | Skin pores, eye veins, individual hair strands |

### 프롬프트 템플릿

> [캐릭터 시트 첨부] + Photorealistic portrait, RAW photo, shot on Sony A7IV.

Subject: The character from the attached sheet, 
reimagined as a real person for a live-action film.
Maintaining exact facial structure from reference.

CRITICAL: Keep the facial features exactly the same as the reference.

Style: Cinematic color grade, film emulation (Kodak Portra 400),
lifted shadows, natural skin tones.

Details: Visible skin texture and pores, subtle eye veins,
individual hair strands catching light, 
[시트의 특징 - 흉터/점 위치 명시].

Composition: Head and shoulders portrait, centered, slight 3/4 angle.
Camera: 85mm portrait lens, f/1.4, eye-level, sharp focus on eyes.
Lighting: Golden hour from camera-left, subtle hair rim light.
Background: Blurred natural bokeh, warm tones.

### 🔑 Secret Keywords

| Keyword | 효과 |
| --- | --- |
| `RAW photo` | AI 과보정을 줄이고 자연스러운 톤 |
| `Skin pores` | 피부 질감 디테일 강제 |
| `Kodak Portra 400` | 특정 필름 색감 레퍼런스 |

### 응용 2 : 공간 디오라마 (Floating Island)

**목표:** 캐릭터가 사는 세계를 미니어처 섬으로 시각화

### 수정할 3가지 레이어

| 레이어 | 내용 |
| --- | --- |
| **Subject** | 시트의 캐릭터 + 떠다니는 섬 + 소품들 |
| **Style** | 3D render, miniature diorama, cozy fantasy |
| **Details** | Tiny props, grass texture, floating particles |

> [캐릭터 시트 첨부] + 3D isometric floating island diorama, miniature world.
> Subject: The character from the attached sheet 

> standing on a small floating island.
> The island contains: [캐릭터에 맞는 소품 - 예: 훈련용 더미, 무기 거치대, 작은 모닥불].

> CRITICAL: Character's face must match the reference exactly.

> Style: 3D rendered diorama, Blender/Octane aesthetic, miniature model feel, tilt-shift photography effect.

> Details: Individual grass blades, moss on stones,
> floating dust particles in light beams,
> [캐릭터 특징 - 흉터, 귀걸이 등 유지].

> Composition: 45° isometric angle, full island visible. 
> Camera: Tilt-shift effect, sharp center with soft edges.
> Lighting: Golden hour from top-left, ambient occlusion.
> Background: Gradient sky, distant floating islands.

### 응용 3: 시네마틱 캔디드

**목표:** 영화 속 한 장면처럼 서사가 느껴지는 순간 포착

### 핵심 철학

AI는 완벽한 대칭과 매끈한 피부를 잘 그리지만, 사람의 마음을 움직이는 것은 '결핍'과 '찰나'의 불완전함입니다. AI에게 '잘 그려라'라고 명령하는 대신, **'실수하고 흔들려라'고 명령**하여 생동감을 불어넣습니다.

### 수정할 3가지 레이어

| 레이어 | 내용 |
| --- | --- |
| **Subject** | 시트의 캐릭터, 동작 중, 카메라 안 봄 |
| **Style** | Cinematic still, film grain, Sakuga quality |
| **Details** | Motion blur, rain/wind effects, imperfection |

### 프롬프트 템플릿

> [캐릭터 시트 첨부] + Cinematic candid shot, film still, Sakuga quality.

Subject: The character from the attached sheet,
[동작 설명 - 예: running through rain, mid-stride],
caught mid-action, unposed, looking away from camera.
Expression: [감정 - 예: determined, slightly worried].

CRITICAL: Keep facial features exactly the same as reference.

Style: Film grain (ISO 800), subtle chromatic aberration,
cinematic 2.39:1 aspect ratio, handheld camera feel.

Details: Motion blur on moving limbs, 
[환경 효과 - rain droplets, wind in hair],
[캐릭터 특징 유지 - 흉터, 귀걸이],
imperfect framing.

Composition: Rule of thirds, character off-center, 
motion direction toward negative space.
Camera: 35mm, f/1.8, slight dutch angle (7°), handheld shake.
Lighting: Neon city lights, wet pavement reflections, rim light.

NOT: Perfect skin, symmetrical pose, looking at camera, 
studio lighting, static pose, clean environment.

### 🔑 Secret Keywords (확장)

| Keyword | 효과 |
| --- | --- |
| `Sakuga` | 일본 애니메이션 역동적 작화 품질 |
| `Unposed` | 포즈 취하지 않은 자연스러운 순간 |
| `Looking away from camera` | AI 기본값(정면 응시) 깨기 |
| `Caught mid-action` | 동작 중간 포착 느낌 |
| `handheld shake` | 완벽한 안정감을 깨고 현장감 추가 |
| `chromatic aberration` | 렌즈 색수차 — 실제 카메라 느낌 |

> 팁: AI는 기본적으로 카메라를 정면 응시하려 합니다.
"시선을 돌리는 것"만으로 AI 특유의 인위적 느낌이 80% 사라집니다

> Gemini에서 스켈레톤을 "참조"할 수는 있지만, ComfyUI + ControlNet처럼 "정밀하게 따라가지는" 못합니다. 편하지만 한계가 있는거죠. 

> "Keep the facial features exactly the same as the reference"
(얼굴 특징은 레퍼런스와 정확히 동일하게 유지해줘)

## Step 2. 캐릭터 기억시키기 (Identity Anchoring)

### 핵심 개념

Gemini는 **같은 대화 세션 내에서** 이미지를 기억할 수 있습니다. 이것을 **Identity Anchoring(아이덴티티 앵커링)**이라고 부릅니다.

<!-- unsupported Notion block: column_list -->
<!-- unsupported Notion block: column -->
[image: #A](notion-asset://redacted-temporary-url)

<!-- unsupported Notion block: column -->
[image: #B](notion-asset://redacted-temporary-url)

여기 2개의 캐릭터가 있습니다. 캐릭터 시트는 아니지만 테스트를 위해 귀멸의 칼날 캐릭터 2개를 사용해 보도록 하겠습니다.  각각의 캐릭터는 #를 통해 A와 B로 설정되어 있습니다. (바꿀 수 있습니다.)

이를 앵커링하기 위해 다음과 같은 프롬프트를 사용합니다. 

- 첫번째 이미지를 첨부하며 다음과 같이 프롬프트를 같이 제출합니다. 

> 이 이미지를 #A라고 기억해

- 두번째 이미지도 마찬가지로 프롬프트와 같이 제출합니다. 

> 이 이미지를 #B라고 기억해

이렇게 한 후 아래와 같은 스켈렉톤 스케치를 만든 후 다음과 같이 프롬프팅합니다.

[image](notion-asset://redacted-temporary-url)

> 왼쪽 빨간색 스켈렉톤에 #A 캐릭터를 배치하고 오른쪽 파란색 스켈렉톤에 #B를 배치해줘

[image](notion-asset://redacted-temporary-url)

> 
> #### 중요: 이미지가 변하기 전에 시트를 첨부하세요

> AI는 대화가 길어지면 이전 이미지를 '추상적'으로 기억합니다."기억해"라고 했더라도, 5번째 요청쯤 되면 얼굴이 슬슬 바뀌기 시작합니다.

> **가장 확실한 방법: 매번 캐릭터 시트를 함께 첨부하세요.**

## 최종 실습: 웹툰 한 페이지 만들기

지금까지 배운 모든 것을 종합합니다:

- ✅ 캐릭터 시트 제작

- ✅ 캐릭터 기억 (Identity Anchoring)

- ✅ 스타일 변주

이제 **두 캐릭터가 등장하는 웹툰 한 페이지**를 만듭니다.

---

### 프레임 레이아웃 시스템

웹툰도 포즈 스켈레톤처럼 **시각적 가이드**를 줄 수 있습니다.

[image: Frame layout](notion-asset://redacted-temporary-url)

재미를 위한 웹툰같은 경우 위의 이미지를 넣어서 만들 수 있습니다. 

> 예제 프롬프트:
> #A를 빨간색 원에 #B를 파란색 원에 배치하여 웹툰을 만들어줘.

> 내용은 서로 전투를 하는 장면으로 제작해줘.

> 다이나믹한 포즈로 전투를 하도록 구성해줘.

위의 프롬프트를 좀 더 다양하게 구성해서 본인만의 웹툰을 만들어 보세요.

### 이전 글
[image](notion-asset://redacted-temporary-url)

위의 워크플로우 테스트를 위한 샘플 파일들 

> Comfy에서는 위의 포즈데이터가 정확하게 출력되지만, 다른 생성형ai에서는 자신들만의 훈련된 데이터가 다르기 때문에 의도치 않은 결과가 출력될 수 있습니다. 오류가 아니니 참고하시기 바랍니다.

<!-- unsupported Notion block: column_list -->
<!-- unsupported Notion block: column -->


<!-- unsupported Notion block: column -->
