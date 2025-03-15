# Swift 프로퍼티 옵저버 (Property Observer) – willSet, didSet 활용

프로퍼티 옵저버(Property Observer) 는 프로퍼티의 값이 변경될 때 특정 코드를 실행할 수 있는 기능이다.  
willSet과 didSet을 사용하여 값 변경 전후의 동작을 감지할 수 있으며,  
이를 통해 값 검증, UI 업데이트, 로그 기록 등 다양한 활용이 가능하다.  

<br>


## 1️⃣ 프로퍼티 옵저버의 개념
- willSet: 값이 변경되기 직전 실행 (newValue 사용 가능)
- didSet: 값이 변경된 직후 실행 (oldValue 사용 가능)
- 초기값을 설정할 때는 동작하지 않음

### 1-1. 기본 문법
```
var 변수명: 데이터타입 = 초기값 {
    willSet(새값) {
        // 값이 변경되기 직전에 실행
    }
    didSet {
        // 값이 변경된 직후 실행
    }
}
```

<br>


## 2️⃣ willSet과 didSet 기본 사용

### 2-1. willSet과 didSet 활용 예제
```
struct Temperature {
    var celsius: Double {
        willSet(newTemp) {
            print("온도가 \(newTemp)도로 변경됩니다.")
        }
        didSet {
            print("이전 온도: \(oldValue)도, 현재 온도: \(celsius)도")
        }
    }
}

var temp = Temperature(celsius: 25)
temp.celsius = 30
``` 
출력 결과:
```
온도가 30.0도로 변경됩니다.
이전 온도: 25.0도, 현재 온도: 30.0도
```
- willSet: 값이 변경되기 전의 값을 확인할 수 있음
- didSet: 값이 변경된 후의 값을 확인할 수 있음

<br>


## 3️⃣ willSet과 didSet의 활용 사례

### 3-1. 값 변경 시 로그 기록
```
struct User {
    var name: String {
        didSet {
            print("사용자 이름이 '\(oldValue)'에서 '\(name)'(으)로 변경됨")
        }
    }
}

var user = User(name: "Alice")
user.name = "Bob"
```
출력 결과:
```
사용자 이름이 'Alice'에서 'Bob'(으)로 변경됨
```
- didSet을 사용하여 값 변경 기록을 남길 수 있음

<br>


### 3-2. UI 업데이트 (예제: 프로그래스 바 업데이트)
```
class Progress {
    var percentage: Int = 0 {
        didSet {
            if percentage > 100 {
                percentage = 100
            } else if percentage < 0 {
                percentage = 0
            }
            print("진행률: \(percentage)%")
        }
    }
}

var progress = Progress()
progress.percentage = 50  // 진행률: 50%
progress.percentage = 110 // 진행률: 100%
progress.percentage = -10 // 진행률: 0%
```
- didSet을 사용하여 값을 특정 범위 내에서 유지할 수 있음

<br>


### 3-3. willSet을 활용한 값 유효성 검사
```
struct BankAccount {
    var balance: Int = 0 {
        willSet(newBalance) {
            print("잔액이 \(newBalance)원으로 변경될 예정입니다.")
        }
        didSet {
            if balance < 0 {
                print("잔액 부족! 이전 잔액 \(oldValue)원으로 복원됩니다.")
                balance = oldValue
            } else {
                print("잔액이 \(balance)원으로 변경되었습니다.")
            }
        }
    }
}

var myAccount = BankAccount(balance: 1000)
myAccount.balance = 500
myAccount.balance = -100
```
출력 결과:
```
잔액이 500원으로 변경될 예정입니다.
잔액이 500원으로 변경되었습니다.
잔액이 -100원으로 변경될 예정입니다.
잔액 부족! 이전 잔액 500원으로 복원됩니다.
```
- willSet: 변경될 값을 미리 확인할 수 있음
- didSet: 잘못된 값이 입력되었을 때 롤백 가능

<br>


## 4️⃣ lazy 프로퍼티와의 차이점
```
개념	설명
lazy	처음 접근할 때만 초기화됨 (didSet 사용 불가)
willSet	값 변경 직전 실행
didSet	값 변경 직후 실행

struct Example {
    lazy var data: String = "초기값"
    var value: Int = 0 {
        didSet {
            print("값 변경됨: \(value)")
        }
    }
}

var example = Example()
example.value = 10  // 값 변경됨: 10
// example.data = "새 값" // `didSet`을 사용할 수 없음
```

<br>


## 5️⃣ 클래스에서 willSet과 didSet 사용

클래스에서는 프로퍼티 옵저버를 통해 UI 업데이트 및 데이터 변경을 추적할 수 있다.
```
class User {
    var score: Int = 0 {
        willSet {
            print("점수가 \(newValue)로 변경될 예정")
        }
        didSet {
            print("이전 점수: \(oldValue), 현재 점수: \(score)")
        }
    }
}

let user = User()
user.score = 10
user.score = 20
```
출력 결과:
```
점수가 10로 변경될 예정
이전 점수: 0, 현재 점수: 10
점수가 20로 변경될 예정
이전 점수: 10, 현재 점수: 20
```

<br>
<br>


## ✔️ 실무에서의 Best Practice
1.	값 변경 감지 후 특정 동작 수행
```
var isActive: Bool = false {
    didSet {
        print(isActive ? "활성화됨" : "비활성화됨")
    }
}
```
2.	값 유효성 검사 후 자동 조정
```
var percentage: Int = 0 {
    didSet {
        percentage = min(max(percentage, 0), 100) // 0~100 사이 유지
    }
}
```
3.	UI 업데이트와 함께 활용
```
var volume: Int = 50 {
    didSet {
        print("볼륨이 \(volume)%로 변경됨")
        // 볼륨 UI 업데이트 코드 추가 가능
    }
}
```

<br>


## ✔️ 정리

|개념|설명|
|-|-|
|willSet|	값이 변경되기 직전 실행 (newValue 사용 가능)|
|didSet|	값이 변경된 직후 실행 (oldValue 사용 가능)|
|초기화 시 동작 여부|	willSet, didSet은 초기화 시 실행되지 않음|
|유효성 검사|	didSet에서 조건을 추가하여 유효성 검증 가능|
|UI 업데이트|	값이 변경될 때 didSet을 활용하여 UI 업데이트 가능|

