# Swift 구조체 (Struct) 기초 – 구조체 선언, 멤버와이즈 이니셜라이저

구조체(Struct)는 값 타입(Value Type) 으로, 여러 개의 변수를 하나로 묶어 관리할 수 있는 데이터 타입이다.  
Swift에서는 클래스(Class)와 유사하지만, 상속이 불가능하며 값 타입으로 동작한다는 차이점이 있다.  
  
<br>


## 1️⃣ 구조체(Struct) 기본 개념

### 1-1. 기본 구조체 선언
```
struct Person {
    var name: String
    var age: Int
}
```
- struct 키워드를 사용하여 구조체 선언
- name과 age 프로퍼티(속성) 포함

### 1-2. 구조체 인스턴스 생성
```
var person1 = Person(name: "Alice", age: 25)
print(person1.name) // Alice
print(person1.age) // 25
```
- 구조체는 기본적으로 멤버와이즈 이니셜라이저(Memberwise Initializer) 를 제공하여 쉽게 생성 가능

<br>


## 2️⃣ 구조체의 값 타입 특성

구조체는 값 타입(Value Type) 이므로, 인스턴스를 다른 변수에 할당하면 새로운 복사본이 생성된다.

### 2-1. 값 타입 특성 확인
```
var person1 = Person(name: "Alice", age: 25)
var person2 = person1 // 값 복사 (새로운 인스턴스 생성)

person2.name = "Bob" 

print(person1.name) // Alice (변경되지 않음)
print(person2.name) // Bob (새로운 복사본이 변경됨)
```
- person1을 person2에 할당해도 서로 다른 인스턴스가 생성됨
- 구조체는 값 타입이므로, 하나의 인스턴스가 변경되어도 다른 인스턴스에 영향을 주지 않음

<br>


## 3️⃣ 구조체의 메서드 (Methods)

구조체는 내부에 메서드(함수)를 포함할 수 있으며, 프로퍼티를 변경하려면 mutating 키워드를 사용해야 한다.  

### 3-1. 메서드 추가
```
struct Person {
    var name: String
    var age: Int
    
    func introduce() {
        print("안녕하세요, 저는 \(name)이고 \(age)살입니다.")
    }
}

let user = Person(name: "Alice", age: 25)
user.introduce() // 안녕하세요, 저는 Alice이고 25살입니다.
```
- 구조체 내에서 func을 사용하여 메서드를 추가할 수 있음

### 3-2. mutating 키워드를 사용한 프로퍼티 변경
```
struct Counter {
    var count: Int = 0

    mutating func increment() {
        count += 1
    }
}

var counter = Counter()
counter.increment()
print(counter.count) // 1
```
- 구조체 내부에서 값을 변경하는 메서드는 mutating 키워드를 사용해야 함
- mutating이 없으면 let으로 선언된 인스턴스에서 프로퍼티를 변경할 수 없게 됨

<br>


## 4️⃣ 구조체와 클래스의 차이점

|구조체 (Struct)|클래스 (Class)|
|-|-|
|값 타입 (Value Type)|	참조 타입 (Reference Type)|
|복사 시 새로운 인스턴스 생성|	복사 시 같은 인스턴스 참조|
|상속 불가능|	상속 가능|
|기본적으로 멤버와이즈 이니셜라이저 제공|	이니셜라이저를 직접 정의해야 함|

### 4-1. 구조체 vs 클래스 복사 방식 차이
```
struct StructPerson {
    var name: String
}

class ClassPerson {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var structPerson1 = StructPerson(name: "Alice")
var structPerson2 = structPerson1 // 값 복사
structPerson2.name = "Bob"

var classPerson1 = ClassPerson(name: "Alice")
var classPerson2 = classPerson1 // 참조 복사
classPerson2.name = "Bob"

print(structPerson1.name) // Alice (변경되지 않음)
print(structPerson2.name) // Bob

print(classPerson1.name) // Bob (변경됨)
print(classPerson2.name) // Bob
```
- 구조체는 새로운 복사본이 생성되므로 원본이 변경되지 않음
- 클래스는 같은 인스턴스를 참조하므로 원본도 변경됨

<br>


5️⃣ 구조체 활용 예제

### 5-1. 좌표(Point) 구조체 만들기
```
struct Point {
    var x: Int
    var y: Int
    
    func display() {
        print("좌표: (\(x), \(y))")
    }
}

let point = Point(x: 3, y: 5)
point.display() // 좌표: (3, 5)
```
### 5-2. 은행 계좌(BankAccount) 구조체 만들기
```
struct BankAccount {
    var balance: Double
    
    mutating func deposit(amount: Double) {
        balance += amount
    }
    
    mutating func withdraw(amount: Double) {
        if balance >= amount {
            balance -= amount
        } else {
            print("잔액이 부족합니다.")
        }
    }
}

var myAccount = BankAccount(balance: 1000)
myAccount.deposit(amount: 500)
print(myAccount.balance) // 1500

myAccount.withdraw(amount: 700)
print(myAccount.balance) // 800

myAccount.withdraw(amount: 900) // 잔액이 부족합니다.
```
- mutating 키워드를 사용하여 프로퍼티 변경 가능
- deposit()과 withdraw()를 활용하여 잔액 조작 가능

<br>
<br>


## ✔️ 실무에서의 Best Practice
1.	데이터가 독립적으로 복사되어야 할 경우 구조체 사용
```
struct User {
    var name: String
    var age: Int
}
```
2.	값을 변경하는 메서드는 mutating 키워드 사용
```
struct Counter {
    var count = 0
    mutating func increase() {
        count += 1
    }
}
```
3.	구조체를 활용하여 불변성을 유지하는 설계
```
struct Point {
    let x: Int
    let y: Int
}
```
4.	클래스가 불필요한 경우 구조체를 기본 선택
```
struct Rectangle {
    var width: Double
    var height: Double
}
```
<br>


## ✔️ 정리

|개념|설명|
|-|-|
|구조체 선언|	struct Person { var name: String }|
|값 타입 특성|	복사 시 새로운 인스턴스 생성|
|메서드|	func introduce() { }|
|mutating 키워드|	mutating func changeAge() { age = 30 }|
|구조체 vs 클래스|	구조체 → 값 타입, 클래스 → 참조 타입|
