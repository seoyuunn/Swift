# Swift 기본 데이터 타입 (Int, Double, String, Bool, 형 변환)

Swift에서는 변수를 선언할 때 명확한 데이터 타입을 갖도록 설계되어 있다.
<br>


## 1. 기본 데이터 타입 (Primitive Data Types)
- `Int`	정수 타입 (예: 10, -5)
- `Double`	실수 타입, 소수점 포함 (예: 3.14, 2.718)
- `Float`	실수 타입, Double보다 정밀도 낮음
- `Bool`	논리 값 (true 또는 false)
- `String`	문자열 (예: "Swift", "Hello")
- `Character`	단일 문자 (예: 'A', '😊')
<br>


- 각 데이터 타입을 직접 선언하는 방법
```
var age: Int = 28
var pi: Double = 3.14159
var temperature: Float = 36.5
var isSwiftFun: Bool = true
var message: String = "Hello, Swift!"
var letter: Character = "S"

print(age, pi, temperature, isSwiftFun, message, letter)
```
- Swift는 정수 기본 타입을 Int, 실수 기본 타입을 Double로 사용
- Float은 Double보다 정밀도가 낮으므로, 일반적으로 Double을 사용하는 것이 좋음

## 2. 정수 (Int)

Swift의 Int는 플랫폼에 따라 32비트 또는 64비트 정수. 명시적인 크기를 지정할 수도 있다.

- 정수 타입 예제
```
var smallNumber: Int8 = 127   // 8비트 정수 (-128 ~ 127)
var bigNumber: Int64 = 9223372036854775807   // 64비트 정수
var defaultInt = 100 // 기본적으로 Int 타입
```
- 정수 타입의 최대/최소값 확인
```
print(Int8.min, Int8.max)   // -128, 127
print(Int64.min, Int64.max) // -9223372036854775808, 9223372036854775807
```

## 3. 실수 (Double, Float)
Swift에서 Double과 Float 모두 실수를 다루지만, Double이 기본 타입.  
- 실수 타입 예제
```
var doubleValue: Double = 3.141592653589793
var floatValue: Float = 3.1415927  // Float는 정밀도가 낮음

print(doubleValue) // 3.141592653589793
print(floatValue)  // 3.141593
```
- 팁
  - Double은 64비트 부동소수점, Float은 32비트 부동소수점을 사용.
  - 실수 연산에서 정밀도가 중요하다면 항상 Double을 사용하는 것이 좋음.
<br>


## 4. 문자열 (String)
Swift의 String은 유니코드를 지원하는 강력한 문자열 타입.  
- 문자열 선언
```
var greeting: String = "Hello, Swift!"
```
- 문자열 연결
```
var firstName = "John"
var lastName = "Doe"
var fullName = firstName + " " + lastName
print(fullName) // "John Doe"
```
- 문자열 보간(Interpolation)
```
var age = 28
var message = "나는 \(age)살입니다."
print(message) // "나는 28살입니다."
```
## 5. 논리값 (Bool)
Swift에서는 true 또는 false 값만을 가지는 Bool 타입이 있다.
- Bool 타입 예제
```
var isSwiftGreat: Bool = true
var isNight: Bool = false

if isSwiftGreat {
    print("Swift는 멋진 언어입니다!")
}
```
- 팁
  - if 조건문에서 true/false를 직접 사용하면 가독성이 좋음.
  - Bool 값은 1 또는 0과 직접 비교하지 않도록 해야 함. (if isNight == true 대신 if isNight 사용)
<br>


## 6. 형 변환 (Type Conversion)
Swift는 자동 형 변환을 지원하지 않으며, 직접 변환해야 한다.  
- 정수 ↔ 실수 변환
```
let intNumber = 10
let doubleNumber = Double(intNumber) // Int → Double 변환
print(doubleNumber) // 10.0

let floatNumber: Float = 3.14
let intValue = Int(floatNumber) // Float → Int 변환 (소수점 버려짐)
print(intValue) // 3
```
- 숫자 ↔ 문자열 변환
```
let number = 42
let strNumber = String(number) // 숫자 → 문자열 변환
print(strNumber) // "42"

let str = "100"
if let intValue = Int(str) { // 문자열 → 정수 변환 (옵셔널)
    print(intValue) // 100
} else {
    print("변환 실패")
}
```
- 팁
  - Double → Int 변환 시 소수점이 버려짐(내림).
  - String → Int 변환은 옵셔널(Int?)을 반환하므로, if let을 사용해야 안전함.
<br >


✅ 실무에서의 Best Practice
1. 정수 연산에서는 Int, 실수 연산에서는 Double을 사용 → Float은 정밀도가 낮아 사용을 지양.
2.	형 변환(Type Conversion)은 명시적으로 수행 → Swift는 자동 변환을 지원하지 않음.
3.	문자열을 활용할 때는 보간(Interpolation)을 적극 활용 → "\(변수)" 방식으로 가독성 향상.
4.	숫자 → 문자열 변환은 String(), 문자열 → 숫자 변환은 Int()를 사용하되 옵셔널을 고려.
<br>

