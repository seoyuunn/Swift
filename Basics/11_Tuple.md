# Swift 튜플 (Tuple) – 튜플의 활용과 유용한 사용 예제
튜플(Tuple)은 여러 개의 값을 하나의 그룹으로 묶어 저장할 수 있는 데이터 구조.  
배열(Array)와 딕셔너리(Dictionary)와는 달리, 튜플은 서로 다른 타입의 값도 함께 저장할 수 있다.

## 1️⃣ 튜플 선언 및 기본 사용법
### 1-1. 기본 튜플 선언
```
let person = ("Alice", 28, true)
print(person) // ("Alice", 28, true)
```
- "Alice" → String
- 28 → Int
- true → Bool
튜플은 여러 개의 서로 다른 타입의 값을 하나의 단위로 묶을 때 유용하다.

### 1-2. 튜플 값 접근 (Index)
```
print(person.0) // Alice
print(person.1) // 28
print(person.2) // true
```
- 튜플은 0부터 시작하는 인덱스를 사용하여 각 값에 접근 가능
- 배열과 달리 크기가 고정되며, 특정 값만 변경할 수 없음

<br>

## 2️⃣ 튜플의 요소에 이름 지정
튜플 요소에 이름을 부여하면 더 직관적으로 값에 접근할 수 있다.

### 2-1. 이름이 있는 튜플 선언
```
let personInfo = (name: "Bob", age: 32, isMarried: false)
```
### 2-2. 이름을 사용하여 값 접근
```
print(personInfo.name) // Bob
print(personInfo.age) // 32
print(personInfo.isMarried) // false
```
- 가독성이 증가하며, 인덱스보다 명확하게 값에 접근 가능

<br>

## 3️⃣ 튜플의 값 변경 (var 사용)
튜플이 var로 선언되었을 경우, 개별 값을 변경할 수 있다.
```
var user = (id: 101, name: "Charlie", isActive: true)

// 값 변경
user.name = "David"
user.isActive = false

print(user) // (id: 101, name: "David", isActive: false)
```
- 튜플 전체를 변경하는 것은 불가능하며, 개별 요소만 변경 가능

<br>

## 4️⃣ 튜플 활용 예제

### 4-1. 함수에서 여러 값 반환
튜플은 함수에서 여러 개의 값을 반환할 때 유용하다.
```
func getUser() -> (String, Int) {
    let name = "Alice"
    let age = 25
    return (name, age)
}

let user = getUser()
print("이름: \(user.0), 나이: \(user.1)") // 이름: Alice, 나이: 25
```
### 4-2. 튜플을 활용한 다중 값 반환 (이름 지정)
튜플에 이름을 지정하면 더 가독성이 좋아진다.
```
func getPerson() -> (name: String, age: Int) {
    return ("Bob", 30)
}

let person = getPerson()
print("이름: \(person.name), 나이: \(person.age)") // 이름: Bob, 나이: 30
```
- 딕셔너리 대신 간단하게 여러 값을 반환할 때 유용

<br>

## 5️⃣ 튜플과 변수 분해 (Tuple Destructuring)
튜플을 변수에 저장할 때 각 요소를 개별 변수로 분리하여 저장 가능.

### 5-1. 튜플 분해 (Destructuring)
```
let (username, userAge) = getUser()
print("이름: \(username), 나이: \(userAge)") // 이름: Alice, 나이: 25
```
### 5-2. 일부 값 무시 (_ 사용)
튜플에서 특정 값이 필요 없을 경우 _를 사용하여 무시할 수 있다.
```
let (onlyName, _) = getUser()
print("이름: \(onlyName)") // 이름: Alice
```

<br>

## 6️⃣ 튜플 비교 및 활용
튜플은 비교 연산을 지원한다.  
튜플의 각 요소를 순차적으로 비교하여 결과를 반환한다.

### 6-1. 튜플 비교 연산
```
print((1, "Apple") < (2, "Banana")) // true (1 < 2)
print((3, "Orange") > (3, "Grape")) // true ("Orange" > "Grape")
```
- 튜플의 첫 번째 요소를 비교하고, 같으면 두 번째 요소를 비교함.

<br>

## 7. 튜플을 활용한 스위치문 (Switch + Tuple)
튜플을 사용하면 스위치문에서 복합적인 조건을 간결하게 처리할 수 있다.

### 7-1. 좌표를 기반으로 위치 판단
```
let point = (2, 0)

switch point {
case (0, 0):
    print("원점입니다.")
case (_, 0):
    print("X축 위에 있습니다.")
case (0, _):
    print("Y축 위에 있습니다.")
case (1...5, 1...5):
    print("1~5 범위 내에 있습니다.")
default:
    print("좌표가 범위를 벗어났습니다.")
}

// 출력: X축 위에 있습니다.
```
- 튜플을 활용하면 여러 조건을 한 번에 처리 가능
- _(와일드카드) 사용 → 특정 요소를 무시하고 비교할 수 있음
- 범위 연산자(1...5) 사용 가능 → 숫자 범위 체크 가능

<br>
<br>

## ✔️ 실무에서의 Best Practice
1.	여러 개의 값을 반환할 때 딕셔너리보다 가볍게 사용
```
func getUser() -> (String, Int) {
    return ("Alice", 28)
}
```
2.	튜플 분해(Destucturing)로 가독성을 높이기
```
let (name, age) = getUser()
print("이름: \(name), 나이: \(age)")
```
3.	스위치문에서 여러 조건을 효율적으로 처리
```
let location = (x: 3, y: 5)
switch location {
case (0, 0): print("원점")
case (_, 0): print("X축 위")
case (0, _): print("Y축 위")
default: print("일반 좌표")
}
```

## ✔️ 정리

|개념|설명|
|-|-|
|튜플 선언|	let person = ("Alice", 28, true)|
|요소 접근|	person.0, person.1|
|요소 이름 지정|	let user = (name: "Bob", age: 32)|
|요소 변경|	var user.name = "Charlie"|
|다중 반환|	func getUser() -> (String, Int)|
|변수 분해|	let (name, age) = getUser()|
|스위치문 활용|	case (x, y) 형태로 사용 가능|
