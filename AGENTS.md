# AGENTS.md

이 저장소에서 작업하는 에이전트는 아래 지침을 우선 적용합니다. 목표는 Material Design 색상 토큰을 단일 소스에서 관리하면서 iOS, JavaScript/TypeScript, Python 패키지의 공개 API를 일관되게 유지하는 것입니다.

## 저장소 원칙

- 토큰은 `tokens/`와 `tools/codegen/generate.rb`를 기준으로 다룹니다.
- 생성된 플랫폼 파일은 직접 수정하지 말고, 가능한 한 토큰 또는 코드 생성기를 수정한 뒤 `ruby tools/codegen/generate.rb`로 갱신합니다.
- Android 패키지는 이 저장소에서 만들지 않습니다. Android는 공식 Jetpack Compose Material 3 API를 사용한다는 기존 방향을 유지합니다.
- iOS, JavaScript/TypeScript, Python은 각 플랫폼 사용자가 자연스럽게 기대하는 타입, 네이밍, 예외 방식을 따르되 색상 값과 역할 의미는 동일해야 합니다.
- 공개 preset, role, scheme 데이터는 소비자 코드가 전역 상태를 오염시키지 못하도록 불변성을 유지합니다.
- 커스텀 hex 입력은 플랫폼별 생성 시점에 `#RRGGBB` 형식으로 검증합니다.

## SOLID 설계 기준

### Single Responsibility

- 토큰 정의, 코드 생성, 플랫폼 런타임 API, 문서, 배포 설정의 책임을 섞지 않습니다.
- Material 3 역할 매핑이나 preset 값 변경은 토큰과 생성기 책임입니다.
- SwiftUI, UIKit, JS, Python 편의 API는 각 플랫폼 어댑터 책임입니다.

### Open Closed

- 새 preset, role, 플랫폼 API는 기존 공개 API를 깨지 않는 방식으로 추가합니다.
- 수동 복붙 확장보다 토큰과 코드 생성 경로를 확장합니다.
- 생성기 변경 시 기존 플랫폼의 출력이 의도치 않게 바뀌지 않았는지 diff로 확인합니다.

### Liskov Substitution

- `MaterialTheme`, `MaterialColorScheme`, preset scheme, custom scheme은 같은 role 계약을 지켜야 합니다.
- baseline, preset, custom theme 사이에서 같은 role 접근이 같은 의미와 형식을 가져야 합니다.
- 잘못된 hex, 누락 role 같은 실패 조건은 늦게 터지는 값 오염이 아니라 생성 시점 실패로 처리합니다.

### Interface Segregation

- 플랫폼별 사용자가 필요 없는 의존성을 끌어오지 않게 합니다.
- Swift core, SwiftUI, UIKit 제품의 책임을 분리합니다.
- JS 패키지는 React Native, Expo, web, Node에서 공통으로 쓸 수 있는 순수 TypeScript API를 유지합니다.
- Python API는 Python 사용자에게 익숙한 snake_case 필드와 명확한 예외를 사용합니다.

### Dependency Inversion

- 플랫폼 패키지는 토큰 데이터와 생성 결과에 의존하고, 특정 UI 프레임워크 구현에 핵심 모델을 종속시키지 않습니다.
- Swift core는 SwiftUI/UIKit에 의존하지 않습니다.
- JS 런타임은 불필요한 외부 런타임 dependency를 추가하지 않습니다.
- 문서와 배포 워크플로는 라이브러리 런타임 동작을 바꾸지 않아야 합니다.

## 작업 흐름

1. 변경 전 `git status --short --branch`로 현재 브랜치와 미반영 변경을 확인합니다.
2. 생성 파일을 수정해야 할 때는 먼저 `tools/codegen/generate.rb` 또는 `tokens/` 수정으로 해결 가능한지 확인합니다.
3. 코드 생성이 필요한 변경 후에는 `ruby tools/codegen/generate.rb`를 실행합니다.
4. 가능하면 아래 검증을 실행합니다.

```bash
ruby tools/codegen/generate.rb --check
swift test
PYTHONPATH=packages/python/src python3 -m pytest packages/python/tests -q
npm --prefix packages/js run check
npm --prefix packages/js run build
npm --prefix packages/js run smoke
git diff --check
```

