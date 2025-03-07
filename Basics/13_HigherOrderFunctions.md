# Swift 고차 함수 (map, filter, reduce) – 유용한 고차 함수 활용
고차 함수(Higher-Order Function)는 다른 함수를 매개변수로 받거나, 반환할 수 있는 함수를 의미한다.  
Swift에서는 배열과 컬렉션에서 자주 사용되는 map, filter, reduce 등의 유용한 고차 함수를 제공한다.

<br>


## 1️⃣ map 함수 – 모든 요소를 변환
map은 배열의 각 요소를 특정 규칙에 따라 변환하여 새로운 배열을 반환하는 함수이다.

### 1-1. map을 사용한 배열 변환
```
let numbers = [1, 2, 3, 4, 5]
let squaredNumbers = numbers.map { $0 * $0 }
print(squaredNumbers) // [1, 4, 9, 16, 25]
```
- $0 → 현재 요소를 의미
- 각 요소를 제곱하여 새로운 배열을 생성

### 1-2. 문자열 배열 변환
```
let names = ["Alice", "Bob", "Charlie"]
let uppercasedNames = names.map { $0.uppercased() }
print(uppercasedNames) // ["ALICE", "BOB", "CHARLIE"]
```
- uppercased() 메서드를 활용하여 모든 이름을 대문자로 변환

### 1-3. map을 이용한 옵셔널 변환
```
let optionalNumbers: [Int?] = [1, nil, 3, nil, 5]
let nonNilNumbers = optionalNumbers.map { $0 ?? 0 }
print(nonNilNumbers) // [1, 0, 3, 0, 5]
```
- nil 값을 0으로 변환하여 새로운 배열 생성

<br>


## 2️⃣ filter 함수 – 특정 조건을 만족하는 요소만 선택
filter는 배열의 요소 중 특정 조건을 만족하는 요소만 포함하는 새로운 배열을 반환한다.

### 2-1. 짝수만 필터링
```
let numbers = [1, 2, 3, 4, 5, 6]
let evenNumbers = numbers.filter { $0 % 2 == 0 }
print(evenNumbers) // [2, 4, 6]
```
- $0 % 2 == 0 → 짝수인 요소만 포함

### 2-2. 특정 길이 이상의 문자열 필터링
```
let words = ["apple", "banana", "kiwi", "grape"]
let longWords = words.filter { $0.count > 5 }
print(longWords) // ["banana"]
```
- count > 5 → 길이가 5 초과인 단어만 선택

### 2-3. nil 값 제거 (옵셔널 필터링)
```
let optionalValues: [Int?] = [10, nil, 30, nil, 50]
let nonNilValues = optionalValues.compactMap { $0 }
print(nonNilValues) // [10, 30, 50]
```
- compactMap을 사용하면 nil을 자동으로 제거한 배열 생성

<br>


## 3️⃣ reduce 함수 – 배열의 모든 요소를 하나의 값으로 결합

reduce는 배열의 모든 요소를 하나의 값으로 결합하는 함수다.  
초깃값을 설정하고, 각 요소를 누적하여 연산 수행한다.

### 3-1. 배열의 합 구하기
```
let numbers = [1, 2, 3, 4, 5]
let sum = numbers.reduce(0) { $0 + $1 }
print(sum) // 15
```
- 0 → 초기값 (누적값의 시작점)
- $0 → 이전 연산 결과 (누적값)
- $1 → 현재 요소

### 3-2. 문자열 연결하기
```
let words = ["Swift", "is", "awesome"]
let sentence = words.reduce("") { $0 + " " + $1 }
print(sentence) // " Swift is awesome"
```
- "" → 초기값 (빈 문자열)
- 각 단어를 공백을 추가하여 연결

### 3-3. 배열에서 최대값 찾기
```
let numbers = [3, 7, 2, 9, 5]
let maxNumber = numbers.reduce(Int.min) { max($0, $1) }
print(maxNumber) // 9
```
- Int.min → 가능한 가장 작은 값에서 시작
- max($0, $1) → 두 값 중 큰 값을 선택하여 누적

<br>


## 4️⃣ map, filter, reduce 조합 사용

세 가지 고차 함수를 조합하여 더 강력한 데이터 변환을 수행할 수 있다.

### 4-1. 짝수만 제곱한 후 합 구하기
```
let numbers = [1, 2, 3, 4, 5, 6]
let result = numbers.filter { $0 % 2 == 0 }
                    .map { $0 * $0 }
                    .reduce(0, +)
print(result) // 56 (2*2 + 4*4 + 6*6)
```
- 짝수 필터링 → filter { $0 % 2 == 0 }
- 제곱 변환 → map { $0 * $0 }
- 누적 합 계산 → reduce(0, +)

### 4-2. 문자열 배열을 대문자로 변환 후 길이 합 구하기
```
let words = ["apple", "banana", "kiwi"]
let totalLength = words.map { $0.uppercased() }
                       .map { $0.count }
                       .reduce(0, +)
print(totalLength) // 16
```
- 대문자로 변환 → map { $0.uppercased() }
- 각 단어 길이 변환 → map { $0.count }
- 총 길이 합산 → reduce(0, +)

<br>
<br>


## ✔️ 실무에서의 Best Practice
1.	데이터 변환에는 map 활용
```
let prices = [1000, 2000, 3000]
let discountedPrices = prices.map { $0 * 0.9 } // 10% 할인 적용
```
2.	필요한 데이터만 추출할 때 filter 사용
```
let ages = [15, 21, 18, 30]
let adults = ages.filter { $0 >= 18 } // 성인만 필터링
```
3.	모든 요소를 하나의 값으로 합칠 때 reduce 활용
```
let scores = [80, 90, 100]
let totalScore = scores.reduce(0, +)
```
4.	여러 고차 함수를 조합하여 활용
```
let numbers = [1, 2, 3, 4, 5]
let squaredSum = numbers.filter { $0 % 2 == 0 }.map { $0 * $0 }.reduce(0, +)
```

<br>


## ✔️ 정리

|고차함수|설명|
|-|-|
|map|	배열의 모든 요소를 변환하여 새로운 배열 생성|
|filter|	특정 조건을 만족하는 요소만 선택|
|reduce|	모든 요소를 하나의 값으로 결합|
|조합 사용|	map, filter, reduce를 함께 사용하여 데이터 변환|

