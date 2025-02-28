# Swift 배열 (Array) – 배열 선언, 추가/삭제, 반복문 활용
배열(Array)은 같은 타입의 여러 값을 순서대로 저장하는 컬렉션 타입.  
Swift의 배열은 타입 안정성이 보장되며, 유연한 크기 조절이 가능하다.

<br>

📌 정리

|개념|설명|
|-|-|
|배열 선언|[Int], [String], Array<T>()|
|요소 접근|array[index]|
|요소 추가|append(), insert(at:)|
|요소 삭제|remove(at:), removeFirst(), removeLast(), removeAll()|
|개수 확인|count, isEmpty|
|포함 여부|contains()|
|배열 반복|for-in, enumerated(), forEach()|
|정렬|sort(), sorted()|
|필터링|filter { 조건 }|
|변환|map { 변환 }|

<br>

## 1️⃣ 배열 선언 (Array Declaration)
Swift에서 배열을 선언하는 방법은 여러 가지가 있다.

### 1-1. 기본 배열 선언
```
var numbers: [Int] = [1, 2, 3, 4, 5] // 정수 배열
var fruits: [String] = ["🍎", "🍌", "🍇"] // 문자열 배열
```

### 1-2. 배열 타입 축약 표현
```
var numbers = [1, 2, 3, 4, 5] // 타입 추론 가능 (Int 배열)
```
### 1-3. 빈 배열 선언
```
var emptyArray1: [Int] = [] // 빈 배열
var emptyArray2 = [String]() // 빈 문자열 배열
var emptyArray3 = Array<Double>() // 빈 실수 배열
```
### 1-4. 기본값으로 초기화
```
var tenZeros = Array(repeating: 0, count: 10)
print(tenZeros) // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
```

<br>

## 2️⃣ 배열 요소 접근 및 변경

### 2-1. 특정 요소에 접근 (index)
```
let fruits = ["🍎", "🍌", "🍇"]
print(fruits[0]) // 🍎
print(fruits[1]) // 🍌
```
### 2-2. 요소 변경
```
var colors = ["Red", "Blue", "Green"]
colors[1] = "Yellow"
print(colors) // ["Red", "Yellow", "Green"]
```
- 주의: 배열의 범위를 벗어난 인덱스에 접근하면 런타임 오류 발생!
```
// 오류 발생! (Index out of range)
// print(colors[5])
```
### 2-3. 배열의 개수 확인
```
let numbers = [10, 20, 30, 40, 50]
print(numbers.count) // 5
```
### 2-4. 배열이 비어있는지 확인
```
print(numbers.isEmpty) // false
```

<br>

## 3️⃣ 배열 요소 추가 및 삭제

### 3-1. 요소 추가 (append, insert)
```
var animals = ["🐶", "🐱", "🐭"]
animals.append("🐹") // 맨 뒤에 추가
print(animals) // ["🐶", "🐱", "🐭", "🐹"]

animals.insert("🦊", at: 1) // 특정 위치에 삽입
print(animals) // ["🐶", "🦊", "🐱", "🐭", "🐹"]
```
### 3-2. 요소 삭제 (remove)
```
var numbers = [10, 20, 30, 40, 50]

numbers.remove(at: 2) // 인덱스 2의 값 삭제
print(numbers) // [10, 20, 40, 50]

numbers.removeFirst() // 첫 번째 요소 삭제
print(numbers) // [20, 40, 50]

numbers.removeLast() // 마지막 요소 삭제
print(numbers) // [20, 40]

numbers.removeAll() // 모든 요소 삭제
print(numbers) // []
```
- remove(at:)를 사용할 때 주의:
- 존재하지 않는 인덱스를 삭제하면 런타임 오류 발생!

### 3-3. 요소 포함 여부 확인 (contains)
```
let cities = ["Seoul", "New York", "Tokyo"]
print(cities.contains("Seoul")) // true
print(cities.contains("Beijing")) // false
```

<br>

## 4️⃣ 배열 반복문 활용

### 4-1. for-in 반복문 사용
```
let numbers = [1, 2, 3, 4, 5]

for num in numbers {
    print("숫자: \(num)")
}

// 출력:
// 숫자: 1
// 숫자: 2
// 숫자: 3
// 숫자: 4
// 숫자: 5
```
### 4-2. enumerated()를 사용하여 인덱스와 값 함께 사용
```
let fruits = ["🍎", "🍌", "🍇"]

for (index, fruit) in fruits.enumerated() {
    print("\(index): \(fruit)")
}

// 출력:
// 0: 🍎
// 1: 🍌
// 2: 🍇
```
### 4-3. forEach 활용
```
fruits.forEach { fruit in
    print("과일: \(fruit)")
}
```

<br>

## 5️⃣ 배열 정렬 및 필터링

### 5-1. 오름차순 / 내림차순 정렬
```
var numbers = [5, 2, 9, 1, 7]
numbers.sort() // 오름차순 정렬
print(numbers) // [1, 2, 5, 7, 9]

numbers.sort(by: >) // 내림차순 정렬
print(numbers) // [9, 7, 5, 2, 1]
```
### 5-2. 정렬된 새로운 배열 생성 (sorted)
```
let sortedNumbers = numbers.sorted() // 새로운 배열 반환
print(sortedNumbers)
```
### 5-3. 배열 필터링 (filter)
```
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let evenNumbers = numbers.filter { $0 % 2 == 0 }
print(evenNumbers) // [2, 4, 6, 8, 10]
```
### 5-4.배열 변환 (map)
```
let scores = [50, 80, 90, 100]
let gradeScores = scores.map { "점수: \($0)" }
print(gradeScores) // ["점수: 50", "점수: 80", "점수: 90", "점수: 100"]
```

<br>
<br>


✔️ 실무에서의 Best Practice
1. 타입 안정성을 위해 배열 타입을 명시적으로 선언
```
var names: [String] = []
```
2.	배열이 비어있을 수 있는 경우 isEmpty로 체크
```
if names.isEmpty {
    print("배열이 비어 있습니다.")
}
```
3.	배열을 순회할 때는 for-in 또는 enumerated() 활용
```
for (index, item) in list.enumerated() {
    print("\(index): \(item)")
}
```
4.	특정 조건을 만족하는 값 필터링할 때는 filter() 활용
```
let adults = people.filter { $0.age >= 18 }
```

<br>


