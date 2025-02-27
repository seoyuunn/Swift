# Swift 옵셔널 (Optional) – 개념과 활용 (nil, Optional Binding, guard let, ?? 연산자)
Swift에서 옵셔널(Optional) 은 값이 있을 수도 있고 없을 수도 있는 변수 타입을 의미한다.  
nil을 안전하게 다루기 위해 옵셔널이 도입되었으며, Swift는 nil을 허용하지 않는 타입 시스템을 갖고 있다.

<br>

📌 정리 - 개념설명
- 옵셔널(?): 	값이 있을 수도 있고 없을 수도 있는 변수
- 강제 언래핑(!): 	옵셔널을 강제로 해제 (nil이면 크래시 발생)
- 옵셔널 바인딩 (if let): 	nil이 아닐 때 안전하게 값을 꺼내서 사용
- guard let: 	nil이면 조기 종료, 이후 코드에서 안전하게 사용 가능
- ?? 연산자: 	nil일 경우 기본값 제공
- 옵셔널 체이닝(?.):	안전하게 프로퍼티, 메서드 접근

<br>

## 1️⃣ 옵셔널 (Optional) 개념과 nil

### 1-1. nil이란?
  - Swift에서는 nil이 “값이 없음”을 의미하는 특별한 값.
  - 하지만, 일반적인 Int, String 같은 타입에는 nil을 저장할 수 없다.
```
var name: String = "Alice"
name = nil // 오류! String 타입에는 nil을 저장할 수 없음
```

<br>

### 1-2. 옵셔널이란?
  - 옵셔널은 값이 있을 수도 있고 없을 수도 있는(nil) 변수를 나타낸다.
  - 옵셔널은 ?를 사용하여 선언한다.
```
var optionalName: String? = nil // nil 저장 가능
optionalName = "Bob" // 값 할당 가능
```
💡 정리:
- 일반 변수 → nil 저장 불가
- 옵셔널 변수(? 사용) → nil 저장 가능

<br>
<br>

## 2️⃣ 옵셔널 변수 선언

옵셔널 변수는 다음과 같이 선언할 수 있다.
```
var age: Int? = nil // 옵셔널 정수
var message: String? = "Hello" // 옵셔널 문자열
```
옵셔널 변수를 출력하면 Optional() 형태로 출력된다.
```
print(message) // Optional("Hello")
```
- 옵셔널 값을 직접 사용하려면 반드시 해제(unwrap)해야 한다.
- 옵셔널을 해제하는 방법에는 강제 언래핑, 옵셔널 바인딩, guard let, ??(nil 병합 연산자) 가 있다.

<br>
<br>

## 3️⃣ 옵셔널 값 사용 방법
### 3-1. 강제 언래핑 (Forced Unwrapping)
- !를 사용하여 옵셔널 값을 강제로 해제할 수 있다.
- 하지만, nil일 경우 런타임 오류가 발생할 수 있으므로 사용을 지양해야 한다.
```
var optionalNumber: Int? = 10
print(optionalNumber!) // 10 (옵셔널 해제)
```
🔴 주의: 옵셔널이 nil일 경우, 강제 언래핑(!)하면 크래시 발생!
```
var emptyValue: String? = nil
print(emptyValue!) // 런타임 오류 (Fatal error: Unexpectedly found nil while unwrapping an Optional value)
```

<br>

### 3-2. 옵셔널 바인딩 (if let)
- 옵셔널 값을 안전하게 사용하려면 if let을 활용한 옵셔널 바인딩을 사용한다.
- 값이 nil이 아닐 경우 자동으로 언래핑되어 안전하게 사용 가능하다.
```
var userName: String? = "Alice"

if let name = userName {
    print("사용자 이름: \(name)") // "사용자 이름: Alice"
} else {
    print("이름이 없습니다.")
}
```
✅ 장점:
- if let 내부에서 name은 String 타입으로 안전하게 사용 가능.
- nil이면 else 블록이 실행됨.

<br>

### 3-3. guard let – 조기 종료 방식
- guard let은 함수에서 초기에 옵셔널을 확인하고, nil이면 빠르게 return하는 방식이다.
- if let과 달리 옵셔널이 nil이면 조기에 함수를 종료한다.
```
func greet(_ name: String?) {
    guard let validName = name else {
        print("이름이 없습니다.")
        return
    }
    print("안녕하세요, \(validName)님!")
}

greet("Charlie") // "안녕하세요, Charlie님!"
greet(nil)       // "이름이 없습니다."
```
✅ 장점:
- 코드 흐름을 더 깔끔하게 유지.
- else 블록에서 반드시 return, throw, fatalError() 중 하나를 호출해야 함.
- guard let을 사용하면, 이후 코드에서 validName을 안전하게 사용할 수 있음.

<br>

### 3-4. ?? (nil 병합 연산자, Nil-Coalescing Operator)
- ?? 연산자는 옵셔널이 nil일 경우 기본값을 제공하는 연산자.
```
let nickname: String? = nil
let defaultName = "Guest"

let displayName = nickname ?? defaultName
print(displayName) // "Guest"
```
✅ 장점:
- nil이 아닐 경우 옵셔널 값을 사용.
- nil일 경우 기본값을 사용하여 안전하게 처리.

<br>

### 3-5. ?? vs if let 비교:
```
var input: String? = nil

// if let 방식
if let value = input {
    print(value)
} else {
    print("기본값")
}

// ?? 연산자 방식
print(input ?? "기본값")
```
- ?? 연산자는 더 간결하고 직관적이다.

<br>
<br>

## 4️⃣ 옵셔널 활용 예제

### 4-1. 옵셔널을 활용한 딕셔너리 조회
```
let users = ["Alice": 25, "Bob": 30]
let age = users["Charlie"] // 없는 키 조회 → nil 반환

print(age ?? "정보 없음") // "정보 없음"
```
💡 딕셔너리에서 존재하지 않는 키를 조회할 경우 기본값을 제공하는 데 유용.

<br>

### 4-2. 옵셔널 체이닝 (Optional Chaining)
옵셔널 프로퍼티를 연쇄적으로 호출할 때 안전하게 접근할 수 있다.

```
class Person {
    var name: String?
}

let person = Person()
print(person.name?.uppercased() ?? "이름 없음") // "이름 없음"
```
- name?.uppercased() → name이 nil이면 nil 반환.
- ?? 연산자로 기본값 제공 → "이름 없음" 출력.

<br>
<br>

✔️ 실무에서의 Best Practice
1.	강제 언래핑(!)을 최대한 지양
  - nil일 경우 크래시가 발생할 수 있음.
2.	옵셔널 바인딩 (if let)과 guard let을 적극 활용
  - if let은 특정 블록 내에서만 사용 가능.
  - guard let은 조기 종료 방식으로 함수에서 널리 사용.
3.	?? 연산자를 적극 활용하여 기본값 제공
  - nil 발생 가능성이 있는 변수에 기본값을 적용하면 코드가 간결해짐.
4.	옵셔널 체이닝을 활용하여 안전한 프로퍼티 접근
  - someObject?.property?.method() 형식으로 사용하면 안전하게 접근 가능.

<br>

