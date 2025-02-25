# Swift 조건문 (if, switch) – 조건문 활용법 및 switch 패턴 매칭
조건문은 프로그램의 흐름을 제어하는 중요한 요소.  
Swift에서는 if문과 switch문을 사용하여 조건을 평가하고 실행할 코드를 결정할 수 있다.  
<br>


## 1️⃣ if 조건문 (If Statement)
if문은 특정 조건이 true일 때만 실행된다.

✅ if 기본 구조
```
if 조건 {
    // 조건이 true일 때 실행되는 코드
}
```
✅ if - else 예제
```
let age = 20

if age >= 18 {
    print("성인입니다.")
} else {
    print("미성년자입니다.")
}

// 출력: 성인입니다.
```
✅ if - else if - else 예제  
여러 개의 조건을 평가할 때는 else if를 사용한다.
```
let score = 85

if score >= 90 {
    print("A 학점")
} else if score >= 80 {
    print("B 학점")
} else if score >= 70 {
    print("C 학점")
} else {
    print("F 학점")
}

// 출력: B 학점
```
✅ if 문에서 논리 연산자 (&&, ||) 사용
```
let isRainy = true
let hasUmbrella = false

if isRainy && hasUmbrella {
    print("우산이 있으니 비를 피할 수 있어요.")
} else if isRainy && !hasUmbrella {
    print("우산이 없어서 비를 맞아요.")
} else {
    print("비가 오지 않아요.")
}

// 출력: 우산이 없어서 비를 맞아요.
```
<br>


## 2️⃣ switch 조건문 (Switch Statement)
switch문은 하나의 값을 여러 패턴과 비교할 때 유용하다.  
Swift의 switch문은 break가 필요 없으며, 더 강력한 패턴 매칭을 지원한다.  
<br>


✅ switch 기본 구조
```
switch 값 {
case 패턴1:
    실행할 코드
case 패턴2:
    실행할 코드
default:
    실행할 코드 (옵션, 모든 경우를 처리)
}
```
✅ switch문 기본 예제
```
let grade = "B"

switch grade {
case "A":
    print("훌륭한 성적입니다!")
case "B":
    print("좋은 성적입니다.")
case "C":
    print("괜찮은 성적입니다.")
default:
    print("더 노력해야 합니다.")
}

// 출력: 좋은 성적입니다.
```
💡 주의: switch문에서는 반드시 모든 경우를 처리해야 하므로, default를 사용하거나 모든 가능성을 커버해야 한다.  
<br>


## 3️⃣ switch의 패턴 매칭 (Pattern Matching)
Swift의 switch문은 단순한 값 비교뿐만 아니라 **범위(range)**, **튜플(tuple)**, **where 조건**, **열거형(enum)** 과 함께 사용할 수 있다.  
<br>


✅ 3-1. 범위(Range) 활용
```
let score = 85

switch score {
case 90...100:
    print("A 학점")
case 80..<90:
    print("B 학점")
case 70..<80:
    print("C 학점")
default:
    print("F 학점")
}

// 출력: B 학점
```
💡 90...100: 90부터 100까지 포함 (Closed Range)  
💡 80..<90: 80부터 90 “미만”까지 포함 (Half-Open Range)  
<br>


✅ 3-2. 튜플(Tuple)과 패턴 매칭  
튜플을 사용하면 여러 값을 한 번에 비교할 수 있다.
```
let coordinates = (2, 3)

switch coordinates {
case (0, 0):
    print("원점입니다.")
case (0, _):
    print("Y축 위에 있습니다.")
case (_, 0):
    print("X축 위에 있습니다.")
case (1...5, 1...5):
    print("1~5 범위 내에 있습니다.")
default:
    print("좌표는 범위를 벗어났습니다.")
}

// 출력: 1~5 범위 내에 있습니다.
```
🔹 튜플의 _(와일드카드): 특정 요소는 무시하고 비교할 수 있음.
🔹 범위 연산자: (1...5, 1...5)처럼 특정 범위를 비교 가능.

 ✅ 3-3.  where 키워드 활용  
where를 사용하면 더 정교한 조건을 설정할 수 있다.
```
let number = 25

switch number {
case let x where x % 2 == 0:
    print("\(x)는 짝수입니다.")
case let x where x % 2 != 0:
    print("\(x)는 홀수입니다.")
default:
    print("숫자가 아닙니다.")
}

// 출력: 25는 홀수입니다.
```
💡 where 조건을 사용하면 특정 조건을 만족하는 경우만 실행할 수 있다.

✅ 3-4. 열거형(Enum)과 switch  
Swift의 enum과 switch는 궁합이 매우 좋다.  
```
enum Direction {
    case north, south, east, west
}

let currentDirection = Direction.north

switch currentDirection {
case .north:
    print("북쪽으로 이동합니다.")
case .south:
    print("남쪽으로 이동합니다.")
case .east:
    print("동쪽으로 이동합니다.")
case .west:
    print("서쪽으로 이동합니다.")
}

// 출력: 북쪽으로 이동합니다.
```
💡 switch문에서 enum을 사용할 때는 Direction.을 생략 가능하다.  
<br>


✅ 실무에서의 Best Practice
1.	단순 조건문 → if 사용
- 한두 개의 조건만 비교할 때는 if 문이 더 간결하고 가독성이 좋음.
2.	여러 가지 경우 비교 → switch 사용
- switch는 if-else if-else보다 가독성이 좋고 확장성이 높음.
- 특히, enum, 튜플, 범위 연산자, where 조건을 활용하면 더욱 강력한 조건 매칭 가능.
3.	switch문은 모든 경우를 커버해야 함
- default를 사용하여 예외 처리를 추가하는 것이 중요.
<br>


🏁 정리
- 개념	설명
- if 조건문	특정 조건이 true일 때 코드 실행
- if - else	조건이 참이면 if 실행, 거짓이면 else 실행
- if - else if - else	여러 개의 조건을 평가
- switch 문	하나의 값을 여러 경우와 비교
- switch + 범위	90...100 같은 범위 연산 가능
- switch + 튜플	(x, y)처럼 여러 값 비교 가능
- switch + where	특정 조건을 추가적으로 설정 가능
- switch + enum	열거형 값에 따라 실행 분기
