# Swift란
2014년 Apple이 개발한 프로그래밍 언어로,  iOS, macOS, watchOS, tvOS 앱 개발에 사용된다. 
### 주요 특징
- 안정성: 강한 타입 시스템과 오류방지 기능으로 안정적인 코드 작성 가능
- 빠른 성능: 빠른 실행 속도를 제공
- 사용자 친화적 문법: 초보자도 쉽게 접근 가능.
- 오픈소스: Swift.org에서 제공하며, 커뮤니티가 활발.


# Xcode란
Apple에서 제공하는 통합 개발 환경(Integrated Development Environment). Swift 및 Objective-C를 사용하여 애플 디바이스용 소프트웨어를 개발할 때 사용된다. 
### 주요 기능
- 코드 편집기: Swift 및 다른 언어로 코드를 작성 가능
- 시뮬레이터: 앱을 실행해보고 디버깅할 수 있는 가상 디바이스
- 디자인 인터페이스: 드래그 앤 드롭으로 UI 구성 가능
- 디버깅 도구: 오류 탐지 및 성능 분석 지원
- 배포 도구: 앱 스토어에 앱을 제출하거나 테스트를 위한 배포

 Xcode에서 개발하는 방법은 크게 두가지로 나뉜다. UIKit를 사용하는 방식, SwiftUI를 사용하는 방식.
## UIKit 기반 개발 (Storyboard & 코드 사용)
### 특징
- iOS 2.0부터 사용된 전통적인 방식
- 스토리보드(Storyboard) 또는 코드를 이용하여 UI를 설계
- MVC(Model-View-Controller) 패턴을 주로 사용
- SwiftUI가 등장하기 전까지 iOS 개발의 표준이었음
- 여전히 많은 기존 앱이 UIKit으로 개발됨
### 개발 방식
1. 스토리보드(Storyboard) 사용
 - Xcode에서 Main.storyboard를 이용해 UI를 설계
 - 드래그 앤 드롭으로 버튼, 레이블 등 배치 가능
 - @IBOutlet, @IBAction을 이용해 UI 요소와 코드 연결
2. 코드만을 이용한 개발 (Programmatic UI)
  - UIView, UILabel, UIButton 등을 코드로 생성
  - AutoLayout을 코드로 적용 (NSLayoutConstraint 또는 SnapKit 라이브러리 사용 가능)
  - 스토리보드 없이 화면을 구성하는 방식 (기업에서 선호하는 경우 많음)

## Swift UI 기반 개발
### 특징
- 2019년 WWDC에서 발표된 최신 UI 프레임워크
- **Declarative Syntax (선언형 문법)**을 사용
- @State, @Binding, @ObservedObject 등 데이터 바인딩 기능 제공
- 코드만으로 UI를 구성하고 실시간 미리보기 가능 (Preview)
- iOS 13 이상부터 지원됨
  ### 개발 방식
  - SwiftUI의 View 구조체 사용
  - struct를 이용해 화면을 선언적으로 구성
  - 코드와 UI가 분리되지 않고 한곳에서 작성됨
  - body 프로퍼티 내에서 UI 요소를 직접 배치

 ## Playground란
 Xcode 내에서 간단한 Swift 코드를 테스트할 수 있는 환경. 실시간으로 코드를 실행하고 바로 결과를 확인할 수 있다.

## Xcode Workspace 화면 구성 요소
- Naviagtor Area
- Editor Area
- Utility Area
- Debug Area
- Toolbar
- Canvas


# Xcode 개발 환경 설정
1. Apple Developer에서 Xcode 다운로드
2. 개발 도구 설치
   - Xcode Command Line Tools (git 등 기본적인 개발 도구 모음)
   - Homebrew (패키지 관리자)
   - CocoaPods (iOS 라이브러리 관리 도구)

   
 
