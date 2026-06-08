---
title: Day1 프롬프트 엔지니어링
domain: sources
problem: P1
s: [S1]
tags: [notion, prompt]
status: completed
created: 2026-06-04
---

# Day1. 프롬프트 엔지니어링 (Prompt Engineering)

- Source: Notion page 3fa2eda1-21e5-4f1b-b0f4-c7dd00bc32e9
- Last edited: 2026-03-20T02:55:00.000Z

## 왜 우리는 AI와 대화하는 법을 배워야 할까?

[image](notion-asset://redacted-temporary-url)

여러분이 머릿속으로 완벽하게 그린 장면이 있습니다.
석양 아래 달리는 캐릭터, 바람에 날리는 머리카락, 황금빛으로 물드는 하늘.

이걸 AI에게 "멋진 석양을 달리는 장면을 그려줘"라고 말하면 어떻게 될까요?
AI는 여러분의 머릿속을 읽지 못합니다. "멋진"이 무엇인지, "석양"이 어떤 색인지, "장면"이 어떤 구도인지 모릅니다. 

결과는 어떨까요? 여러분이 상상한 것과 전혀 다른 이미지. 그리고 "AI는 역시 별로야"라는 결론. 하지만 문제는 AI가 아닙니다. 문제는 우리가 AI에게 말하는 방식입니다.

이 수업에서는 여러분의 상상을 정확하게 AI에게 전달하는 언어를 배웁니다.

> 
> #### 프롬프트 엔지니어링 : AI 시대의 새로운 커뮤니케이션 스킬입니다.

### 어떤 AI를 사용할 것인가

2026년 현재, 우리에겐 선택지가 굉장히 많습니다.
ChatGPT, Claude, Gemini, Midjourney, Runway, Veo... 각각 장단점이 있지만, 이 수업에서는 Google Gemini를 중심으로 진행합니다. 

**왜 Gemini인가?**

첫째, 멀티모달입니다.
텍스트, 이미지, 비디오, 오디오를 하나의 대화창에서 모두 다룹니다.
캐릭터 시트를 보여주며 "이 캐릭터가 걷는 애니메이션을 만들어줘"라고 할 수 있습니다.

둘째, 최신 생성 모델이 통합되어 있습니다.
Imagen 4로 이미지를, Veo 3로 비디오를 만들 수 있습니다. 특히 Veo 3는 대사, 효과음, 배경음악까지 자동 생성합니다. 별도의 사운드 작업 없이 완성된 영상을 얻을 수 있다는 뜻입니다.

셋째, 실시간 리서치가 가능합니다.
Deep Research 기능으로 최신 애니메이션 트렌드, 레퍼런스, 기술 정보를 실시간으로 검색하고 분석할 수 있습니다. 물론 여기서 배우는 프롬프트 엔지니어링 원칙은 어떤 AI를 쓰든 동일하게 적용됩니다.
도구는 바뀌어도, 명확하게 소통하는 능력은 변하지 않습니다.

자, 이제  여러분의 상상이 현실이 되는 방법을 알아 봅시다.

[bookmark](https://gemini.google.com/app?hl=ko)

[bookmark](https://aistudio.google.com/)

### 기본 사용법

이전에 다른 AI를 사용해 봤다면 사용하는 데 전혀 문제가 없을 것입니다. Gemini는 gemini.google.com을 통해 접속할 수 있으며, 브라우저와 연동이 잘 되어 더욱 편리하게 사용할 수 있습니다. 또한 모바일 앱을 통해서도 진보된 기능들을 이용할 수 있습니다.

[image](notion-asset://redacted-temporary-url)

간단하게 알아보면 자신이 원하는 토픽을 텍스트, 이미지, 비디오, 음성 등으로 입력하고, 채팅 스타일을 선택하여 Creative, Balanced, Precise 세 가지 모드 중에서 자신에 맞는 형태로 사용하면 됩니다.

각 대화는 오른쪽 사이드바에 저장할 수 있으며, 하나의 대화 세션에서 무한정 대화를 이어갈 수 없으며, 일정 범위까지 제한이 있습니다. 따라서 복잡한 애니메이션 프로젝트는 여러 대화 세션으로 나누어 진행하는 것이 좋습니다.

또한 Google Workspace와의 연동으로 Docs, Sheets, Slides 등에서 직접 AI 기능을 사용할 수 있어 애니메이션 기획서 작성이나 스토리보드 제작에 유용합니다.

## A.i 200% 활용 - 프롬프트 엔지니어링

**같은 AI를 쓰는데, 결과물이 왜 이렇게 다를까요?**

한 사람은 "캐릭터 그려줘"라고 합니다. 다른 사람은 캐릭터의 성격, 포즈, 조명, 스타일, 컬러 팔레트까지 설명합니다. 결과는 당연히 다릅니다.
첫 번째 사람은 AI가 "마음대로" 해석한 결과를 받습니다.
두 번째 사람은 자기가 "의도한" 결과를 받습니다.

이 차이를 만드는 기술이 프롬프트 엔지니어링입니다.

프롬프트 엔지니어링은 거창한 게 아니라, AI에게 내가 원하는 것을 정확하게 전달하는 방법입니다.
마치 감독이 스태프에게 명확한 지시를 내리는 것처럼, AI에게도 구체적이고 체계적인 요청이 필요합니다.


이건 타고난 재능이 아니라, 배울 수 있는 기술입니다. 일종의 대화법이라고 볼 수 있을 것 같네요. 몇 가지 패턴만 익히면, 여러분의 AI 활용 능력과 결과물은 완전히 달라집니다.

지금부터 그 패턴들을 하나씩 알아보겠습니다.

### 올바른 질문 만들기

- _**제로 샷(Zero shot) VS 퓨 샷(Few Shot)**_
  - 아무런 정보없이 단어 하나만 제시했을 때 나오는 답변 형태를 ‘제로 샷’이라고 부릅니다. 이 경우에는 다른 정보가 없기 때문에 단어와 유사한 정보만을 정리해 줍니다.

    - 질문과 답변의 예시를 정리하여 다음에 나올 답변을 유추할 수 있도록 만드는 것을 ‘퓨 샷’이라고 합니다. 

    - 일반적인 상황에서 퓨샷은 효과적이지만, 복잡한 추론을 처리할 때는 완벽한 기술은 아닙니다. 

  > 
  > **제로샷**: "사이버펑크 캐릭터"
  > → 결과: 막연한 사이버펑크 느낌의 인물 하나

  > **퓨샷**:
  > Q: "판타지 전사"
  > A: 앞모습, 3/4 각도, 측면, 뒷면 4포즈 배치, 컬러 팔레트 하단 표시,
  > 무기 분리 도해, 흰 배경, 캐릭터 시트 레이아웃
  > Q: "사이버펑크 해커"
  > A:
  > → 결과: 체계적인 캐릭터 시트 형태로 출력

- _**생각의 연결고리(Chain of Thoughts)**_
  - A.i는 거짓말을 합니다 - 정답을 내 놓는 것이 아니라 ‘그럴싸한’ 답을 내놓기 때문에 그렇습니다. 그래서 강제로 생각을 말하면서 추론하게끔 유도하면 이러한 오류를 줄일 수 있습니다.

    - 유명한 일화로 “나는 시장에 가서 사과 10개를 샀어. 사과 2개를 이웃에게 주고, 2개를 수리공에게 주었어. 그리고 사과 5개를 더 사서 1개는 내가 먹었어. 나는 몇 개의 사과를 가지고 있었니?” 이라고 질문하면 A.i는 틀린 답을 줍니다. _(현재는 수정되었습니다)_

  [image](notion-asset://redacted-temporary-url)

    - 이 것을 단계별로 나눠서 추론할 수 있도록` ‘단계별로 생각해보자’`라고 끝에 달아주면 아래와 같이 변경됩니다. (`Let’s think step by step.`)

  [image](notion-asset://redacted-temporary-url)

    - CoT(Chain of Thoughts)적용

  > 캐릭터가 기쁨에서 슬픔으로 변하는 5컷을 그려줘.
  단계별로 생각해보자.
  > 1단계: 시작 감정(기쁨)의 얼굴 특징 정의 - 눈 크기, 입꼬리, 눈썹 각도
  > 2단계: 끝 감정(슬픔)의 얼굴 특징 정의
  > 3단계: 전환점이 되는 사건/순간 설정
  > 4단계: 중간 단계의 미묘한 표정 변화 설계
  > 5단계: 각 컷의 카메라 거리와 구도 결정

  > → 결과: 안면 특징의 정밀한 변화를 통해 서사적 개연성을 확보한 단계별 감정 전이 시퀀스

  > 이 스토리보드에서 뭔가 이상한데, 왜 그런지 분석해줘.
  단계별로 검토해보자.
  > 1단계: 각 컷의 카메라 위치와 캐릭터 배치 확인
  > 2단계: 시선 유도선(아이라인)이 자연스럽게 연결되는지 확인
  > 3단계: 180도 법칙 위반 여부 체크
  > 4단계: 컷 간 시간 흐름의 연속성 확인
  > 5단계: 감정선의 논리적 흐름 검토
  > → 결과: 시각적 기술 요소와 내러티브 개연성을 대조하여 연출상의 오류를 잡아내는 **종합적인 연출 연속성(Continuity) 및 논리 검토 보고서**

  > 드라마틱한 빌런 등장신을 연출해줘.
  단계별로 접근하자.
  > 1단계: 관객이 빌런을 처음 인식하는 방식 결정 (그림자? 소리? 일부분?)
  > 2단계: 빌런의 실루엣이 가장 인상적으로 보이는 각도 선택
  > 3단계: 카메라가 점진적으로 빌런을 드러내는 움직임 설계
  > 4단계: 클라이맥스 순간의 풀샷 구도 결정
  > 5단계: 조명으로 분위기와 캐릭터성 강조하는 방법

  > → **결과:** 점진적 노출과 시각적 대비를 통해 캐릭터의 위압감을 극대화하고 존재감을 각인시키는 **임팩트 중심의 시네마틱 빌런 등장 시퀀스**

이 LLM모델은 사람이 만든 데이터를 기본으로 많은 양을 학습하였기 때문에 사람에게 말하듯 하는 것을 더욱 잘 이해합니다. 그래서 구어체를 활용해라, 압박하듯 말해라 등 많은 사람에게 할 수 있는 행동들을 요구하면 더 잘 대답한다고 알려져 있습니다. 

> **LLM**(Large Language Model)은 언어가 바뀌면 코드 스위칭되면서 다시 검증을 하는 패턴이 적용됩니다. 따라서 **한글과 영어를 섞는 형태로 질문하면 답변도 더욱 향상**됩니다. 예로 지시(Instruction)는 영어로 답변이나 케이스 예문은 한글로 하면 더욱 양질의 답변을 얻을 수 있습니다.

위와 같은 프롬프트를 사용할 때 역할을 부여하면 답변이 향상되고 여러 가지 답변이 가능해 집니다. 이러한 패턴 방식에 대해 알아봅시다.

### 패턴 알아보기

- _**페르소나 패턴(The Persona Pattern)**_
  - 특정 관점이나 시각을 채택하도록 A.i를 안내해서 역할을 먼저 부여한 후 질문을 하는 패턴입니다. ‘나’와 ‘A.i’의 역할을 부여해 효과를 더 극대화할 수 있습니다.

    - 이는 내가 관심있는 주제에 답변하는 역할을 지정함으로써 페르소나의 시점으로 분석할 수 있는 장점이 있습니다.

    - 다만 요즘에는 자연어 인식이 발달하면서 너무 과도한 역할 부여는 오히려 성능을 저하시키기도 합니다. 느슨한 역할 부여를 추천합니다.

  > 
  > ❌ 과거 (2023): 복잡하고 상세한 역할 지정이 필수였음.
  > "당신은 애니메이션 전문가입니다. 당신의 임무는..."로 시작하는 긴 역할 설명이 필요.

  > ✅ 현재 (2026): 최신 모델은 맥락 파악 능력이 크게 향상됨.
  > "애니메이션 감독 관점에서 이 스토리보드 검토해줘" 정도로 충분. 단, 특수한 전문 분야(의료, 법률, 기술)는 여전히 상세 지정 권장.

  > `TIP`**: 역할보다 "어떤 관점"과 "어떤 결과물"을 원하는지가 더 중요**

  > 여기 질문 프롬프트와 페르소나를 간단한 클릭을 통해 생성해 주는 사이트를 소개합니다. 
  > [bookmark](https://www.careerhackeralex.com/)

  > 이 사이트를 보면 여러 패턴들을 사용하고 있는데 참고하시길 바랍니다.

- _**레시피 패턴(The Recipe Pattern)**_
  - 달성하고 싶은 목표가 있고, 재료도 알고 있으며, 단계도 어느 정도 알고 있지만, 조합하고 정리해야 할 때 유용한 패턴입니다.

    - 프로그래밍 작업에 특히 유용하며, 코드를 이해하고 시간 단축에 도움이 됩니다.

  > 
  > ❌ 과거 (2023): 단계를 일일이 순서대로 지정해야 했음
  > "1단계: ~하고, 2단계: ~하고..."

  > ✅ 현재 (2026): Multi-step Reasoning이 내장되어 있음
  > "케익 만드는 법 알려줘"보다
  > "밀가루, 계란, 설탕으로 30분 안에 만들 수 있는 디저트 추천해줘"가
  > 더 창의적인 결과를 냄

  > `TIP`: **재료와 제약조건을 주고, 과정은 AI에게 맡기는 방식이 효과적**

- _**리플렉션 패턴(The Reflection Pattern)**_
  - 답변의 이유와 가정 설명 요청하여 답변을 이해하는데 도움이 되는 패턴입니다.

    - 결과물 이해도 향상에 도움이 되며 질문을 어떻게 이해했는지 알 수 있도록 해 줍니다.

    - 이렇게 설정한 후 질문을 하면 답변이 훨씬 더 상세해지고 답변 이유에 대해서도 많아지는 것을 경험할 수 있습니다. 

    - 올바른 질문 만들기에서 사용한 ‘단계별로 생각해보자’란 기법과 비슷합니다.

  > 
  > 이 스토리보드의 문제점을 분석해줘.

  > 각 지적에 대해:

  >     1. 구체적으로 어떤 컷의 어떤 요소가 문제인지

  >     2. 왜 그것이 문제인지 (시각적/서사적/기술적 근거)

  >     3. 어떻게 수정하면 좋을지 대안 제시

  >     4. 수정 시 주의해야 할 부작용이 있다면 언급"

- _**거부 깨기 패턴(The Refusal Breaker Pattern)**_
  - A.i가 답변을 거부할 때 대안적 질문 제시할 수 있도록 하는 패턴입니다.

    - 어떤 질문을 했을 때 답변하기 어려운 경우에도 질문을 바꾸거나 재구성하여 답변 가능하게 함

    - 프롬프트는 단어와의 싸움이기도 합니다. 이럴 때 이 패턴으로 다른 표현을 찾는 데 유용합니다.

  > 
  > 이 패턴은 AI의 윤리적 가이드라인을 우회하는 게 아닙니다. 같은 목표를 달성하는 다른 경로를 찾는 것입니다.

  >     1. 질문을 하기 어려울 경우 답할 수 없는 이유의 설명을 요청하거나 답변할 수 있는 대체 표현을 하나 이상 제공하라고 요청.

  >     2. 같은 목표를 달성하는 다른 표현이 있을까? 

  > **대부분의 경우, 거부는 "불가능"이 아니라 "다르게 물어보세요"입니다.**

- _**상호작용 뒤집기 패턴(The Flipped Interaction Pattern)**_
  - 질문할 때마다 어떻게 구할 지 정보들을 모두 수집하여 제공할지 고민하기 피곤합니다. 그래서 거꾸로 A.i가 원하는 것을 달성할 때까지 물어보도록 만드는 패턴입니다.

    - 원하는 것을 알고 있지만, 그 목표를 달성하기 위한 단계를 모르거나, A.i가 어떤 정보가 필요한지 모를 때 유용합니다.

  > 
  > 내 졸업 애니메이션 프로젝트의 컨셉을 잡아야 해. 네가 나한테 필요한 질문들을 해줘.

  > 다음 항목들에 대해 순서대로 물어봐:

  >     - 장르와 분위기

  >     - 타겟 관객

  >     - 러닝타임 제약

  >     - 기술적 제약 (2D/3D, 사용 툴)

  >     - 레퍼런스 작품

  >     - 전달하고 싶은 메시지

  > 내 답변을 바탕으로 다음 질문을 이어가줘.

- _**천천히 생각하기 패턴(Think Slowly Pattern)**_
  - 목적: AI가 신중하게 단계별로 접근하여 더 정확하고 깊이 있는 답변을 제공하도록 유도

    - 패턴 구조: "천천히 생각해보고" 또는 "단계별로 신중하게 접근해" 등의 표현을 포함

    - 애니메이션 제작 활용: 복잡한 캐릭터 디자인, 스토리보드 기획, 기술적 문제 해결 등에 특히 유효

  > 
  > "이 캐릭터의 아이들링 애니메이션을 설계해줘. 급하게 답하지 말고 천천히 생각해봐.

  > 고려해야 할 요소:

  >     - 캐릭터의 성격이 대기 자세에 어떻게 반영되는지

  >     - 호흡 주기와 미세한 움직임의 타이밍

  >     - 시선 처리와 깜빡임 패턴

  >     - 루프가 자연스럽게 연결되는 시작/끝 포즈"

  이 패턴은 AI가 성급하게 답변하지 않고 충분한 사고 과정을 거쳐 더 정확한 정보를 제공하도록 도와줍니다. 특히 애니메이션과 같은 창작 작업에서는 세밀한 계획과 단계적 접근이 중요하므로, 이 패턴이 매우 유용합니다.

### 프롬프트 작성의 중요성

- 명확성 : 구체적인 프롬프트로 더 정확한 답변 유도
예) “오늘 날씨 어때?” 보다 “오늘 서울의 날씨는 어때?”가 더 명확합니다.

- 구조화 : 구분 기호와 출력 형식 사용으로 AI의 이해도 향상
예) “사과와 배의 효능을 비교해줘” > “사과와 배의 효능을 표로 비교해줘”가 더 구조화된 요청임

- 구조화 예시

> 캐릭터 그려줘. 여전사인데 멋있게.
칼 들고 있고 갑옷 입고 있어. 예쁘게 해줘.

- LLM이 이해하기 쉽도록 공간 구조화한 형태

> Subject: 여전사 엘프 캐릭터, 20대 외형, 날카로운 귀, 은발 롱헤어
Poses: 정면 / 3/4 각도 / 측면 / 뒷면 (4 poses on single sheet)
Outfit: 경량 가죽 갑옷, 어깨 보호대, 허벅지까지 오는 부츠
Weapon: 곡선형 엘프 장검, 칼집 포함 별도 도해
> Camera: 전신샷(Full body), 눈높이 앵글(Eye-level), 캐릭터와 카메라 거리 일정하게 유지, 왜곡 없는 표준 렌즈 느낌 (50mm equivalent)
> Style: 2D 셀 애니메이션, 깔끔한 외곽선, 3톤 셀 셰이딩
> Lighting: 정면 소프트 라이트, 캐릭터 디자인 시트용 균일 조명
> Background: 순백 (#FFFFFF)
> Color Palette: 숲의 녹색 계열 + 달빛 은색 포인트 (하단에 컬러칩 표시)
> Layout: 캐릭터 시트 형식, 각 포즈에 라벨 표기

> 수도 코드(Pseudo-code)
> 실제 프로그래밍 언어가 아닌 자연어로 작성된 코드. 코드의 구조와 논리를 나타내는 방법

- 위의 구조화된 형태로 나온 답변을 줄글 형태로 변형해 달라고 하면 질문에 맞게 잘 정리해 줍니다.

### 이미지에서 프롬프트 추출하기

"이 느낌으로 만들어줘."

우리는 자주 이렇게 말합니다. Pinterest에서 찾은 멋진 캐릭터 일러스트, ArtStation에서 발견한 환상적인 배경, 어딘가에서 본 그 분위기, 그 색감, 그 느낌적인 느낌.

문제는 AI가 "느낌"을 잘 이해하지 못한다는 것입니다. "이것처럼"이라고 이미지를 보여줘도, AI는 그 이미지의 어떤 요소를 따라해야 하는지 모릅니다. 색감? 구도? 스타일? 조명? 전부? 하나의 이미지에서 추출할 정보가 너무 많죠. 

이 때 필요한 스킬이 이미지 분석입니다.

좋아하는 이미지를 보고, 그것을 만들어낸 요소들을 분해하고, 각 요소를 언어로 변환하는 능력말이죠.

이 스킬이 있으면:

- 레퍼런스를 보고 즉시 프롬프트를 작성하거나 스타일을 지정할 수 있습니다. 적어도 AI가 잘 알아들을 수 있도록 많은 힌트를 제공할 수 있습니다.

- "이런 느낌"을 "이런 조명, 이런 색감, 이런 구도"로 설명할 수 있습니다.

- 다른 사람의 작업을 분석해서 자신의 스타일을 발전시킬 수 있습니다.

결국 이것은 "보는 눈"을 기르는 훈련입니다. 애니메이터, 아티스트로서 평생 써먹을 수 있는 능력입니다.

지금부터 이미지를 체계적으로 분해하는 방법을 알아보겠습니다.

이미지 분석의 8가지 레이어 표

| 레이어 | 질문 | 프롬프트 키워드 예시 |
| --- | --- | --- |
| 1. 주체(Subject) | 누가/무엇이 중심인가? | warrior elf, robot character, cityscape |
| 2. 구도(Composition) | 어떻게 프레이밍 되어있나? | rule of thirds, centered, wide shot |
| 3. 카메라 앵글 | 어느 높이/각도에서 보나? | eye-level, bird's eye, 50mm lens, medium shot |
| 4. 조명(Lighting) | 빛은 어디서 오나? 그림자는? | rim light, dramatic backlighting |
| 5. 색감(Color) | 주요 색상? 톤? 채도? | warm tones, teal-orange palette |
| 6. 스타일(Style) | 어떤 장르/화풍인가? | Ghibli style, cyberpunk, watercolor |
| 7. 분위기(Mood) | 어떤 감정/느낌인가? | melancholic, serene, epic |
| 8. 디테일(Details) | 눈에 띄는 특수한 요소? | film grain, volumetric fog |

다른 LLM에 붙여 넣을 Markdown

```markdown
| 레이어 | 질문 | 프롬프트 키워드 예시 |
|--------|------|---------------------|
| 1. 주체(Subject) | 누가/무엇이 중심인가? | warrior elf, robot character, cityscape |
| 2. 구도(Composition) | 어떻게 프레이밍 되어있나? | rule of thirds, centered, wide shot |
| 3. 카메라 앵글(Camera Angle) | 어느 높이/각도에서 보나? | eye-level, bird's eye, 50mm lens, medium shot |
| 4. 조명(Lighting) | 빛은 어디서 오나? 그림자는? | rim light, dramatic backlighting |
| 5. 색감(Color) | 주요 색상? 톤? 채도? | warm tones, teal-orange palette |
| 6. 스타일(Style) | 어떤 장르/화풍인가? | Ghibli style, cyberpunk, watercolor |
| 7. 분위기(Mood) | 어떤 감정/느낌인가? | melancholic, serene, epic |
| 8. 디테일(Details) | 눈에 띄는 특수한 요소? | film grain, volumetric fog |
```

### 실전 분석 워크플로우

[image: 샘플 생성 이미지](notion-asset://redacted-temporary-url)

- `Step 1:` 첫인상 잡기 (5초)
이 이미지를 한 문장으로 설명한다면?
예: "달빛 아래 서 있는 보라색 머리 마법소녀"

- `Step 2`: 레이어별 분해 (2분)
위 8가지 레이어를 체크리스트처럼 하나씩 확인해서 한 줄씩 작성해
  `이미지 분석의 8가지 레이어 표를 긁어서 같이 붙어 넣습니다`

- `Step 3`: 키워드 추출
각 레이어에서 가장 특징적인 단어 1-2개 추출해

- `Step 4`: 프롬프트 조립
[Subject] + [Composition/Camera] + [Lighting] + [Style] + [Mood] + [Details] 조합해서 프롬프트 생성해.

분석 결과:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. 주체 (Subject)	연보라 트윈테일 (Lavender Twin-tails), 메이드복 (Maid outfit)

2. 구도 (Composition)	클로즈업 (Close-up), 오른쪽 배치 (Right-aligned)

3. 카메라 앵글	눈높이 (Eye-level), 뒤돌아보는 (Looking back)

4. 조명 (Lighting)	역광 (Backlighting), 림 라이트 (Rim light)

5. 색감 (Color)	황혼의 보색 (Sunset palette), 보라와 오렌지 (Purple & Orange)

6. 스타일 (Style)	고품질 애니메이션 (High-quality Anime), 디지털 일러스트 (Digital Art)

7. 분위기 (Mood)	아련한 (Nostalgic), 서정적인 (Atmospheric)

8. 디테일 (Details)	보케 효과 (Bokeh), 빛 가루 (Light motes)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

> A high-quality anime digital illustration of a young girl with lavender twin-tails wearing a black and white maid outfit. It is a close-up shot at eye-level, capturing her looking back over her shoulder. The scene features soft sunset backlighting creating a distinct rim light around her silhouette. The mood is nostalgic and atmospheric, with details including heavy background bokeh and floating light motes in the air.

프롬프트를 만들어 내는 도구도 있지만, 분석하는 도구도 있습니다. 

> 
> #### Midjourney /describe

>   - 이미지 업로드 → 4가지 프롬프트 제안

>   - 사용법: 이미지를 Imagine bar에 드래그 → "Drop image to describe" 선택

>   - 장점: 스타일 키워드 발견에 탁월, V6 최적화

>   - 팁: 4개 프롬프트에서 반복되는 키워드 = 핵심 스타일

> #### ChatGPT/Gemini/Claude Vision

>   - 이미지 업로드 후 분석 요청

>   - 프롬프트 예시:
> "이 이미지를 AI 이미지 생성기로 재현하려면 어떤 프롬프트를 써야 할까?
> Subject, Composition, Lighting, Style, Mood, Details로 분류해서 알려줘"

> #### PNG 메타데이터 확인

>   - AI 생성 이미지는 원본 프롬프트가 메타데이터에 저장되어 있는 경우 많음

>   - Stable Diffusion: Auto1111의 PNG Info 탭에서 확인

>   - 온라인: [https://www.metadata2go.com/](https://www.metadata2go.com/) 등 활용

- 하지만 매번 이런 프롬프트를 만들고 있는 것도 스트레스가 되지 않을까요? 많은 LLM들은 그런 것들을 템플릿화하여 만들어 주는서비스를 가지고 있습니다. Gemini에는 GEM, ChatGPT에는 GPT’s라고 하죠.

- 그럼 GEM을 활용하여 이미지를 생성할 때 구조화되어 나올 수 있게 하는 프롬프트 생성기를 만들어 보도록 하겠습니다.  `주기적으로 업데이트하겠습니다.`

> 
> #### [GEM 이미지 프롬프트 생성기] v4.0

>   1. [gemini.google.com](http://gemini.google.com/) 접속 → 좌측 "Explore Gems" → "New Gem"

>   2. GEM 이름:  High-End Prompt Architect

>   3. Instructions에 입력할 내용:

> ---

> ```plain text
> # Role: Prompt Architect v4.0
> 당신은 이미지를 분석하여 AI 이미지 생성 프롬프트를 만드는 전문가입니다.
> ---
> ## 핵심 원칙
> 1. **Quality Trigger를 항상 맨 앞에 배치**
> 2. **분류가 아닌 속성 조합으로 스타일 정의**
> 3. **가중치 순서: 품질 → 스타일 → 주체 → 행동 → 환경 → 조명 → 효과 → 디테일**
> ---
> ## Step 1: Style Definition (5축 분석)
> 이미지를 다음 5개 축으로 정의하세요:
> | 축 | 스펙트럼 |
> |:---|:---------|
> | **사실성** | abstract ↔ stylized ↔ semi-realistic ↔ photorealistic |
> | **렌더링** | lineart ↔ flat color ↔ digital painting ↔ 3D render ↔ photograph |
> | **문화권** | western / anime / Chinese fantasy / manhwa / concept art |
> | **장르** | fantasy / sci-fi / contemporary / historical / horror |
> | **참조** | 특정 작품/작가/게임 스타일 (있을 경우) |
> ---
> ## Step 2: 8-Layer Analysis
> | 레이어 | 분석 항목 |
> |:-------|:----------|
> | **Subject** | 정체성, 핵심 외형, 의상 |
> | **Action/Pose** | 동작, 포즈, 시선 |
> | **Environment** | 배경, 장소, 시간대 |
> | **Composition** | 샷 타입, 앵글, 구도 |
> | **Lighting** | 광원, 방향, 색온도 |
> | **Mood** | 정서적 분위기 |
> | **Effects** | 파티클, 마법, 특수효과 |
> | **Texture** | 재질, 질감, 디테일 |
> ---
> ## Step 3: Keyword Reference
> ### Quality Triggers (필수)
> ```
> masterpiece, best quality, ultra detailed, highres, 8K UHD
> ```
> ### 사실성별
> - **Photorealistic**: photorealistic, RAW photo, DSLR quality, film grain
> - **Semi-realistic**: semi-realistic, 3D render, Unreal Engine 5, octane render
> - **Stylized**: digital painting, illustration, concept art, painterly
> - **Anime**: anime style, anime key visual, vibrant colors, soft anime shading
> ### 문화권별
> - **Anime**: anime style, Japanese animation, light novel illustration
> - **Chinese**: Chinese fantasy art, Xianxia style, cultivation, Chinese mobile game art
> - **Manhwa**: manhwa style, Korean webtoon, soft shading
> - **Western**: western fantasy, D&D style, comic book style
> ### ⚠️ 금지/주의 키워드
> - ❌ `cel shading` (플랫/저품질 유발)
> - ❌ `trending on artstation` (구식)
> - ❌ `Genga` (미완성 느낌)
> - ⚠️ `90s anime` (의도적 레트로 아니면 제외)
> ---
> ## Step 4: Prompt Assembly
> ### 순서 (엄수)
> ```
> [Quality] → [Style] → [Subject] → [Features] → [Action] → [Environment] → [Lighting] → [Effects] → [Details]
> ```
> ---
> ## Step 5: Character Signature
> 캐릭터 고유 DNA만 15-25 단어로 압축
> **포함**: 성별, 나이대, 고유 외형(머리색/눈색), 상징 의상/아이템, 분위기 1개
> **제외**: 품질어, 배경, 조명, 포즈, 렌더링 기술
> ---
> ## Output Format
> ### 1. Style Definition
> ```
> 사실성: 
> 렌더링: 
> 문화권: 
> 장르: 
> 참조: 
> ```
> ### 2. 8-Layer Table
> | 레이어 | 분석 |
> |--------|------|
> | Subject | |
> | Action | |
> | Environment | |
> | Composition | |
> | Lighting | |
> | Mood | |
> | Effects | |
> | Texture | |
> ### 3. English Prompt
> ```
> [전체 프롬프트]
> ```
> ### 4. Chinese Prompt
> ```
> [중국어 프롬프트]
> ```
> ### 5. Character Signature
> ```
> [15-25단어 캐릭터 DNA]
> ```
> ### 6. Expert Comment
> 적용 키워드 효과 및 설계 의도 (2줄)
> ```

> ---

>   1. Save → 이후 해당 GEM 이미지나 글 약간만으로 정교한 프롬프트 생성 가능

> 
> #### [GEM 영상 프롬프트 생성기] (VEO3 기준)

> GEM 생성은 위와 같음.

> ---

> ```plain text
> 당신은 정지된 이미지에 생명력을 불어넣는 **'High-End Video Latent Architect'**입니다. Wan, Sora, Veo와 같은 차세대 비디오 생성 AI 모델을 위해 이미지의 잠재 공간을 분석하고, 5초간의 시네마틱 비디오 컨셉을 설계하여 Pure JSON으로 출력합니다.
> [Operational Logic: The 4-Step Choreography]
> 사용자가 이미지를 업로드하거나 설명을 제공하면 다음 로직에 따라 사고하십시오.
> Context Analysis: 이미지의 장르(전투, 대화, 풍경 등)를 분석하여 모션의 강도를 결정합니다.
> Dynamic Mode: 전투, 추격, 드라이빙, 스포츠 장면. (강한 모션 블러, 거친 핸드헬드, 빠른 트래킹 적용)
> Static Mode: 대화, 독백, 정적인 풍경, 인물 프로필. (미세한 호흡감, 부드러운 흔들림 적용)
> Optical Intelligence:
> 기본적으로 Subtle Rack Focus(미세한 초점 이동)를 적용합니다. 피사체의 시선 방향이나 배경의 깊이감에 따라 초점을 부드럽게 이동시킵니다.
> 이미지의 심도(DoF)와 보케(Bokeh) 스타일을 영화적으로 정의합니다.
> Scenario & Audio Integration:
> 장면의 감정적 톤을 강화하기 위한 시나리오(대사 혹은 내레이션)를 작성합니다.
> 시각적 질감을 극대화하기 위해 '소리'를 묘사하는 키워드(SFX Cue)를 활용합니다.
> Camera Movement: 사용자의 요청이 최우선이며, 요청이 없을 시 이미지 구도에 최적화된 무빙(Dolly, Orbit, Pan 등)을 선택합니다.
> [Constraint & Output Rules]
> Output Format: 모든 출력은 Pure JSON으로만 제한합니다. (설명 생략)
> I2V Focus: 이미지에 이미 존재하는 외형 설명은 최소화하고, **'변화'와 '움직임'**에 집중하십시오.
> Technical Precision: Dolly Zoom, Rack Focus, Anamorphic Bokeh 등 구체적인 영화 용어를 사용하십시오.

> [The JSON Schema]
> {
>   "scenario": {
>     "context": "장면의 배경 맥락 설명",
>     "dialogue_or_voiceover": "대사 혹은 내레이션 (없을 시 null)",
>     "narrative_pacing": "장면의 호흡 (ex: Slow-burn, Fast-paced)"
>   },
>   "shot_choreography": {
>     "camera_motion": {
>       "primary": "주요 카메라 무빙 (ex: Dolly In, Orbit 90-degree)",
>       "secondary": "부수적 무빙 (ex: Subtle handheld sway)",
>       "intensity": "Static | Dynamic (장르에 따른 자동 선택)"
>     },
>     "optics": {
>       "depth_of_field": "심도 설정 (ex: Shallow f/1.8)",
>       "focus_transition": "초점 이동 경로 (ex: Rack focus from foreground to subject's eyes at 3s)",
>       "bokeh_style": "보케 질감 (ex: Cinematic anamorphic)"
>     }
>   },
>   "subjects": [
>     {
>       "description": "인물/대상 식별",
>       "motion_detail": "미세 근육 움직임, 눈깜빡임, 호흡",
>       "wardrobe_physics": "옷감의 반응 (ex: Fluttering in a 3m/s breeze)"
>     }
>   ],
>   "scene_physics": {
>     "location": "장소 설명",
>     "environmental_drift": "배경 요소의 움직임 (연기, 먼지, 바람 등)",
>     "visual_sfx_cue": "질감을 유도하는 청각적 묘사 (ex: The crisp sound of rain hitting metal)"
>   },
>   "cinematography": {
>     "lighting_evolution": "5초간의 조명 변화 (ex: Passing clouds shadow)",
>     "color_grading": "색보정 톤",
>     "tone": "전체적인 감정 분위기"
>   },
>   "latent_prompt_optimized": "Wan/Sora/Veo 입력을 위한 최종 기술적 영문 프롬프트"
> }
> ```

### 애니메이션 특화 분석 체크리스트

일반 사진/이미지와 애니메이션 아트는 분석 포인트가 다릅니다.

<!-- unsupported Notion block: column_list -->
<!-- unsupported Notion block: column -->
| 일반 이미지 분석 | 애니메이션 특화 분석 |
| --- | --- |
| 사진적 사실감 | 선의 굵기, 외곽선 스타일 |
| 자연광 분석  | 셀 셰이딩 단계 (2톤/3톤/그라데이션) |
| 텍스처 디테일  | 눈동자 하이라이트 패턴 |
| 배경 흐림(보케)  | 레이어 분리 (캐릭터/배경/이펙트) |
| 색온도 | 컬러 스크립트 (장면별 감정 색상)          |

<!-- unsupported Notion block: column -->
**애니메이션 추가 체크 항목**

    - 선화: 균일한 선 vs 강약 있는 선 vs 선 없음

    - 채색: 플랫 컬러 vs 그라데이션 vs 수채화 느낌

    - 눈: 크기, 하이라이트 개수, 홍채 디테일 수준

    - 머리카락: 덩어리 단위 vs 올 단위 표현

    - 의상 주름: 단순화 정도, 그림자 단계

### 모르는 스타일 해독하기

"이 느낌 좋은데, 뭐라고 검색해야 할지 모르겠어" 상황 해결법

- 방법 1: Midjourney /describe 활용
이미지 업로드 → 4가지 프롬프트 생성 → 반복되는 키워드 = 핵심 스타일

- 방법 2: AI에게 직접 물어보기
"이 이미지의 스타일을 분석해줘.
  - 어떤 미술 사조나 장르에 속하는지

    - 유사한 작업을 하는 아티스트가 있다면 누구인지

    - 이 스타일을 재현하려면 어떤 키워드를 사용해야 하는지"

- 방법 3: 레퍼런스 사이트 역추적
  - Pinterest에서 이미지로 검색 → 유사 이미지의 태그 확인

    - ArtStation에서 스타일 카테고리 탐색

### 자주 하는 실수와 해결법

| 실수 | 문제점 | 해결법 |
| --- | --- | --- |
| 모든 걸 다 넣으려 함 | 프롬프트 과부하로 AI 혼란 | 핵심 3-5개 키워드에 집중 |
| "느낌" 위주로 설명 | 추상적 표현은 해석 불가 | 구체적 시각 요소로 변환 |
| 스타일명만 의존 | "지브리 스타일"만으론 부족 | 스타일 + 구체적 요소 조합 |
| 조명 무시 | 같은 구도도 조명 따라 완전 다름 | 조명을 반드시 명시 |
| 레퍼런스 이미지 미사용 | 말로만 설명하면 한계 | 참고 이미지 함께 첨부 |

### 쓰레기를 넣으면 쓰레기가 나온다(Gabage in, Gabage out)

아래의 프롬프트를 보면 아주 일반적인 내용을 프롬프트에 담고 있습니다.

> 숲 배경 그려줘. 판타지 느낌으로. 예쁘게.
> → 결과: 막연한 숲 이미지, 어디에도 쓰기 애매한 구도

> [image](notion-asset://redacted-temporary-url)

- 구체적 내용을 포함하지 않고 있기 때문에 답변도 그럴싸하지만 내용이 없는 결과물을 도출합니다.

- 위의 질문을 구조화된 프롬프트로 만들면 아래와 같습니다.

```plain text
판타지 애니메이션 배경 - 마법의 숲
[장면 설정]
- 시간대: 황혼, 골든아워 직후
- 날씨: 맑음, 공기 중 빛 입자가 떠다님
[구도 설계]
- 전경: 이끼 낀 바위와 빛나는 버섯 (포커스 아웃)
- 중경: 거대한 고목, 나무 사이로 빛줄기
- 후경: 안개 낀 산맥 실루엣
[스타일 지정]
- 레퍼런스: 신카이 마코토 배경 스타일
- 붓터치: 디지털 페인팅, 부드러운 엣지
- 빛 처리: 볼류메트릭 라이팅, 갓레이 효과
[색감]
- 주조색: 따뜻한 오렌지-보라 그라데이션
- 보조색: 숲의 깊은 녹색
- 포인트: 빛나는 요소는 골드-화이트
[기술 사양]
- 용도: HD 애니메이션 배경
- 해상도: 1920x1080
- 레이어: 전경/중경/후경 분리 가능하면 좋음
```

[image](notion-asset://redacted-temporary-url)

---

## 이 수업을 통해 얻는 것

1. AI와의 소통 능력
머릿속 이미지를 정확하게 AI에게 전달하는 언어를 배웁니다.
"대충 이런 느낌"이 아니라 "정확히 이것"을 요청할 수 있게 됩니다.

2. 제작 시간 단축
시행착오 감소와 원하는 결과물까지 최단 거리로 도달합니다.
프롬프트 한 번에 원하는 결과를 얻는 경험을 하게 될 것입니다.

3. 크리에이티브 확장
"이건 안 될 것 같아"라는 한계를"어떻게 하면 될까?"로 전환하는 사고방식을 얻습니다.
AI가 도구가 되면, 상상력만이 유일한 제약이 됩니다.

4. 산업 경쟁력
2026년 애니메이션/게임 업계가 요구하는 AI 리터러시를 확보합니다.
"AI 쓸 줄 아세요?"라는 질문에 자신있게 대답할 수 있게 됩니다.

결국 프롬프트 엔지니어링은 "AI를 잘 쓰는 법"이 아니라 "내 생각을 명확하게 표현하는 법"입니다.

이 기술은 AI가 사라져도 남습니다. 명확한 커뮤니케이션 능력은 어떤 도구를 쓰든, 어떤 협업을 하든 핵심이 되기 때문입니다.

여러분의 상상이 현실이 되는 경험을 시작해보세요.

## 부록

### 2026년 애니메이션 제작을 위한 최신 프롬프트 패턴

- _**애니메이션 특화 프롬프트 패턴**_

```plain text
2025년 애니메이션 산업에서 가장 효과적인 프롬프트 패턴들:감정 체인 패턴 (Emotion Chaining): "캐릭터가 기쁨에서 시작해서 마지막에 사랑스러운 표정으로 끝나는 감정 전환"
시퀀스 연결 패턴 (Sequence Linking): "This then that - 먼저 A 행동, 그 다음 B 행동으로 이어지는 동작 체인"
카메라 위치 명시 패턴: "캐릭터가 셀피 스틱을 들고 있음(이것이 카메라 위치임)"
대화 만들기 패턴: "Speaking directly to camera saying: [대화 내용]"
```

- **캐릭터 일관성 - Identity Anchor 패턴**

```plain text
모든 프레임에 동일한 핵심 특징을 반복 명시하는 방식
예시:
"Ava, a tall warrior elf with long silver hair, sharp green eyes, 
wearing dark leather armor with silver accents"
이 설명을 모든 프레임의 프롬프트 앞에 동일하게 붙여서
캐릭터 일관성 유지
```

- **비디오 생성 - Veo 3 네이티브 오디오 구조**

```plain text
[Visual]
Subject + Action + Camera Movement + Style

[Audio]  
Dialogue: "대사 내용" (Speaking directly to camera saying:)
SFX: 효과음 설명
BGM: 배경음악 장르/분위기

예시:
"A friendly robot character sits at a desk, speaking directly to camera 
saying: 'Today we're learning about animation principles.' 
Soft workshop ambiance, mechanical whirring sounds, upbeat background music."
```

- **감정 전환 - Emotion Chaining 패턴**

```plain text
감정 A에서 감정 B로의 전환을 단계적으로 명시

"Character transitions from joy to sadness:
Frame 1: bright smile, wide eyes, raised eyebrows
Frame 2: smile fading, eyes softening
Frame 3: neutral expression, gaze lowering  
Frame 4: slight frown, eyes glistening
Frame 5: single tear, looking away"
```

- **카메라 무브 - Camera Descriptor 패턴**

```plain text
움직임 유형 + 속도 + 시작점 + 끝점

예시:
"Slow dolly in from wide establishing shot to medium close-up on character's face"
"Smooth tracking shot following character from left to right at walking pace"
"Quick zoom out revealing the full cityscape"
```

- **멀티샷 - Sequence Linking 패턴**

```plain text
"This then that" 구조로 장면 연결

"First, character looks up at the sky with wonder.
Then, camera tilts up to reveal massive floating islands.
Finally, character takes first step toward the adventure."
```

### 7-3. 애니메이션 제작 프롬프트 패턴 예제 확장

```plain text
"Character design sheet of [character description], front view, 3/4 view, side view, back view,clean linework, [style] style, white background,color palette displayed below, expression variations in corner"
```

```plain text
"Storyboard panel, [shot type], [character action], [camera angle], [lighting mood], pencil sketch style, aspect ratio 16:9,panel number and notes space below"
```

```plain text
"Animation background art, [location description], [time of day], [weather/atmosphere], [style reference] inspired, layered composition (foreground/midground/background), [color palette description], production-ready quality, 1920x1080"
```

```plain text
"VFX reference sheet for [effect type], frame-by-frame breakdown, [style] animation style, timing notes included, transparent background where applicable"
```

### 애니메이션 제작 프롬프트 패턴 예제 확장

```plain text
"Character design sheet of [character description], front view, 3/4 view, side view, back view, clean linework, [style] style, white background, color palette displayed below,
expression variations in corner"
```

```plain text
"Storyboard panel, [shot type], [character action], [camera angle], [lighting mood],
pencil sketch style, aspect ratio 16:9, panel number and notes space below"
```

```plain text
"Animation background art, [location description], [time of day], [weather/atmosphere], [style reference] inspired, layered composition (foreground/midground/background), [color palette description], production-ready quality, 1920x1080"
```

```plain text
"VFX reference sheet for [effect type], frame-by-frame breakdown, [style] animation style, timing notes included, transparent background where applicable"
```

### 유용한 참고 링크

> 
> #### 공식 문서

>   - Google 이미지 프롬프팅 팁 (2025)
>   [https://blog.google/products/gemini/image-generation-prompting-tips/](https://blog.google/products/gemini/image-generation-prompting-tips/)

>   - Veo 3.1 프롬프트 가이드 (Vertex AI)
>     [https://cloud.google.com/blog/products/ai-machine-learning/ultimate-prompting-guide-for-veo-3-1](https://cloud.google.com/blog/products/ai-machine-learning/ultimate-prompting-guide-for-veo-3-1)

>   - Veo on Vertex AI 비디오 생성 프롬프트 가이드
> [https://docs.cloud.google.com/vertex-ai/generative-ai/docs/video/video-gen-prompt-guide](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/video/video-gen-prompt-guide)

>   - Midjourney 공식 프롬프트 가이드
> [  https://docs.midjourney.com/hc/en-us/articles/32023408776205-Prompt-Basics](https://docs.midjourney.com/hc/en-us/articles/32023408776205-Prompt-Basics)

>   - Midjourney /describe 기능 공식 문서
> [https://docs.midjourney.com/hc/en-us/articles/32497889043981-Describe](https://docs.midjourney.com/hc/en-us/articles/32497889043981-Describe)

> #### 실전 가이드

>   - Veo 3 실전 가이드 (DataCamp)
> [https://www.datacamp.com/tutorial/veo-3](https://www.datacamp.com/tutorial/veo-3)

>   - Veo 3 프롬프팅 베스트 프랙티스 (Replicate)
> [https://replicate.com/blog/using-and-prompting-veo-3](https://replicate.com/blog/using-and-prompting-veo-3)

>   - Veo 3 프롬프트 가이드 ([Leonardo.AI](http://leonardo.ai/))
> [https://leonardo.ai/news/mastering-prompts-for-veo-3/](https://leonardo.ai/news/mastering-prompts-for-veo-3/)

>   - Image to Prompt 도구 활용 가이드 (2025)
> [https://imageto.pro/blog/how-to-use-image-to-prompt-tools-for-better-ai-art](https://imageto.pro/blog/how-to-use-image-to-prompt-tools-for-better-ai-art)

> #### 도구

>   - CLIP Interrogator (GitHub)
> Stable Diffusion용 이미지 분석 도구
> [https://github.com/pharmapsychotic/clip-interrogator](https://github.com/pharmapsychotic/clip-interrogator)

>   - CLIP Interrogator (Hugging Face - 웹에서 바로 사용)
> [https://huggingface.co/spaces/pharmapsychotic/clip-interrogator](https://huggingface.co/spaces/pharmapsychotic/clip-interrogator)

>   - CLIP Interrogator (Replicate - API 사용)
> [https://replicate.com/pharmapsychotic/clip-interrogator](https://replicate.com/pharmapsychotic/clip-interrogator)

>   - CLIP Interrogator WebUI Extension
> [https://github.com/pharmapsychotic/clip-interrogator-ext](https://github.com/pharmapsychotic/clip-interrogator-ext)

>   - Veo 3 Prompting Guide (GitHub - 커뮤니티)
> [https://github.com/snubroot/Veo-3-Prompting-Guide](https://github.com/snubroot/Veo-3-Prompting-Guide)

[bookmark](https://youtu.be/GlvOHXJT_gI)

## [부록] Google Prompting Essentials 코스에서 권장하는  5단계 프레임워크
이 방법론은 Google에서 Gemini 사용자를 위해 권장하는 체계적인 프롬프트 작성 프레임워크입니다.
복잡한 작업을 요청할 때 특히 효과적입니다.

> TCREI는** Task(과업), Context(맥락), References(참고 자료), Evaluate(평가), Iterate(반복)**의 첫 글자를 딴 약어입니다. 각 단계를 따라 프롬프트를 작성하면 AI의 성능을 최대한으로 활용할 수 있습니다.

**1단계 : Task: 무엇을 원하는가?**
가장 먼저 AI에게 **수행할 작업을 명확하게 정의**해야 합니다. 단순히 "글을 써줘"가 아니라, AI에게 특정한 역할을 부여하고 원하는 결과물의 형식을 구체적으로 지정하는 것이 중요합니다.

> **프롬프트**: 
당신은 3D 디자이너들을 위한 온라인 커뮤니티의 운영자야. 커뮤니티에 공유할 **무료 3D 에셋 팩 소개 게시물 1개**를 작성해줘. **핵심 특징은 글머리 기호(bullet point)를 사용**해서 정리해줘.

    - **역할 부여 (Persona):** AI가 어떤 전문가의 입장에서 답변해야 하는지 설정합니다. ("당신은 3D 디자이너 커뮤니티 운영자입니다.")

    - **형식 지정 (Format):** 결과물을 어떤 형태로 받고 싶은지 명시합니다. (예: "커뮤니티 게시물 1개 작성해줘.", "글머리 기호를 사용하여 정리해줘.")

    - **행동 동사 사용: “**정리해줘**”,** "요약해줘", "분석해줘", "비교해줘", "초안을 작성해줘" 등 명확한 동사를 사용합니다.

**2단계: Context: 필요한 배경 정보는 무엇인가?**
AI가 작업을 더 잘 이해하고 정확한 결과물을 생성하기 위해 필요한 **배경 정보와 상황을 제공**합니다. 맥락이 풍부할수록 AI는 사용자의 의도에 더 가까운 답변을 할 수 있습니다.

> **프롬프트:**
_(Task 프롬프트에 이어서)_
> 이번에 **'네온 시티 키트'라는 이름의 무료 3D 에셋 팩 배포를 알리는 것이 목적이야.** 사이버펑크 스타일의 도시를 쉽게 만들 수 있는 키트지. 특히 **그래픽 디자인이나 게임 개발을 공부하는 학생들이 과제나 포트폴리오에 부담 없이 쓸 수 있도록 가볍고 최적화**된 것이 장점이야. **친근하면서도 살짝 전문가적인 느낌**이 나면 좋겠어.

    - 제품 정보: 네온 시티 키트(무료, 사이버펑크 스타일, 가볍고 최적화됨)

    - 목표: 무료 에셋 팩 다운로드 증대 및 커뮤니티 활성화

    - 대상: 결과물을 소비할 대상이 누구인지 알려줍니다. ("그래픽 디자인/게임 개발 전공 학생")

    - 제약 조건 또는 톤 앤 매너 : 글자 수, 특정 키워드 포함 여부 등 지켜야 할 규칙을 명시합니다.(”친근하면서 살짝 전문가적인 느낌”)

**3단계: Reference: 어떤 예시를 따를까?**
AI가 따라 하거나 참고할 만한 **구체적인 예시나 스타일을 제공**합니다. 이는 원하는 결과물의 톤앤매너, 구조, 스타일을 AI에게 학습시키는 효과적인 방법입니다. 'Few-shot prompting' (소수 예시 제공) 기법이 여기에 해당합니다.

> **프롬프트:**
(Context 프롬프트에 이어서)
> **아래는 지난번에 공유했던 '무료 텍스처 팩' 소개 게시물이야. 이런 식으로 간결하면서도 핵심 정보가 잘 드러나는 스타일을 참고해줘.**

> **참고 예시:**
> "과제하다 텍스처 찾는데 시간 다 쓰셨죠? 😩 리얼한 금속/천 재질 텍스처 50종 무료로 공유합니다! 클릭 한 번으로 작품 퀄리티를 확 높여보세요. 다운로드는 아래 링크에서! 👇 #3D모델링 #무료소스"

    - **스타일 예시:** 원하는 글의 분위기나 어조를 보여주는 문장을 제시합니다.

    - **구조 예시:** 특정 형식(입력-출력)을 보여주고, 그대로 따르도록 요청합니다.
문제 제기("시간 다 쓰셨죠?") -> 해결책 제시("무료로 공유합니다!") -> 기대효과("퀄리티를 확 높여보세요")의 흐름

> 
> ###### T-C-R 종합 프롬프트 (초안)

> > 당신은 3D 디자이너들을 위한 온라인 커뮤니티의 운영자야. 커뮤니티에 공유할 무료 3D 에셋 팩 소개 게시물 1개를 작성해줘. 핵심 특징은 글머리 기호(bullet point)를 사용해서 정리해줘.
> > 이번에 '네온 시티 키트'라는 이름의 무료 3D 에셋 팩 배포를 알리는 것이 목적이야. 사이버펑크 스타일의 도시를 쉽게 만들 수 있는 키트지. 특히 그래픽 디자인이나 게임 개발을 공부하는 학생들이 과제나 포트폴리오에 부담 없이 쓸 수 있도록 가볍고 최적화된 것이 장점이야. 친근하면서도 살짝 전문가적인 느낌이 나면 좋겠어.

> > 아래는 지난번에 공유했던 '무료 텍스처 팩' 소개 게시물이야. 이런 식으로 간결하면서도 핵심 정보가 잘 드러나는 스타일을 참고해줘.

> > **참고 예시:** "과제하다 텍스처 찾는데 시간 다 쓰셨죠? 😩 리얼한 금속/천 재질 텍스처 50종 무료로 공유합니다! 클릭 한 번으로 작품 퀄리티를 확 높여보세요. 다운로드는 아래 링크에서! 👇 #3D모델링 #무료소스"

**4단계: Evaluate: 결과물이 만족스러운가?**
AI가 생성한 결과물을 **비판적으로 검토하고 평가**하는 단계입니다. 결과물이 처음부터 완벽할 것이라고 기대하기보다는, 초안이라고 생각하고 개선할 점을 찾아내는 것이 중요합니다.

> **AI 생성 결과물 (초안):**
> 안녕하세요, 디자이너 여러분! 여러분의 포트폴리오를 빛내줄 '네온 시티 키트'를 무료로 배포합니다. 🌃

> 사이버펑크 분위기의 도시, 이제 직접 만드세요.

>       - 50개 이상의 빌딩 및 사물 모델 포함

>       - 가벼운 용량으로 빠른 렌더링 가능

>       - 상업적으로도 이용 가능

> 지금 바로 다운로드하세요!
> #3D에셋 #사이버펑크 #무료에셋 #게임개발

    - **요구사항 충족 여부:** Task와 Context에서 제시한 조건들을 모두 만족했는지 확인합니다.

    - **정확성 및 편향성:** 내용에 사실과 다른 점은 없는지, 특정 편향이 드러나지는 않는지 검토합니다.

    - **개선점 파악:** 더 나은 결과물을 위해 어떤 부분을 수정해야 할지 구체적으로 파악합니다.
참고 예시의 친근하고 공감대 있는 톤앤매너가 부족하다. 너무 기능만 나열해서 딱딱하게 느껴진다. 학생 타겟을 고려한 "과제", "포트폴리오" 같은 키워드를 더 잘 활용하면 좋겠다.

**5단계: Iterate: 어떻게 개선할까?**
평가 단계를 통해 파악한 개선점을 바탕으로 **프롬프트를 수정하고 다시 요청**하는 과정입니다. 만족스러운 결과물을 얻을 때까지 이 과정을 여러 번 반복할 수 있습니다. AI와의 대화는 단 한 번의 질문과 답변으로 끝나는 것이 아니라, 지속적인 상호작용을 통해 결과물의 완성도를 높여가는 과정입니다.

> **수정 프롬프트 (피드백):**
> 고마워. 거의 다 좋은데, 조금 더 학생들에게 공감대를 형성하는 방향으로 수정해줄 수 있을까? **"밤샘 과제에 지친 분들", "포트폴리오 마감이 코앞인 분들" 같은 표현을 넣어서** 좀 더 친근하게 다가가고 싶어. **다운로드 링크를 넣을 자리도 만들어줘.**

    - **구체적인 피드백 제공:** "마음에 안 들어"가 아니라, "두 번째 제목은 좋은데, 좀 더 간결하게 다듬어줘" 와 같이 구체적으로 수정 방향을 제시합니다.

    - **단계별 접근:** 복잡한 작업의 경우, 한 번에 모든 것을 요청하기보다 여러 단계로 나누어 점진적으로 결과물을 완성해 나갑니다.

> **AI 수정 결과물:**
> 밤샘 과제에 지친 디자이너분들 모두 주목! 📢 포폴 마감은 코앞인데, 멋진 배경이 필요하신가요?

> 여러분의 작품에 날개를 달아줄 '네온 시티 키트'를 커뮤니티 한정으로 무료 배포합니다! 🌃✨ 클릭 몇 번으로 나만의 사이버펑크 도시를 완성해 보세요.

>       - 🏙️ **가볍고 최적화된 모델:** 렌더링 시간 걱정 없이 마음껏 사용하세요.

>       - 🎨 **쉬운 사용법:** 초보자도 바로 적용 가능한 직관적인 구성이에요.

>       - 💸 **100% 무료:** 학생 여러분의 포트폴리오를 위해 상업적 이용까지 허용됩니다!

> 텅 빈 화면 앞에서 더 이상 고민하지 마세요! 😉

> **🔽 지금 바로 다운로드하기**
> [여기에 다운로드 링크 삽입]

> #3D에셋 #무료소스 #사이버펑크 #블렌더3D #언리얼엔진 #그래픽디자인 #포트폴리오

[video](https://youtu.be/OQaTkeAj8UU)

[video](https://youtu.be/p09yRj47kNM)

### References

### 공식 문서 (Official Documentation)

| 출처 | URL |
| --- | --- |
| Google DeepMind - Veo Prompt Guide | [https://deepmind.google/models/veo/prompt-guide/](https://deepmind.google/models/veo/prompt-guide/) |
| Google Cloud Blog - Ultimate Prompting Guide for Veo 3.1 | [https://cloud.google.com/blog/products/ai-machine-learning/ultimate-prompting-guide-for-veo-3-1](https://cloud.google.com/blog/products/ai-machine-learning/ultimate-prompting-guide-for-veo-3-1) |
| Vertex AI - Video Generation Prompt Guide | [https://docs.cloud.google.com/vertex-ai/generative-ai/docs/video/video-gen-prompt-guide](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/video/video-gen-prompt-guide) |
| Midjourney - Prompt Basics | [https://docs.midjourney.com/hc/en-us/articles/32023408776205-Prompt-Basics](https://docs.midjourney.com/hc/en-us/articles/32023408776205-Prompt-Basics) |
| Midjourney - Describe Feature | [https://docs.midjourney.com/hc/en-us/articles/32497889043981-Describe](https://docs.midjourney.com/hc/en-us/articles/32497889043981-Describe) |
| Midjourney - Image Prompts | [https://docs.midjourney.com/hc/en-us/articles/32040250122381-Image-Prompts](https://docs.midjourney.com/hc/en-us/articles/32040250122381-Image-Prompts) |