5. 실행하지 못한 검증은 최종 보고에 이유와 남은 위험을 적습니다.

## PR 리뷰 봇 대응 규칙

PR 리뷰 시 CodeRabbit, Gemini, Codex review bot 등 자동 리뷰 코멘트는 그대로 믿지 말고 반드시 현재 코드, diff, 테스트 결과와 대조합니다.

각 봇 코멘트는 다음 중 하나로 분류합니다.

- `반영`: 현재 코드에서 재현 가능하고, 사용자 영향이나 유지보수 위험이 있으며, 이번 PR 범위 안에서 수정하는 것이 맞는 지적입니다.
- `부분 반영`: 핵심 지적은 맞지만 제안된 구현은 과하거나 저장소 패턴과 맞지 않아 더 작은 수정으로 처리하는 경우입니다.
- `보류`: 지적은 합리적이지만 이번 PR 범위를 벗어나거나 구조 개편, 별도 설계, 별도 릴리스가 필요한 경우입니다.
- `오탐/환각`: 현재 코드, CI, 테스트, GitHub diff 기준으로 사실과 다른 지적입니다.

봇 코멘트 처리 후에는 PR 댓글 또는 해당 리뷰 스레드 대댓글에 판단을 남깁니다. 조용히 resolve만 하지 않습니다.

대댓글에는 아래 정보를 포함합니다.

- 판단: `반영`, `부분 반영`, `보류`, `오탐/환각`
- 근거: 확인한 파일, 라인, 테스트, CI 결과, 재현 여부
- 조치: 수정 커밋, 실행한 검증, 또는 보류 이유

예시:

```text
반영 완료했습니다. 지적대로 create_theme(color_scheme=...)에서 invalid hex가 MaterialColor로 들어갈 수 있었습니다.
MaterialColor.__post_init__에서 #RRGGBB 검증을 수행하도록 수정했고, pytest에 회귀 테스트를 추가했습니다.
검증: PYTHONPATH=packages/python/src python3 -m pytest packages/python/tests -q
커밋: abc1234
```

```text
오탐으로 판단합니다. 현재 PR head 기준 packages/ios/... 테스트는 Swift Testing으로 컴파일되며, GitHub Actions swift 체크도 통과했습니다.
추가 변경은 하지 않고 스레드만 resolve합니다.
```

```text
보류합니다. 템플릿 파일 분리는 유지보수 관점에서 타당하지만 이번 PR의 기능 변경 범위를 넘어서는 구조 개편입니다.
현재 PR에서는 생성기 동작과 출력 안정성만 검증하고, 템플릿 분리는 후속 이슈로 다루겠습니다.
```

## 리뷰와 머지 기준

- `CHANGES_REQUESTED`가 있으면 최신 head 기준으로 아직 유효한지 먼저 확인합니다.
- 이미 커밋으로 해결된 스레드는 근거 댓글을 남긴 뒤 resolve합니다.
- 환각성 코멘트라도 빌드 실패, 데이터 삭제, 공개 API 파손처럼 위험도가 큰 주장이라면 로컬 또는 CI로 직접 확인합니다.
- 머지 전 unresolved active thread가 남아 있으면 모두 `반영`, `보류`, `오탐/환각` 중 하나로 결론을 남깁니다.
- CI가 통과하고, 남은 이슈가 보류 가능한 수준이며, 보류 사유가 댓글에 남아 있을 때만 머지합니다.

## 커밋과 문서

- 커밋 메시지와 PR 설명은 한국어로 작성합니다.
- 커밋 제목은 `feat.`, `fix.`, `chore.`, `hotfix.`, `env.`처럼 변경 성격을 앞에 둡니다.
- 사용자가 README나 플랫폼 문서 업데이트를 요청하면 루트 README와 해당 `packages/*/README.md`의 접근 방법이 서로 어긋나지 않게 맞춥니다.
- 문서에는 실제 지원 범위를 적습니다. Android처럼 공식 API 사용을 권장하는 플랫폼은 이 저장소 패키지가 없다는 사실을 명확히 씁니다.
