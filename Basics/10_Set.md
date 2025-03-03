# Swift 집합 (Set) – 집합 개념, 집합 연산
Swift에서 **집합(Set)** 은 순서가 없고, 중복을 허용하지 않는 컬렉션 타입.
배열(Array)와 달리 동일한 요소를 여러 번 저장할 수 없으며, 요소의 순서는 보장되지 않는다.

## 1️⃣ 집합(Set) 선언 (Set Declaration)

### 1-1. 기본 집합 선언
```
var numbers: Set<Int> = [1, 2, 3, 4, 5]
```
### 1-2. 타입 추론을 이용한 집합 선언
```
var fruits: Set = ["🍎", "🍌", "🍇"] // 타입 추론 (Set<String>)
```
### 1-3. 빈 집합 선언
```
var emptySet1: Set<Int> = [] // 명시적 선언
var emptySet2 = Set<String>() // 빈 문자열 집합
```

<br>

## 2️⃣ 집합의 특징

### 2-1. 중복 요소 제거
```
let setExample: Set = [1, 2, 2, 3, 3, 4]
print(setExample) // {1, 2, 3, 4} (중복 자동 제거)
```
### 2-2. 순서가 없음
```
let randomSet: Set = [5, 2, 8, 1]
print(randomSet) // 순서 보장되지 않음
```

<br>

## 3️⃣ 집합 요소 추가 및 삭제

### 3-1. 요소 추가 (insert)
```
var colors: Set = ["Red", "Blue", "Green"]
colors.insert("Yellow")
print(colors) // {Red, Blue, Green, Yellow}
```

### 3-2. 요소 삭제 (remove)
```
colors.remove("Blue")
print(colors) // {Red, Green, Yellow}
```
### 3-3. 모든 요소 삭제 (removeAll)
```
colors.removeAll()
print(colors) // {}
```

<br>

## 4️⃣ 집합 기본 연산 (Set Operations)

### 4-1. 포함 여부 확인 (contains)
```
let numbers: Set = [1, 2, 3, 4, 5]
print(numbers.contains(3)) // true
print(numbers.contains(6)) // false
```
### 4-2. 집합의 개수 확인 (count)
```
print(numbers.count) // 5
```
### 4-3. 집합이 비어있는지 확인 (isEmpty)
```
print(numbers.isEmpty) // false
```

<br>

## 5️⃣ 집합 연산 (Set Operations)
Swift는 수학적 집합 연산을 제공하며, 두 개 이상의 집합을 비교하거나 결합할 수 있다.

### 5-1. 합집합 (Union, union)
```
let setA: Set = [1, 2, 3]
let setB: Set = [3, 4, 5]
let unionSet = setA.union(setB)
print(unionSet) // {1, 2, 3, 4, 5}
```
### 5-2. 교집합 (Intersection, intersection)
```
let intersectionSet = setA.intersection(setB)
print(intersectionSet) // {3} (공통 요소만 반환)
```
### 5-3. 차집합 (Subtracting, subtracting)
```
let subtractSet = setA.subtracting(setB)
print(subtractSet) // {1, 2} (setA에서 setB에 포함되지 않은 요소만 남김)
```
### 5-4. 대칭 차집합 (Symmetric Difference, symmetricDifference)
```
let symmetricDiffSet = setA.symmetricDifference(setB)
print(symmetricDiffSet) // {1, 2, 4, 5} (서로 공통되지 않은 요소)
```

<br>

## 6️⃣ 집합 간 관계 비교

### 6-1. 부분 집합 (isSubset(of:))
```
let setC: Set = [1, 2]
print(setC.isSubset(of: setA)) // true (setC는 setA의 부분집합)
```
### 6-2. 상위 집합 (isSuperset(of:))
```
print(setA.isSuperset(of: setC)) // true (setA는 setC를 포함)
```
### 6-3. 서로소 집합 (isDisjoint(with:))
```
let setD: Set = [6, 7]
print(setA.isDisjoint(with: setD)) // true (공통 요소 없음)
```

<br>

## 7️⃣ 집합 반복문 활용 (Looping Through Set)

### 7-1. for-in을 사용한 집합 순회
```
for item in setA {
    print(item)
}
```
- 집합(Set)은 순서가 없기 때문에 출력 순서는 매번 달라질 수 있음

<br>
<br>
<br>

## ✔️ 실무에서의 Best Practice
1.	중복을 허용하지 않아야 하는 경우 Set 사용
   예: 태그 목록, 회원 ID 저장 등
2. 배열과 집합의 변환
   배열에서 중복을 제거하고 싶을 때 Set을 사용 후 다시 배열로 변환
```
let array = [1, 2, 2, 3, 3, 4]
let uniqueArray = Array(Set(array))
print(uniqueArray) // [1, 2, 3, 4]
```
3.	집합 연산을 활용하여 빠르게 데이터 비교
```
let commonItems = setA.intersection(setB)
print("공통된 요소: \(commonItems)")
```

<br>

## ✔️ 정리

|개념|설명|
|-|-|
|집합 선언|	Set<T>(), var set: Set<T> = []|
|요소 추가|	insert()|
|요소 삭제|	remove(), removeAll()|
|포함 여부 확인| contains()|
|집합 크기 확인|	count, isEmpty|
|합집합|	setA.union(setB)|
|교집합|	setA.intersection(setB)|
|차집합|	setA.subtracting(setB)|
|대칭 차집합|	setA.symmetricDifference(setB)|
|부분 집합|	isSubset(of:)|
|상위 집합|	isSuperset(of:)|
|서로소 집합|	isDisjoint(with:)|
