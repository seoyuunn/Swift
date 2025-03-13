# Swift 클로저 (Closure) 기초 – 클로저 기본 문법, 후행 클로저, 캡처 리스트

클로저(Closure)는 이름이 없는 익명 함수(Anonymous Function) 로, 변수나 상수에 할당하거나 함수의 매개변수로 전달할 수 있다.  
Swift에서는 고차 함수(map, filter, reduce)와 함께 사용되며, 캡처 리스트를 통해 메모리 관리도 가능하다.  

<br>


## 1️⃣ 클로저 기본 문법 (Closure Syntax)

### 1-1. 클로저 기본 형태
```
{ (매개변수) -> 반환타입 in
    실행할 코드
}
```
- {} → 클로저의 시작과 끝을 나타냄
- (매개변수) -> 반환타입 → 입력과 출력 정의
- in → 매개변수와 실행 코드 구분
- 실행할 코드 → {} 내부에서 실행할 코드 작성

<br>


### 1-2. 기본 클로저 예제
```
let greeting = { (name: String) -> String in
    return "안녕하세요, \(name)님!"
}

print(greeting("Alice")) // 출력: 안녕하세요, Alice님!
```
- greeting 변수에 클로저를 저장하고, 매개변수 "Alice"를 전달하여 실행

<br>


## 2️⃣ 클로저 축약 표현 (Shorthand Syntax)

Swift에서는 클로저를 더욱 간결하게 표현할 수 있는 문법을 제공한다.

### 2-1. 클로저 축약 과정
```
// 1. 기본 클로저
let add = { (a: Int, b: Int) -> Int in
    return a + b
}

// 2. 반환 타입 추론
let add = { (a, b) in
    return a + b
}

// 3. 단일 표현식에서 return 생략 가능
let add = { (a, b) in a + b }

// 4. 매개변수 축약 ($0, $1 사용)
let add: (Int, Int) -> Int = { $0 + $1 }
```
- in 이후 코드가 한 줄이면 return 생략 가능
- 매개변수는 $0, $1, $2 형식으로 축약 가능

## 2-2. 축약 클로저 예제
```
let multiply: (Int, Int) -> Int = { $0 * $1 }
print(multiply(3, 5)) // 출력: 15
```

<br>


## 3️⃣ 후행 클로저 (Trailing Closure)

클로저가 함수의 마지막 매개변수로 전달될 경우, 후행 클로저(Trailing Closure) 문법을 사용할 수 있다.

### 3-1. 후행 클로저 사용 전
```
func performOperation(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

let result = performOperation(a: 4, b: 2, operation: { $0 - $1 })
print(result) // 출력: 2
```
### 3-2. 후행 클로저 사용 후 (더 간결함)
```
let result = performOperation(a: 4, b: 2) { $0 - $1 }
print(result) // 출력: 2
```
- 함수의 마지막 매개변수가 클로저라면 () 외부에 클로저를 작성 가능
- 코드 가독성이 증가

<br>


## 4️⃣ 클로저의 캡처 리스트 (Capture List)

클로저는 외부 변수(값)를 캡처(저장)하여 내부에서 사용할 수 있다.  
하지만, 클로저가 강한 참조(Strong Reference)를 유지하면 메모리 누수가 발생할 수 있다.  
이를 방지하기 위해 캡처 리스트(Capture List) 를 사용한다.  

### 4-1. 클로저에서 값 캡처 예제
```
func makeIncrementer(amount: Int) -> () -> Int {
    var total = 0
    
    let incrementer: () -> Int = {
        total += amount
        return total
    }
    
    return incrementer
}

let incrementByTwo = makeIncrementer(amount: 2)
print(incrementByTwo()) // 2
print(incrementByTwo()) // 4
print(incrementByTwo()) // 6
```
- 클로저가 total과 amount 값을 캡처하여 저장하고 있음
- 함수가 종료된 후에도 incrementByTwo()를 호출할 때마다 내부 변수 total이 유지됨

<br>


### 4-2. 캡처 리스트를 사용한 메모리 관리

클로저가 클래스 인스턴스를 참조할 때 강한 순환 참조(Strong Reference Cycle) 가 발생할 수 있다.  
이를 방지하기 위해 [weak self] 또는 [unowned self] 를 사용하여 약한 참조(Weak Reference) 를 만든다.  
```
class Counter {
    var count = 0

    lazy var increment: () -> Void = { [weak self] in
        self?.count += 1
        print("현재 카운트: \(self?.count ?? 0)")
    }
}

let counter = Counter()
counter.increment() // 현재 카운트: 1
counter.increment() // 현재 카운트: 2
```
- [weak self] 사용 → self를 약한 참조로 저장하여 메모리 누수 방지
- [unowned self] 도 가능하지만, self가 반드시 존재할 경우에만 사용

<br>


## 5️⃣ 클로저와 고차 함수의 활용

### 5-1. map과 클로저 활용
```
let numbers = [1, 2, 3, 4, 5]
let squaredNumbers = numbers.map { $0 * $0 }
print(squaredNumbers) // [1, 4, 9, 16, 25]
```
### 5-2. filter와 클로저 활용
```
let evenNumbers = numbers.filter { $0 % 2 == 0 }
print(evenNumbers) // [2, 4]
```
### 5-3. reduce와 클로저 활용
```
let sum = numbers.reduce(0) { $0 + $1 }
print(sum) // 15
```
- 클로저는 고차 함수(map, filter, reduce)에서 필수적으로 사용됨

<br>
<br>


## ✔️ 실무에서의 Best Practice
1.	클로저는 간결하게 표현
```
let multiply: (Int, Int) -> Int = { $0 * $1 }
```
2.	후행 클로저 사용하여 가독성 향상
```
let result = performOperation(a: 5, b: 3) { $0 * $1 }
```
3.	클로저에서 강한 참조 방지 (weak self)
```
class ViewController {
    var name = "Swift"
    
    func greet() {
        DispatchQueue.main.async { [weak self] in
            print("Hello, \(self?.name ?? "Guest")")
        }
    }
}
```
4.	고차 함수(map, filter, reduce)와 함께 활용
```
let squared = [1, 2, 3].map { $0 * $0 }
```

<br>


## ✔️ 정리

|개념|설명|
|-|-|
|클로저 기본 문법|	{ (매개변수) -> 반환타입 in 코드 }|
|축약 표현|	map { $0 * 2 } (매개변수 생략 가능)|
|후행 클로저	함수| { 클로저 내용 } (가독성 향상)|
|캡처 리스트|	[weak self] 또는 [unowned self] 사용하여 메모리 누수 방지|
|고차 함수 활용|	map, filter, reduce에 클로저 사용|
