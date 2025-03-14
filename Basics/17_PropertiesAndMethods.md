# Swift 프로퍼티와 메서드 – 저장 프로퍼티, 연산 프로퍼티, 메서드 활용

Swift에서 프로퍼티(Property) 는 클래스(Class), 구조체(Struct), 열거형(Enum) 내부에서 값을 저장하고 관리하는 변수 또는 상수다.  
또한, 메서드(Method) 는 특정 동작을 수행하는 함수로, 인스턴스에 속한 기능을 정의한다.  
Swift에서는 저장 프로퍼티(Stored Property), 연산 프로퍼티(Computed Property), 프로퍼티 옵저버(Property Observer) 등을 제공한다.  

<br>


## 1️⃣ 저장 프로퍼티 (Stored Property)

저장 프로퍼티는 인스턴스 내부에 값을 저장하는 프로퍼티다.  
클래스와 구조체에서 사용 가능하며, 기본값을 설정할 수 있다.  

### 1-1. 저장 프로퍼티 선언
```
struct Person {
    var name: String
    var age: Int
}
```
- name, age → 저장 프로퍼티

### 1-2. 저장 프로퍼티 사용
```
var person1 = Person(name: "Alice", age: 25)
print(person1.name) // Alice
print(person1.age) // 25
```
### 1-3. let으로 선언한 구조체는 프로퍼티 변경 불가
```
let person2 = Person(name: "Bob", age: 30)
// person2.age = 35 // ❌ 오류 발생 (구조체는 값 타입이므로 변경 불가)
```

<br>


## 2️⃣ 연산 프로퍼티 (Computed Property)

연산 프로퍼티는 실제 값을 저장하지 않고, 특정 연산을 통해 값을 반환하는 프로퍼티다.  

### 2-1. 연산 프로퍼티 선언
```
struct Rectangle {
    var width: Double
    var height: Double
    
    var area: Double {
        return width * height
    }
}
```
- area는 저장된 값이 아니라 width * height 연산 결과를 반환

## 2-2. 연산 프로퍼티 사용
```
let rect = Rectangle(width: 10, height: 5)
print(rect.area) // 50.0
```
### 2-3. get과 set을 이용한 연산 프로퍼티
```
struct Circle {
    var radius: Double
    
    var diameter: Double {
        get {
            return radius * 2
        }
        set(newDiameter) {
            radius = newDiameter / 2
        }
    }
}

var circle = Circle(radius: 5)
print(circle.diameter) // 10.0
circle.diameter = 12
print(circle.radius) // 6.0
```
- get → 값을 읽을 때 실행
- set → 값을 변경할 때 실행

<br>


## 3️⃣ 프로퍼티 옵저버 (Property Observer)

프로퍼티 옵저버는 프로퍼티 값이 변경될 때 실행되는 코드를 정의할 수 있다.  
willSet과 didSet을 사용하여 값 변경 전후의 동작을 설정 가능하다.  

### 3-1. willSet과 didSet 사용
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
- willSet → 값이 변경되기 직전 실행 (newValue 자동 제공)
- didSet → 값이 변경된 직후 실행 (oldValue 자동 제공)

<br>


## 4️⃣ 인스턴스 메서드 (Instance Method)

클래스나 구조체 내부에서 인스턴스에 속한 동작을 정의하는 함수.  

### 4-1. 인스턴스 메서드 선언
```
struct Counter {
    var count = 0
    
    mutating func increase() {
        count += 1
    }
    
    mutating func reset() {
        count = 0
    }
}
```
### 4-2. 인스턴스 메서드 사용
```
var myCounter = Counter()
myCounter.increase()
print(myCounter.count) // 1
myCounter.reset()
print(myCounter.count) // 0
```
- mutating 키워드를 사용해야 구조체 내에서 프로퍼티 변경 가능

<br>


## 5️⃣ 타입 프로퍼티와 타입 메서드 (Type Property & Type Method)

### 5-1. 타입 프로퍼티 (static 키워드)
```
struct Math {
    static let pi = 3.14159
}

print(Math.pi) // 3.14159
```
- static 키워드를 사용하면 인스턴스 생성 없이 접근 가능

### 5-2. 타입 메서드 (static 키워드)
```
struct Math {
    static func square(_ number: Int) -> Int {
        return number * number
    }
}

print(Math.square(5)) // 25
```
- static func을 사용하여 클래스 또는 구조체 자체에서 호출 가능

<br>
<br>


## ✔️ 실무에서의 Best Practice
1.	읽기 전용 연산 프로퍼티 활용
```
struct Rectangle {
    var width: Double
    var height: Double
    var area: Double { width * height } // get 생략 가능
}
```
2.	프로퍼티 옵저버를 활용한 값 변경 추적
```
struct Temperature {
    var celsius: Double {
        didSet {
            print("온도가 \(celsius)도로 변경됨")
        }
    }
}
```
3.	타입 프로퍼티를 사용하여 상수 관리
```
struct Math {
    static let pi = 3.14159
}
```
4.	타입 메서드를 활용하여 공통 기능 제공
```
struct Math {
    static func square(_ number: Int) -> Int { number * number }
}
```

<br>


## ✔️ 정리

|개념|설명|
|-|-|
|저장 프로퍼티|	값을 저장하는 프로퍼티 (var name: String)|
|연산 프로퍼티|	실제 값을 저장하지 않고 계산하여 반환 (var area: Double { width * height })|
|프로퍼티 옵저버|	값 변경 전후에 동작을 실행 (willSet, didSet)|
|인스턴스 메서드|	특정 인스턴스에 속한 기능 (func introduce() { })|
|타입 프로퍼티|	static 키워드를 사용하여 인스턴스 없이 사용 가능|
|타입 메서드|	static func을 사용하여 클래스/구조체 자체에서 호출|

