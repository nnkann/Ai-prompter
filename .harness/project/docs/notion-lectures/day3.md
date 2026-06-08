---
title: Day3 ComfyUI Basic
domain: sources
problem: P1
s: [S1]
tags: [notion, comfyui]
status: completed
created: 2026-06-04
---

# Day3.ComfyUI_Basic

- Source: Notion page 2e1bac7f-0000-8023-890a-d929c53adaca
- Last edited: 2026-04-09T01:42:00.000Z

# ComfyUI Basic

[image](notion-asset://redacted-temporary-url)

[bookmark](https://www.comfy.org/)

## ComfyUI란?

여러분은 이미 Gemini로 캐릭터 시트를 만들어봤습니다. 텍스트로 설명하고, 이미지가 나오고, 마음에 안 들면 다시 요청하고. 그런데 이런 경험 있지 않나요?

> "이 캐릭터가 다른 포즈로 나왔으면 좋겠는데..."
"이 스타일은 유지하면서 배경만 바꾸고 싶은데..."
"내가 그린 스케치를 기반으로 렌더링하고 싶은데..."

Gemini에게 아무리 설명해도, 원하는 결과가 잘 안 나옵니다. 왜냐하면 Gemini는 **텍스트**만 조건으로 받기 때문입니다. 여러분이 원하는 건 **이미지를 조건으로** 쓰는 겁니다.
"이 포즈로", "이 스타일로", "이 구도로"  말이 아니라 **보여주면서** 요청하고 싶은 거죠.

ComfyUI는 그걸 가능하게 합니다.

---

## ComfyUI가 뭔가요?

### 3분 역사: A1111에서 ComfyUI까지

2022년 8월, Stable Diffusion이 오픈소스로 공개했습니다. 누구나 자기 컴퓨터에서 AI 이미지를 만들 수 있게 된 거죠. 그런데 문제가 있었습니다. **명령어를 직접 타이핑해야 했어요.**

```bash
python scripts/txt2img.py --prompt "a cat" --n_samples 4
```

이걸 일반인이 쓸 수 있을까요? 당연히 못 씁니다. 그래서 같은 날, **AUTOMATIC1111**이라는 개발자가 웹 UI를 만들었습니다. 버튼 누르고, 프롬프트 입력하고, Generate 클릭. 훨씬 쉬워졌죠. 

[image](notion-asset://redacted-temporary-url)

A1111은 빠르게 퍼졌고, 지금도 많이 쓰이는 도구 중 하나입니다.

### 그런데 왜 ComfyUI가 나왔을까요?

2023년 1월, **comfyanonymous**라는 개발자가 다른 생각을 했습니다.

> "A1111의 high-res fix 옵션이 너무 기본적이야. 두 번째 패스에 다른 모델을 쓰면 어떻게 될까?
> ...A1111 코드를 수정하는 것보다 내가 새로 만드는 게 빠르겠다."

그래서 만든 게 ComfyUI입니다.  결과물은 이렇게 생겼습니다:

[image](notion-asset://redacted-temporary-url)

처음 보면 당황스럽죠. "이게 뭐야?"  하지만 이 복잡해 보이는 구조가 **엄청난 유연성**을 줍니다.

#### A1111 vs ComfyUI — 뭐가 다를까요?

|  | A1111 | ComfyUI |
| --- | --- | --- |
| 인터페이스 | 버튼, 슬라이더, 드롭다운 | 노드를 선으로 연결 |
| 장점 | 직관적, 배우기 쉬움 | 유연함, 조합 무한대 |
| 단점 | 정해진 기능만 가능 | 처음엔 어려움 |
| 비유 | 자동 세탁기 | 레고 블록 |

A1111은 **자동 세탁기**입니다. 버튼 누르면 알아서 돌아가요. ComfyUI는 **레고 블록**입니다. 원하는 대로 조립할 수 있어요.

문제는 AI 이미지 생성 기술이 **미친 속도로 발전**한다는 겁니다.

2023년 한 해만 봐도:

- 1월: ControlNet 등장

- 2월: LoRA 폭발적 확산

- 7월: SDXL 공개

- 11월: SDXL Turbo 공개

매달 새로운 기술이 나옵니다. A1111은 이걸 따라가려면 **확장(Extension)**을 설치해야 해요. 그런데 확장을 설치하면?

#### ❌ **A1111 확장의 악몽**

- 확장 A를 설치했더니 확장 B가 안 됨

- 업데이트했더니 갑자기 전체가 터짐

- "xyz 버전이 맞지 않습니다" 에러 지옥

- 커뮤니티 질문의 절반이 "왜 안 돼요?"

고정된 UI에 새 기능을 억지로 끼워넣다 보니 **충돌이 일상**이 됐습니다. Reddit이나 디스코드에 가보면 A1111 트러블슈팅 글이 끝없이 올라와요.

### ComfyUI는 왜 다른가요?

ComfyUI는 **처음부터 모듈형**으로 설계됐습니다. 모든 기능이 독립된 "노드"예요.
새 기술이 나오면? 그냥 **새 노드를 추가**하면 됩니다. 기존 노드와 충돌할 일이 거의 없어요.

> **구조적 차이**
> **A1111**: 본체에 확장을 "덧붙이는" 방식

>   -  본체가 바뀌면 확장이 깨짐

> **ComfyUI**: 모든 게 독립된 노드

>   - 노드 A가 바뀌어도 노드 B는 영향 없음

그래서 FLUX가 2024년 8월에 공개됐을 때:

- **ComfyUI**: 당일 지원

- **A1111**: 몇 주~몇 달 후 불안정하게 지원

최신 기술을 빠르게 쓰고 싶다면, ComfyUI가 답입니다.

> ** ComfyUI의 킬러 기능**
> 1. **워크플로우 저장**: 복잡한 파이프라인을 파일로 저장

>   2. **워크플로우 공유**: 다른 사람이 만든 워크플로우를 그대로 사용

>   3. **이미지에 메타데이터 포함**: 생성된 이미지만 있으면 워크플로우 복원 가능

>   4. **효율적 캐싱**: 바뀐 노드만 다시 계산 (빠름!)

특히 3번이 중요합니다. 누군가 멋진 이미지를 공유했을 때, 그 이미지 파일을 ComfyUI에 드래그하면 **어떻게 만들었는지 그대로 복원**됩니다. 프롬프트, 모델, 설정값 전부요. 이건 A1111에서는 불가능합니다.

## 클라우드로 돌리는 이유

### "GPU가 없어요"

ComfyUI는 원래 로컬에서 돌립니다. 내 컴퓨터에 설치하고, 내 GPU로 연산하는 거죠. 문제는 그래픽카드**가 어마어마하게 비싸다**는 겁니다.

| 그래픽카드 | 가격 | VRAM |
| --- | --- | --- |
| RTX 5060 | ~50만원 | 8GB (최소 사양) |
| RTX 5070 Ti | ~120만원 | 16GB (권장) |
| RTX 5090 | ~350만원 | 32GB (쾌적) |

학생 입장에서 GPU 사려고 이 금액을 쓰기 부담스럽죠. 그리고 맥북 쓰시는 분들은 아예 선택지가 없죠. 무조건 CPU연산이라서 느리지만 돌아는 가는 정도입니다.

---

### 클라우드 서비스의 등장

그래서 **클라우드 ComfyUI 서비스**가 생겼습니다.

서버에 있는 GPU를 빌려서 쓰는 방식이죠. 내 컴퓨터엔 브라우저만 있으면 됩니다.

| 서비스 | 과금 방식 | 특징 |
| --- | --- | --- |
| **Comfy Cloud** | 크레딧 과금 | 공식 서비스 |
| **RunningHub** | 이미지당 과금 | 한국어 지원, 간편함 |
| **RunComfy** | 시간당 과금 | 프리셋 워크플로우 풍부 |
| **ThinkDiffusion** | 시간당 과금 | A1111도 지원 |

> **비용 비교**
> | **로컬 (그래픽카드 구매)** | **클라우드 (1개월)** |
> | --- | --- |
> |  350만원 (일시불) | 3만원 + ∝ (사용량에 따라) |

> 학습/실험 단계에서는 클라우드가 훨씬 경제적입니다.

이 수업에서는 Comfy Cloud를 기준으로 진행합니다. ComfyUI 공식 서비스라 안정적이고, 최신 기능 지원이 빠릅니다.

---

## ComfyUI로 할 수 있는 것들

Gemini나 Midjourney로는 안 되는, ComfyUI만의 영역이 있습니다.

### 1. 이미지를 조건으로 사용

> ❌ **Gemini**: "이 캐릭터와 똑같은 얼굴로 다른 포즈를 그려줘"
→ 결과: 비슷하지만 다른 캐릭터가 나옴
> ✅ **ComfyUI**: 캐릭터 이미지 + 포즈 스켈레톤 이미지 + 프롬프트
> → 결과: 정확히 그 포즈로 그 캐릭터가 나옴

### 2. 여러 이미지 합성

> ❌ **Midjourney**: "A 캐릭터가 B 배경에서 C 스타일로"
→ 결과: 어느 하나도 제대로 반영 안 됨
> ✅ **ComfyUI**: A 캐릭터 이미지 + B 배경 이미지 + C 스타일 레퍼런스
> → 결과: 세 조건을 모두 반영한 이미지

### 3. 빠른 생성 (4-8 step)

일반적인 Stable Diffusion 모델은 20-50번의 스텝이 필요합니다. Turbo/Lightning 같은 빠른 모델은 **4-8 스텝**만 필요해요. 같은 시간에 5배 더 많은 실험이 가능합니다. 하지만 용도에 따라 정교한 모델이 필요할 경우 다운로드하고 로딩하고 하는 시간을 줄여 바로 사용할 수 있게 해줍니다.

### 4. 최신 오픈소스 모델 즉시 사용

FLUX, Qwen, Wan 같은 새로운 오픈소스 모델이 나오면 ComfyUI는 **당일~며칠 내**에 지원합니다. 다만 로컬용에 한해서고, 클라우드 버전은 시간이 걸립니다. 
Midjourney나 Gemini는 자체 모델만 사용하기 때문에, 이런 외부 모델은 **아예 사용할 수 없습니다.**

---

### 오늘 배울 워크플로우 5가지

이 수업에서는 **바로 쓸 수 있는 워크플로우 5개**를 다룹니다.

| # | 워크플로우 | 해결하는 문제 |
| --- | --- | --- |
| 1 | **Qwen Image Edit** | 이미지를 조건으로 새 이미지 생성 |
| 2 | **ControlNet + DWPose** | 포즈 스켈레톤 기반 캐릭터 생성 |
| 3 | **Z-Image Turbo** | 4 step 초고속 생성 |
| 4 | **Inpainting** | 이미지 일부만 수정 |
| 5 | **Wan Animate** | 정지 이미지 → 짧은 영상 |

각 워크플로우는 이 구조로 진행됩니다:

> 
> 1. 이게 왜 필요한가요? (문제 상황)

>   2. 핵심 개념 (1분 이론)

>   3. 따라하기 (Step by step)

>   4. 응용 예시

## 시작하기 전에: 클라우드 서비스 준비

### Comfy Cloud 가입

1. comfycloud.app 접속

2. 회원가입 (Google 계정 연동 가능)

3. 무료 크레딧 확인 (신규 가입 시 제공)

> 크레딧 관리 팁
> - 무료 크레딧으로 충분히 실습 가능

>   - 생성 전 예상 비용 확인하는 습관

### 워크플로우 1: Qwen Image Edit

여러분이 Gemini로 만든 캐릭터 시트가 있습니다. 이제 이 캐릭터로 **웹툰 컷**을 만들고 싶어요. 

Gemini에게 이렇게 요청합니다:

> "이 캐릭터가 카페에서 커피를 마시는 장면을 그려줘"

결과는?

#### ❌ 문제점:

- 얼굴이 미묘하게 다름

- 머리 색이 바뀜

- 옷 디자인이 달라짐

- → **일관성 없음**

이유는 전 시간에 배웠듯이 Gemini는 여러분의 캐릭터 이미지를 **참고만** 할 뿐, **조건으로** 사용하지 않기 때문입니다. 

**Qwen Image Edit**는 이와 다르게 1~3개의 이미지를 **강제 조건**으로 넣을 수 있습니다. 
"이 얼굴 + 이 스타일 + 이 배경"처럼요.

### 핵심 개념: 이미지 컨디셔닝

> **텍스트 프롬프트 vs 이미지 컨디셔닝**
> **텍스트**: "파란 머리 여자 캐릭터"
> → AI가 "파란 머리 여자"를 **상상**해서 그림

> **이미지 컨디셔닝**: [파란 머리 캐릭터 이미지] + "카페에서"
> → AI가 **이 이미지를 기반으로** 변형

Qwen Image Edit는 **최대 3개의 이미지**를 조건으로 받습니다:

<!-- unsupported Notion block: column_list -->
<!-- unsupported Notion block: column -->
[image](notion-asset://redacted-temporary-url)

<!-- unsupported Notion block: column -->
    - **이미지 1**: 주요 피사체 (캐릭터 등)

    - **이미지 2**: 스타일 레퍼런스 (선택)

    - **이미지 3**: 배경/환경 (선택)

> 여기서 잠깐! 생성형 AI에서 가장 중요한 개념은 설명하고 넘어가죠.

## ComfyUI 기초 개념

워크플로우를 불러오면 여러 노드들이 보입니다. 자주 등장하는 핵심 개념들을 먼저 알아둡시다.

#### 모델 관련

| 용어 | 쉬운 설명 | 비유 |
| --- | --- | --- |
| **Checkpoint** | 이미지 생성의 핵심 모델. 그림체와 품질을 결정 | 화가의 뇌 |
| **LoRA** | 체크포인트에 추가하는 작은 보조 모델. 특정 스타일/캐릭터 학습 | 화가에게 주는 참고 자료 |
| **VAE** | 이미지 ↔ 잠재공간(Latent) 변환기. 색감과 선명도에 영향 | 물감 팔레트 |
| **CLIP** | 텍스트 프롬프트를 모델이 이해하는 형태로 변환 | 통역사 |

#### Latent (잠재 공간)

AI는 이미지를 직접 수정하지 않습니다. 이미지를 **압축된 수학적 공간(Latent)**으로 변환한 뒤 작업하고, 다시 이미지로 복원해요.

> **[원본 이미지] → VAE Encode → [Latent] → 노이즈 제거 → VAE Decode → [결과 이미지]**

왜 이렇게 할까요? Latent 공간에서 작업하면 메모리를 적게 쓰고 빠릅니다.

#### KSampler (샘플러)

실제로 이미지를 생성하는 핵심 노드입니다. 노이즈에서 시작해서 조금씩 이미지를 만들어가요.

| 파라미터 | 역할 | 권장값 |
| --- | --- | --- |
| **Steps** | 노이즈 제거 반복 횟수. 높을수록 정교하지만 느림 | 일반: 20-30 / Turbo: 4-8 |
| **CFG (Guidance Scale)** | 프롬프트를 얼마나 강하게 따를지. 높으면 프롬프트에 충실, 너무 높으면 부자연스러움 | 일반: 7-8 / Turbo: 1-2 |
| **Denoise** | 원본을 얼마나 바꿀지 (0=변화없음, 1=완전히 새로 생성) | img2img: 0.5-0.7 / txt2img: 1.0 |
| **Sampler** | 노이즈 제거 알고리즘 | euler, dpmpp_2m 등 |
| **Scheduler** | 스텝별 노이즈 감소 방식 | normal, karras, sgm_uniform 등 |

> **Sampler 종류 간단 정리**
> - **euler**: 빠르고 무난함

>   - **dpmpp_2m**: 품질 좋음, 가장 많이 사용

>   - **dpmpp_sde**: 디테일 좋지만 느림

#### 최신 기법들

| 기법 | 설명 |
| --- | --- |
| **AuraFlow** | CFG 없이도 고품질 생성 가능한 새로운 방식 |
| **CFGNorm** | CFG 값을 높여도 이미지가 타지 않게 정규화 |
| **Turbo/Lightning** | 4-8 스텝만에 생성 가능한 경량화 모델 |

지금 다 이해할 필요 없어요. 워크플로우를 따라하면서 자연스럽게 익혀집니다.

## 따라하기

**준비물**: Gemini로 만든 캐릭터 시트 이미지

**Step 1: 워크플로우 불러오기**

[image: Qwen2511-workflow](notion-asset://redacted-temporary-url)

1. Comfy Cloud 워크플로우 갤러리에서 "Qwen" 검색

2. 워크플로우 클릭 → "사용하기"

**Step 2: 이미지 업로드**

1. 왼쪽 "Image Input" 노드 찾기

2. 캐릭터 시트 이미지 드래그 앤 드롭

**Step 3: 프롬프트 수정**

"Prompt" 노드를 찾아서 내용 수정:

```markdown
The character is sitting in a cozy cafe, holding a coffee cup, warm afternoon lighting, same character design as the input image
```

> 프롬프트 팁
"same character design as the input image" 같은 문구를 넣으면 일관성이 높아집니다.

**Step 4: 실행**

1. 우측 상단 "Run" 버튼 클릭

2. 예상 크레딧 확인 후 "확인"

3. 30초~1분 대기

4. 결과 이미지 확인

### 결과 비교

| Gemini로 요청 | Qwen Image Edit |
| --- | --- |
| 캐릭터 얼굴 변형됨 | 원본 얼굴 유지 |
| 머리색 미묘하게 다름 | 색상 일관성 유지 |
| 스타일 흔들림 | 스타일 고정 |

### 응용: 이런 것도 가능합니다

1. **웹툰 컷 시리즈**: 같은 캐릭터로 여러 장면 생성

2. **스타일 트랜스퍼**: 캐릭터 + 지브리 배경 이미지 → 지브리 스타일 캐릭터

3. **의상 변경**: 캐릭터 + 다른 옷 이미지 → 옷만 바뀐 캐릭터

## 워크플로우 2: ControlNet + DWPose

#### 이게 왜 필요한가요?

"오른손을 들고 왼쪽을 바라보는 캐릭터" 이걸 텍스트로 설명하면 어떻게 될까요?

❌ 문제점:

- 왼손을 들거나

- 오른쪽을 바라보거나

- 손이 이상하게 꺾이거나

- 10번 돌려서 1번 성공

AI는 **텍스트로 포즈를 이해하는 게 어렵습니다. **해결책은 간단합니다. **포즈를 그림으로 보여주면 됩니다.**

---

#### 핵심 개념: 포즈 스켈레톤

ControlNet은 다양한 "조건 이미지"를 받을 수 있습니다:

- 외곽선 (Canny Edge)

- 깊이맵 (Depth)

- **포즈 스켈레톤 (OpenPose/DWPose)**

[image](notion-asset://redacted-temporary-url)

DWPose는 사람 이미지에서 **관절 위치를 추출**해서 스켈레톤으로 만듭니다. 이 스켈레톤을 조건으로 넣으면, AI는 **정확히 이 포즈**로 캐릭터를 그립니다.

[image](notion-asset://redacted-temporary-url)

#### 따라하기

**준비물**: 원하는 포즈의 사진 (핀터레스트, 구글 이미지 등)

Step 1: 워크플로우 불러오기

1. Qwen2511 워크플로우 불러오기

2. "사용하기" 클릭

[image](notion-asset://redacted-temporary-url)

최신 버전의 Controlnet은 따로 마련되어 있지 않아, 새로 추가하였습니다. 방법은:

바탕 화면을 더블 클릭하면 추가할 수 있는 노드들이 화면에 나옵니다. 이 때 검색을 통해 노드를 추가할 수 있습니다. 

<!-- unsupported Notion block: column_list -->
<!-- unsupported Notion block: column -->
[image](notion-asset://redacted-temporary-url)

<!-- unsupported Notion block: column -->
바탕 화면을 더블 클릭하여 Resize Image v2를 검색한 후 추가합니다. 

<!-- unsupported Notion block: column_list -->
<!-- unsupported Notion block: column -->
[image](notion-asset://redacted-temporary-url)

<!-- unsupported Notion block: column -->
각 셋팅값을 동일하게 넣어줍니다. 

    - width와 height는 1:1 비율로 맞춰줍니다.  Pixel perfect를 위해서 필요합니다.

    - 업스케일 메소드는 최고화질인 lanczos로 하고 keep propotion은 첨부된 이미지를 바탕으로 가늠해서 설정합니다. 현재는 pad이며 나머지 공간을 그냥 빈 공간으로 채웁니다. 그 외 crop은 설정된 값에 맞춰 잘라버리고, resize나 streth는 이미지의 변형을 가져옵니다. 

    - device는 gpu를 사용하면 빠를 것 같지만 아쉽게도 이 노드는 gpu를 지원하지 않습니다. 

<!-- unsupported Notion block: column_list -->
<!-- unsupported Notion block: column -->
[image](notion-asset://redacted-temporary-url)

<!-- unsupported Notion block: column -->
AIO(All in One) Preprocessor 노드도 추가해 줍니다.  Controlnet에는 아주 많은 기능들이 들어 있습니다. 그 중 DWPreprocessro를 사용하여 포즈 스켈렉톤을 만듭니다. 

참고로 포즈를 검출하는 기능은 여러가지가 있습니다. 그 중 DWPose와 Openpose가 유명합니다. 요즘에는 SAM3가 핫합니다. 이 전에는 Openpose가 유명했지만, DWPose가 성능이 더 좋기 때문에 요즘엔 DWPose를 더 많이 사용합니다. 

그 외 많이 사용하는 기능은 Canny, Depth 등이 있으며 많은 테스트를 해보시길 추천합니다.

Step 2: 포즈 이미지 업로드

1. "Pose Reference" 노드에 포즈 사진 업로드

2. 자동으로 스켈레톤 추출됨

**Step 3: 캐릭터 설명 입력**

```markdown
change the girl to the pose in image2
```

**Step 4: 실행 및 확인**

1. "Run" 클릭

2. 스켈레톤 미리보기 확인

3. 최종 이미지 확인

### 포즈 소스 추천

| 소스 | 장점 | 링크 |
| --- | --- | --- |
| **Pinterest** | 다양한 포즈 사진 | pinterest.com |
| **PoseMyArt** | 3D 마네킹 포즈 | posemy.art |
| **직접 촬영** | 정확한 포즈 | 스마트폰 카메라 |

> **팁: 직접 찍으세요!
**핀터레스트에서 찾는 것보다 직접 포즈 잡고 찍는 게 빠릅니다. 조명이나 화질은 상관없어요. 스켈레톤만 추출하니까요. 친구도 활용하세요!

## 워크플로우 3: Z-Image Turbo

### 이게 왜 필요한가요?

일반적인 이미지 생성은 **20~50 step**이 필요합니다. 한 장 만드는 데 10~30초... 아이디어 스케치 단계에서 이건 너무 느립니다.

> "이 느낌? 아니야. 이건? 아니야. 이건?"

매번 30초씩 기다리면 리듬이 끊깁니다. **Z-Image Turbo**는 **4~8 step**만에 이미지를 만듭니다. 품질은 약간 떨어지지만, **5배 빠릅니다.**

---

### 언제 쓰나요?

| 상황 | 일반 모델 | Turbo 모델 |
| --- | --- | --- |
| 아이디어 탐색 | ❌ 느림 | ✅ 빠른 반복 |
| 구도 테스트 | ❌ 과함 | ✅ 적절 |
| 최종 결과물 | ✅ 고품질 | ❌ 품질 부족 |

**Turbo로 방향 잡고 → 일반 모델로 완성 **이게 효율적인 워크플로우입니다.

### 따라하기

**Step 1: 워크플로우 불러오기**

"Z-Image Turbo" 또는 "SDXL Lightning" 검색

**Step 2: 프롬프트 입력**

```markdown
fantasy forest, magical atmosphere, morning light, detailed background
```

**Step 3: Step 수 확인**

- **Steps**: 4~8 (기본값 유지)

- **CFG Scale**: 1~2 (Turbo 모델은 낮게)

**Step 4: 빠른 반복**

1. Run → 결과 확인 (5초)

2. 프롬프트 수정 → Run (5초)

3. 마음에 들 때까지 반복

## 워크플로우 4: Inpainting

### 이게 왜 필요한가요?

거의 완벽한 이미지가 나왔습니다. 그런데...

> "손가락이 6개야..."
"배경 오른쪽이 이상해..."
"표정만 바꾸고 싶은데..."

전체를 다시 생성하면 마음에 들었던 부분도 바뀝니다. **일부만 수정**하고 싶은 거죠. Inpainting은 **마스크를 칠한 영역만** 다시 생성합니다.

### 핵심 개념: 마스크

마스크 영역 = 다시 생성
나머지 = 그대로 유지

### 따라하기

**준비물**: 수정하고 싶은 이미지

**Step 1: 워크플로우 불러오기**

"Inpainting" 워크플로우 검색

**Step 2: 이미지 업로드**

원본 이미지 업로드

**Step 3: 마스크 그리기**

1. 마스크 에디터 열기

2. 수정할 영역을 브러시로 칠하기

3. 저장

**Step 4: 수정 프롬프트 입력**

`correct hand with 5 fingers,
same style as original`

**Step 5: 실행**

마스크 영역만 새로 생성됨

### 활용 팁

>  Inpainting 잘 쓰는 법
> 1. **마스크는 넉넉하게**: 경계가 자연스러워짐

>   2. **Denoise 강도 조절**: 0.5~0.7 권장 (너무 높으면 전혀 다른 결과)

>   3. **프롬프트에 "같은 스타일" 명시**: 일관성 유지

---

## 워크플로우 5: Wan Animate

### 이게 왜 필요한가요?

정지 이미지는 완성했습니다. 이제 **움직이게** 하고 싶어요. 머리카락이 바람에 날리거나, 눈을 깜빡이거나, 고개를 돌리거나. 1~3초짜리 짧은 모션이면 충분합니다.

**Wan Animate**는 정지 이미지를 입력받아 **짧은 영상**을 만듭니다.

### 핵심 개념: Image-to-Video

[정지 이미지] + [모션 프롬프트] → [2~4초 영상]

모션 프롬프트 예시:

- "hair flowing in wind"

- "eyes blinking slowly"

- "camera slowly zooming in"

- "character turning head to left"

---

### 따라하기

**준비물**: 움직이게 하고 싶은 캐릭터 이미지

**Step 1: 워크플로우 불러오기**

"Wan Animate" 또는 "Wan I2V" 검색

**Step 2: 이미지 업로드**

캐릭터 이미지 업로드

**Step 3: 모션 프롬프트 입력**

```markdown
gentle breeze blowing hair, soft ambient lighting, subtle breathing motion
```

**Step 4: 설정 확인**

- **Length**: 2~4초 권장

- **FPS**: 12~24

**Step 5: 실행**

1~2분 소요 (이미지보다 오래 걸림)

---

### 주의사항

> ** I2V의 한계**
> - **큰 움직임은 어려움**: 걷기, 달리기 → 왜곡 발생

>   - **작은 모션에 적합**: 머리카락, 눈 깜빡임, 호흡

>   - **배경 움직임 주의**: 카메라 무빙은 OK, 복잡한 배경 변화는 X

---

## 오늘 배운 것 정리

### 5가지 워크플로우 요약

| 워크플로우 | 용도 | 핵심 |
| --- | --- | --- |
| **Qwen Image Edit** | 이미지 조건으로 생성 | 캐릭터 일관성 유지 |
| **ControlNet DWPose** | 포즈 지정 | 스켈레톤 = 정확한 포즈 |
| **Z-Image Turbo** | 빠른 탐색 | 4 step, 5배 속도 |
| **Inpainting** | 부분 수정 | 마스크 = 수정 영역 |
| **Wan Animate** | 이미지 → 영상 | 작은 모션에 적합 |

### 핵심 메시지

> ** ComfyUI의 본질
**Gemini/Midjourney: 텍스트만 입력
ComfyUI: 이미지도 조건으로 사용
→ 더 정밀한 제어, 더 일관된 결과

## 부록

### 클라우드 서비스 비교

| 서비스 | 과금 | 한국어 | 프리셋 | 추천 대상 |
| --- | --- | --- | --- | --- |
| **Comfy Cloud** | 크레딧 | ❌ | 많음 | **이 수업 기준** |
| RunningHub | 이미지당 | ✅ | 많음 | 입문자 |
| RunComfy | 시간당 | ❌ | 많음 | 장시간 작업 |
| ThinkDiffusion | 시간당 | ❌ | 보통 | A1111도 필요 |
| ComfyICU | 크레딧 | ❌ | 적음 | 커스텀 위주 |

### ComfyUI 생태계 연표

| 연도 | 사건 |
| --- | --- |
| 2022.08 | Stable Diffusion 오픈소스 공개 |
| 2022.08 | AUTOMATIC1111 Web UI 공개 |
| 2023.01 | ComfyUI 첫 공개 |
| 2023.02 | ControlNet 발표 |
| 2023.06 | comfyanonymous, Stability AI 합류 |
| 2023.07 | SDXL 공개 |
| 2024.06 | Comfy Org 설립 |
| 2024.08 | FLUX 공개 (당일 ComfyUI 지원) |
| 2024.11 | Z-Image Turbo 공개 |

### 유용한 링크

> **클라우드 서비스**
> - Comfy Cloud: [https://comfycloud.app](https://comfycloud.app/)

>   - RunningHub: [https://runninghub.ai](https://runninghub.ai/)

>   - RunComfy: [https://runcomfy.com](https://runcomfy.com/)

>   - ThinkDiffusion: [https://thinkdiffusion.com](https://thinkdiffusion.com/)

> **학습 자료**

>   - ComfyUI 공식 문서: [https://docs.comfy.org](https://docs.comfy.org/)

>   - ComfyUI 노드 목록: [https://comfyui.community/nodes](https://comfyui.community/nodes)

> **워크플로우 공유**

>   - OpenArt: [https://openart.ai/workflows](https://openart.ai/workflows)

>   - CivitAI: [https://civitai.com](https://civitai.com/) (모델 + 워크플로우)

### Deprecated
[image: ComfyUI 최초 실행 화면](notion-asset://redacted-temporary-url)

최초 실행하면 아직 아무 것도 할 수 없습니다. 왜냐하면 아직 모델과 노드들이 갖춰지지 않았기 때문입니다. 

그럼 이제 가장 최신 모델인 [FLUX1.Kotext.dev](http://flux1.kotext.dev/) 모델을 설치해 보겠습니다.

실행된 화면에서 왼쪽 상단의 Workflow에서 Browse Templates 를 선택합니다.

[image](notion-asset://redacted-temporary-url)

FLUX를 선택하고 그 중 가장 최근에 나온 두 모델 중 Flux Kontext Dev(Basic)를 클릭하여 실행합니다.

[image: FLUX Kontext Dev(Basic)](notion-asset://redacted-temporary-url)

[image](notion-asset://redacted-temporary-url)

처음 실행하면 vae와 텍스트 인코더, 디퓨전 모델이 없다고 나옵니다. 수동으로 받아서 넣어줄 것이기 때문에 창을 닫습니다. 

[image: [FLUX.Kontext.dev](http://flux.kontext.dev/) 워크플로우](notion-asset://redacted-temporary-url)

이제 워크플로우를 가져왔으니 위에 오류가 나는 해당 파일들을 다운 받아 설치하도록 하겠습니다. 

[image: 모델 링크 / 설치 폴더의 위치](notion-asset://redacted-temporary-url)

좌상단의 Model Links를 확인해 보면 각 파일들의 링크가 걸려있습니다. 

우리는 기본 [Flux.Kontext.dev](http://flux.kontext.dev/) 디퓨전 모델은 사용하지 않고 Nunchaku라는 플러그인으로 수정된 모델 파일을 사용할 예정이니 디퓨전 모델을 제외한 나머지 3개의 파일을 다운로드합니다.

  - ae-safetnesors 

[bookmark](https://huggingface.co/Comfy-Org/Lumina_Image_2.0_Repackaged/resolve/main/split_files/vae/ae.safetensors)

  - clip-safetensors

[bookmark](https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors)

  - t5xxl fp16.safetnesors or t5xxl fp8 e4n3fn scaled.safetensors

[bookmark](https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn_scaled.safetensors)

> t5xxl…은 텍스트 인코더로서 사용자가 입력한 텍스트 프롬프트를  AI모델이 이해할 수 있도록 해 주는 역할을 합니다.  fb16은 16bit로 2배 더 우수한 능력을 가지고 있지만, 메모리도 2배를 사용합니다.  fb8은 속도가 빠르지만, 약간의 품질 저하가 있고, 최신 GPU(40시리즈 이상)에서 최적 성능을 발휘합니다. 

각각의 파일은 아래와 같이 폴더에 이동합니다. 

[image](notion-asset://redacted-temporary-url)

> 각 모델들은 FLUX 모델이기 때문에 각각의 폴더안에 FLUX라고 폴더를 만들어 모델은 넣으면 나중에 다른 모델들이 여러 개 있을 경우 구분이 좀 더 쉬워집니다. 

> 우리는 Stability Matrix를 사용하고 있습니다. 이 앱은 WebUI나 ComfyUI등을 공유하면서 사용할 수 있도록 해 주는 역할도 하고 있습니다. 따라서 디퓨전 모델같은 경우 서로 공유할 수 있도록 공유 폴더가 상위단에 마련되어 있습니다. 우리는 ComfyUI만 사용하므로, 위의 ComfyUI의 폴더에 모델을 집어 넣습니다. 
> [image: Stability Matrix의 Model 폴더](notion-asset://redacted-temporary-url)

> [image: ComfyUI 의 Model 폴더](notion-asset://redacted-temporary-url)

자. 그럼 성능을 위해 한 가지 더 설치를 해 보도록 하겠습니다. 

#### Nunchaku 설치
> ComfyUI-nunchaku는 MIT HAN Lab에서 개발한 플러그인으로, SVDQuant 4-bit 양자화 기술을 통해 FLUX 모델의 메모리 사용량을 3.6배 줄이고 추론 속도를 8.7배 향상시킵니다. 이를 통해 기존 고사양 GPU가 필요했던 대형 AI 이미지 생성 모델을 단 4GB VRAM에서도 고품질로 실행할 수 있게 해주는 혁신적 도구입니다.

> MacOS에서는 정상적으로 작동하지 않습니다. 

[image: ComfyUI Manager](notion-asset://redacted-temporary-url)

[image: Nunchaku 설치](notion-asset://redacted-temporary-url)

ComfyUI를 종료합니다.  해당 폴더로 이동하여 Nunchaku에 필요한 패키지들을 설치하도록 합니다. 

> 설치한 폴더\Data\Packages\ComfyUI\custom_nodes\ComfyUI-nunchaku\

그런 다음 해당 폴더의 주소입력창에 cmd를 실행하여, 파이선 pip 명령어를 통해 관련된 패키지를 설치하도록 하는 명령어를 실행합니다. 

```powershell
pip install -r requirements.txt
```

> 위의 명령어가 실행되지 않을 경우에는 파이썬 명령어를 실행할 수 있도록 환경변수가 설정되어 있지 않는 상황입니다. 환경변수 편집을 통해 해당하는 폴더가 환경 변수에 있는 지 확인하고 없다면 추가하세요.
> 시스템 속성 > 환경 변수 > 환경 변수 편집

> 설치 폴더\Data\Packages\ComfyUI\venv\Scripts

> [image](notion-asset://redacted-temporary-url)

> Requirments 를 설치하다가 xformers 에러가 날 경우, torch버전과 맞지 않아서 발생하는 경우입니다. 이런 경우에는 해당 명령어를 통해 따로 xformers를 업그레이드해 줍니다.
> pip install --upgrade xformers

> [image](notion-asset://redacted-temporary-url)

ComfyUI를 실행합니다. 

Nunchaku 휠 기능을 사용하기 위해 해당 폴더에서 install_wheel.json 파일을 드래그해서 넣습니다.

[image: Nunchaku 폴더](notion-asset://redacted-temporary-url)

[image](notion-asset://redacted-temporary-url)

`Run` 버튼을 눌러 해당 파일을 설치합니다. 설치가 완료되면 아래와 같이 설치 완료 메세지가 표시됩니다.

[image](notion-asset://redacted-temporary-url)

이제 Nunchaku가 적용된 Flux.kontext 워크플로우를 불러옵니다. 

해당 파일은 Nunchaku의 example_workflow에 있습니다. 

[image](notion-asset://redacted-temporary-url)

파일을 drag하여 ComfyUI에 드래그합니다. 

관련 컴포넌트가 없으면 경고가 뜨면서 설치하겠냐고 물어봅니다. install을 눌러 없는 노드를 설치합니다.

Nunchaku Flux.1-kontext-dev 모델 

[bookmark](https://huggingface.co/mit-han-lab/nunchaku-flux.1-kontext-dev/tree/main)

해당 모델 중 int4 모델을 다운로드하여 폴더에 넣어줍니다. 

[image: svdq-int4…모델을 다운로드](notion-asset://redacted-temporary-url)

> 설치 폴더\Data\Packages\ComfyUI\models\diffusion_models\Nunchaku\

ComfyUI로 돌아와서 r 버튼으로 리로드합니다. 

그런 다음에서 모델을 넣어줍니다.

[image](notion-asset://redacted-temporary-url)

이제 ComfyUI를 사용할 수 있는 준비가 다 되었습니다. 

다음은 활용편으로 넘어가도록 하겠습니다. 

위의 잠깐 언급되었던 워크플로우들을 열어서 테스트해 보기 바랍니다. (드래그 앤 드롭)

[image: example workflows](notion-asset://redacted-temporary-url)

> 각각의 워크플로우에 없는 파일들은 허깅페이스에서 nunchaku로 검색하시면 모델들을 찾으실 수 있습니다. 
> [bookmark](https://huggingface.co/collections/mit-han-lab/nunchaku-6837e7498f680552f7bbb5ad)

#### 기타 유용한 플러그인 설치 

**Crystools**

ComfyUI Manager를 클릭하여 커스텀 노드 매니저를 들어간 후 crystools를 검색하면 아래와 같이 나옵니다. 이 툴을 설치하면 현재 하드웨어의 사용량을 실시간으로 보여주는 바가 출력됩니다. 

[image](notion-asset://redacted-temporary-url)

[image](notion-asset://redacted-temporary-url)

**Alekpet **(페인터 노드)

매니저에서 커스텀 노드 매니저를 들어간 후 alekpet을 검색하여 설치합니다. 

[image](notion-asset://redacted-temporary-url)

ComfyUI에서 재시작을 누르고 Stability Matrix에서 설치 과정을 확인한 후 완료되면 다시 시작합니다. 

캔버스의 빈 곳을 두 번 클릭하면 노드 입력창이 나오는데 그 곳에 painter node를 찾아 클릭합니다. 

[image](notion-asset://redacted-temporary-url)

[image: Painter node](notion-asset://redacted-temporary-url)

이렇게 painter 노드를 추가하여 기본 이미지에 박스 같은 것을 추가하여 수정하거나 글을 추가하는 등 다양한 용도로 사용할 수 있습니다. 

---

#### 유용한 사이트

아주 많은 모델들과 Lora 등이 허깅페이스와 시빗ai에서 공유되고 있습니다. 

[image](notion-asset://redacted-temporary-url)

[bookmark](https://huggingface.co/)

[image: SDXL로 검색한 결과물. 각 이미지에 Checkpoint파일이며/ XL을 지원함을 표시하고 있음.](notion-asset://redacted-temporary-url)

[bookmark](https://civitai.com/)

---

#### 용어 사전

#### Checkpoint

Checkpoint는 AI 모델의 학습된 가중치(weights)가 저장된 파일로, 모델이 어떤 스타일의 이미지를 생성할지 결정하는 "두뇌" 역할을 합니다.
예를 들어 사실적인 사진 스타일, 애니메이션 스타일, 특정 아티스트 화풍 등 각기 다른 특성을 가진 checkpoint를 바꿔가며 사용하면 완전히 다른 스타일의 이미지를 생성할 수 있습니다.

#### Safetensors

**SafeTensors**는 체크포인트처럼 AI 모델의 가중치를 저장하는 **안전하고 빠른 파일 포맷**(.safetensors)으로, 기존 .ckpt 파일의 **보안 취약점을 해결**하고 **로딩 속도를 개선**한 형식입니다.

Checkpoint의 "컨테이너" 역할을 하며, 같은 모델이라도 **.ckpt 대신 .safetensors 형식을 사용하면 더 안전하고 빠르게** 로드할 수 있습니다.

#### LoRA (Low-Rank Adaptation)

**LoRA**는 기존 AI 모델에 **작은 파일(보통 수십~수백MB)을 추가**하여 **특정 스타일, 캐릭터, 개념을 학습**시키는 기술입니다.

전체 모델을 다시 학습시키지 않고도 **"특정 인물의 얼굴", "특정 화풍", "특정 포즈"** 등을 원본 모델에 추가할 수 있어, **효율적이고 유연한 커스터마이징**이 가능합니다.

> 다른 버전에서 이전 버전의 Lora는 작동하지 않습니다.

Lora는 단순 얼굴형태를 지정할 뿐아니라 배경이라든지 여러 가지를 따로 학습시켜 적용할 수 있습니다. 따라서 관련된 모델들을 모으는 것이 노하우가 되기도 합니다.
