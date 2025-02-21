Swift에서 변수(Variable)와 상수(Constant)는 데이터를 저장하는 기본적인 방법.  
Swift는 타입 안정성을 보장하면서도, 타입 추론(Type Inference)을 통해 코드를 간결하게 작성할 수 있도록 설계되었다.

# 1️⃣ 변수(Variable)와 상수(Constant)
Swift에서는 데이터를 저장할 때 변수(var) 또는 상수(let) 을 사용한다.  
<br>


**변수 (var) - 변경 가능한 값**
- var 키워드를 사용하여 선언.
- 한번 선언한 후 값을 변경할 수 있음.
- Swift에서 변수를 선언하면 해당 변수의 데이터 타입이 결정되며, 한 번 지정된 타입은 변경할 수 없다. 따라서 문자열로 선언된 변수에 정수 값을 할당할 수 없고, 정수로 선언된 변수에 문자열 값을 할당할 수도 없다.
```
var name = "Alice"
print(name) // Alice

name = "Bob" // 변경 가능
print(name) // Bob
```
<br>


**상수 (let) - 변경 불가능한 값**
- let 키워드를 사용하여 선언.
- 한번 선언한 후 값을 변경할 수 없음. (불변)
```
let pi = 3.14159
print(pi) // 3.14159

pi = 3.14 // 오류! 'let'으로 선언한 값은 변경할 수 없음.
```
- 팁
  - 가능하면 항상 let을 기본적으로 사용하고, 값이 변해야 할 필요가 있을 때만 var를 사용.
  - 이렇게 하면 불필요한 값 변경을 방지하고, 코드의 안정성을 높일 수 있다.
<br>


# 2️⃣ Swift 기본 데이터 타입
<br>


우선 메모리(Memory)란,
- 0과 1을 저장할 수 있는 반도체.
- 전압 차이를 이용해서 데이터를 저장한다.
- 전기가 들어오면 1을, 들어오지 않으면 0을 저장한다.


Bit란,
- 0 이나 1을 저장할 수 있는 가장 작은 공간.
- 컴퓨터 공학에서 정보의 기본 단위.


Byte란,
- Bit가 8개 모인 공간.
- 프로그래밍 언어에서 사용하는 기본 단위.
- 1byte에는 얼만큼의 값을 저장할 수 있을까?
  - 256개
    - 양수만 저장하는 경우 0에서 255까지
    - 양수 음수 모두 저장하는 경우 -128에서 127까지
<br>

## Data Type / 타입 / 자료형
변수나 값이 가질 수 있는 데이터의 종류를 정의하는 개념.   
프로그래밍에서 변수를 선언할 때 자료형을 지정하는 이유는 **적절한 크기의 메모리를 할당**하기 위해서다.  
### 기본 자료형
- `Int`	정수  (예: 10, -5)
- `Double`	실수, 소수점 포함 (예: 3.14, 2.718)
- `Float`	소수점 포함이지만 더 적은 정밀도
- `Bool`	논리 값 (true 또는 false)
- `String`	문자열 (예: "Swift", "Hello")
- `Character`	한 글자만 저장 가능 (예: 'A', '😊')
```
var age: Int = 25
var temperature: Double = 36.5
var isSwiftFun: Bool = true
var greeting: String = "Hello, Swift!"
var letter: Character = "S"
```
- 각 자료형은 고정된 크기의 메모리를 사용한다.
- 같은 데이터를 표현하더라도 더 큰 자료형을 사용하면 불필요하게 메모리를 차지하게 된다.
### 효율적인 자료형 선택이 중요한 이유
1. 메모리 절약
- 메모리는 한정적이므로, 너무 큰 자료형을 사용하면 낭비된다.
- 특히, 대량의 데이터를 다룰 때는 작은 자료형을 선택하는 것이 효율적이다.
2. 처리 속도 최적화
- CPU는 특정 크기의 데이터(예: 32bit, 64bit)를 더 빠르게 처리한다.
- 불필요하게 큰 자료형을 사용하면 CPU가 추가적인 연산을 해야 할 수도 있다.
3. 오버플로우 방지
- 자료형에는 저장할 수 있는 값의 범위가 있다.
- 예를 들어, short는 -32,768 ~ 32,767까지 저장할 수 있지만, 이 범위를 초과하면 오버플로우가 발생한다.
<br>


Swift는 타입 관련 오류를 방지하는 강력한 기능을 제공한다.
## 2-1. 타입 안정성(Type Safety)
Swift는 코드 실행 중 타입 관련 오류가 발생하는 것을 방지한다.
```
var numbers: [Int] = [1, 2, 3]
numbers.append("four")  // ❌ 오류 발생 (String을 Int 배열에 추가할 수 없음)
```
- Swift에서는 배열에 선언된 타입 외의 값을 추가할 수 없다.
- 이는 코드의 안정성을 보장하고 예상치 못한 오류를 방지한다.

## 2-2. 타입 추론(Type Inference)
Swift는 타입을 명시적으로 지정하지 않아도, 컴파일러가 자동으로 타입을 추론한다.
```
var message = "Hello, Swift!" // String으로 추론
var score = 95 // Int로 추론
var pi = 3.14 // Double로 추론
var isCompleted = false // Bool로 추론
```
- 왜 타입 추론을 사용할까?
  - 코드를 간결하게 유지할 수 있음.
  - 하지만, 가독성을 위해 명시적으로 타입을 지정하는 것이 좋을 때도 있음.
```
var discount: Float = 3.5 // 명확하게 Float로 지정
```
## 2-3. 타입 변환(Type Conversion)
Swift는 자동 타입 변환을 지원하지 않음.
따라서, 직접 변환해야 한다.
```
let intNumber = 10
let doubleNumber = Double(intNumber) // Int → Double 변환
print(doubleNumber) // 10.0

let str = "42"
if let intValue = Int(str) { // String → Int 변환 (옵셔널)
    print(intValue) // 42
} else {
    print("변환 실패")
}
```
## 2.4 옵셔널(Optional) - 값이 있을 수도, 없을 수도 있음

Swift에서는 nil(값 없음)을 안전하게 다룰 수 있도록 옵셔널(Optional) 개념을 제공한다..
```
var optionalName: String? = nil
optionalName = "Charlie"

if let name = optionalName { // 옵셔널 바인딩
    print("이름: \(name)")
} else {
    print("이름이 없습니다.")
}
```
- 일반 String 변수는 nil을 가질 수 없지만, String? (옵셔널 타입)으로 선언하면 nil을 가질 수 있다.
- Optional은 Swift의 강력한 타입 시스템을 보여주는 대표적인 기능 중 하나다.


- 팁
  -  가능하면 let 사용 → 불필요한 값 변경 방지.
  - 타입 추론 활용 → 가독성을 유지하되, 혼동될 경우 명시적 타입 지정.
  - 옵셔널을 안전하게 처리 → if let 또는 guard let 사용.
  - 필요할 때만 var 사용 → 불필요한 변경을 최소화하여 코드 안정성 향상.



- 정리
  -  개념	설명
  -  var	변수, 변경 가능
  -  let	상수, 변경 불가능
  -  타입 추론	Swift가 자동으로 타입 결정
  -  타입 변환	다른 타입으로 변환할 때 명시적으로 변환 필요
  -  옵셔널	값이 없을 수도 있는 변수를 다루는 방법
