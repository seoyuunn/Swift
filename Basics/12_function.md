# Swift 함수(Function)의 기초 – func, 매개변수, 반환값
함수(Function)는 특정 기능을 수행하는 코드 블록으로, 코드의 재사용성을 높이고 가독성을 향상시키는 역할을 한다.  
Swift에서는 func 키워드를 사용하여 함수를 정의할 수 있다.

<br>

## 1️⃣ 함수의 기본 구조

### 1-1. 기본 함수 선언
```
func sayHello() {
    print("안녕하세요!")
}
```
- func 키워드를 사용하여 함수 선언
- sayHello() → 함수의 이름
- {} 내부에 실행할 코드 작성

### 1-2. 함수 호출
```
sayHello() // 출력: 안녕하세요!
```
- 선언된 함수를 호출하려면 함수 이름을 사용하면 된다.

<br>

## 2️⃣ 매개변수가 있는 함수

### 2-1. 매개변수(Parameter) 선언
```
func greet(name: String) {
    print("안녕하세요, \(name)님!")
}
```
### 2-2. 매개변수를 사용한 함수 호출
```
greet(name: "Alice") // 출력: 안녕하세요, Alice님!
```
- 함수 호출 시, 매개변수 이름을 명시적으로 작성해야 함
- greet("Alice") → ❌ 오류 발생 (name: 생략 불가)

<br>

## 3️⃣ 반환값이 있는 함수

### 3-1. 반환값(Return Value) 사용
```
func add(a: Int, b: Int) -> Int {
    return a + b
}
```
### 3-2. 반환값 활용
```
let result = add(a: 3, b: 5)
print(result) // 출력: 8
```
- -> Int → 함수가 Int 타입의 값을 반환함을 명시
- return 키워드를 사용하여 값을 반환

<br>

## 4️⃣ 여러 개의 반환값 (튜플 사용)

### 4-1. 튜플을 이용한 다중 반환
```
func getUserInfo() -> (name: String, age: Int) {
    return ("Bob", 30)
}
```
### 4-2. 반환값 사용
```
let user = getUserInfo()
print("이름: \(user.name), 나이: \(user.age)") // 출력: 이름: Bob, 나이: 30
```
- 함수가 여러 개의 값을 반환할 때 튜플을 사용하면 편리함

<br>


## 5️⃣ 매개변수 기본값(Default Parameter)

### 5-1. 기본값이 있는 매개변수
```
func introduce(name: String, age: Int = 25) {
    print("안녕하세요, 저는 \(name)이고 \(age)살입니다.")
}
```
### 5-2. 기본값 활용
```
introduce(name: "Charlie") // 기본값 사용: 안녕하세요, 저는 Charlie이고 25살입니다.
introduce(name: "David", age: 30) // 기본값 변경: 안녕하세요, 저는 David이고 30살입니다.
```
- age 매개변수에 기본값을 설정하여, 인자가 생략될 경우 기본값을 사용하도록 함

<br>


## 6️⃣ 내부 & 외부 매개변수 이름

### 6-1. 내부 매개변수와 외부 매개변수 지정
```
func multiply(_ num1: Int, by num2: Int) -> Int {
    return num1 * num2
}
```
6-2. 외부 매개변수 활용
```
let result = multiply(3, by: 5)
print(result) // 출력: 15
```
- 	_ 사용 시, 첫 번째 매개변수는 외부에서 이름 생략 가능
- 	by 키워드 추가하여 가독성을 높임

<br>


## 7️⃣ 가변 매개변수 (Variadic Parameter)

### 7-1. 여러 개의 값을 받는 함수
```
func sum(_ numbers: Int...) -> Int {
    return numbers.reduce(0, +)
}
```
### 7-2. 가변 매개변수 함수 호출
```
let total = sum(1, 2, 3, 4, 5)
print(total) // 출력: 15
```
- Int... → 여러 개의 Int 값을 가변적으로 받을 수 있음
- reduce(0, +) → 모든 값을 더함

<br>


## 8️⃣ 반환값이 없는 함수

### 8-1. Void 반환 타입 명시
```
func logMessage() -> Void {
    print("로그 메시지 출력")
}
```
## 8-2. Void 생략 가능
```
func logMessage() {
    print("로그 메시지 출력")
}
```
- Swift에서는 -> Void를 생략할 수 있음

<br>


## 9️⃣ inout 매개변수 (변경 가능한 매개변수)

### 9-1. inout 사용하여 값 변경
```
func doubleValue(_ number: inout Int) {
    number *= 2
}
```
### 9-2. inout 함수 호출
```
var myNumber = 5
doubleValue(&myNumber) // &를 붙여야 함
print(myNumber) // 출력: 10
```
- inout을 사용하면 함수 내부에서 매개변수 값을 직접 변경 가능
- 호출할 때 & 기호를 붙여야 함

<br>
<br>


## ✔️ 실무에서의 Best Practice
1.	매개변수 기본값을 설정하여 유연한 함수 만들기
```
func greet(name: String, message: String = "환영합니다!") {
    print("\(name)님, \(message)")
}
```
2.	외부 매개변수를 사용하여 가독성을 높이기
```
func calculateArea(width: Double, height: Double) -> Double {
    return width * height
}
```
3.	가변 매개변수를 활용하여 여러 값 처리
```
func sum(_ numbers: Int...) -> Int {
    return numbers.reduce(0, +)
}
```
4.	튜플을 사용하여 여러 값을 반환
```
func getMinMax(numbers: [Int]) -> (min: Int, max: Int) {
    return (numbers.min() ?? 0, numbers.max() ?? 0)
}
```

<br>

## ✔️ 정리

|개념|설명|
|-|-|
|함수 선언|	func sayHello() { }|
|매개변수|	func greet(name: String) { }|
|반환값|	func add(a: Int, b: Int) -> Int { }|
|다중 반환|	튜플 사용: -> (name: String, age: Int)|
|기본값|	func introduce(name: String, age: Int = 25)|
|외부 매개변수|	func multiply(_ num1: Int, by num2: Int) -> Int|
|가변 매개변수|	func sum(_ numbers: Int...) -> Int|
|inout 매개변수|	func modify(_ value: inout Int)|
