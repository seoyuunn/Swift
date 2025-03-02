# Swift 딕셔너리 (Dictionary) – 키-값 쌍, 기본 연산, 값 변경
**딕셔너리(Dictionary)** 는 고유한 키(Key)와 값(Value)로 이루어진 컬렉션 타입.
배열(Array)와 달리 순서가 없으며, 키를 사용해 값을 빠르게 조회할 수 있다.

<br>

## 1️⃣ 딕셔너리 선언 (Dictionary Declaration)

### 1-1.  기본 딕셔너리 선언
```
var studentScores: [String: Int] = ["Alice": 90, "Bob": 85, "Charlie": 78]
```
### 1-2. 타입 추론을 이용한 딕셔너리 선언
```
var countries = ["KR": "Korea", "US": "United States", "JP": "Japan"]
```
### 1-3. 빈 딕셔너리 선언
```
var emptyDict1: [String: Int] = [:] // 명시적 선언
var emptyDict2 = [String: Int]() // 타입 추론
var emptyDict3 = Dictionary<String, Int>() // Dictionary 생성자 사용
```

<br>

## 2️⃣ 딕셔너리 요소 접근 (Accessing Dictionary Elements)
### 2-1. 특정 키의 값 가져오기
```
let score = studentScores["Alice"]
print(score) // Optional(90)
```
- 딕셔너리에서 값을 가져오면 옵셔널(Optional) 타입이 반환됨
- 키가 존재하지 않으면 nil 반환
### 2-2. 안전한 값 접근 (옵셔널 바인딩)
```
if let score = studentScores["Bob"] {
    print("Bob의 점수: \(score)")
} else {
    print("Bob의 점수를 찾을 수 없음")
}
```
### 2-3. 기본값 제공 (?? 연산자)
```
let score = studentScores["David"] ?? 0
print(score) // 0 (키가 없을 경우 기본값 사용)
```

<br>

## 3️⃣ 딕셔너리 값 변경 (Updating Dictionary Values)
### 3-1. 새로운 키-값 추가
```
studentScores["David"] = 95
print(studentScores) // ["Alice": 90, "Bob": 85, "Charlie": 78, "David": 95]
```
### 3-2. 기존 값 변경
```
studentScores["Alice"] = 98
print(studentScores) // ["Alice": 98, "Bob": 85, "Charlie": 78, "David": 95]
```
### 3-3. updateValue(_:forKey:) 사용
```
studentScores.updateValue(100, forKey: "Bob") // 기존 값 변경
studentScores.updateValue(88, forKey: "Eve") // 새로운 값 추가
print(studentScores)
```
- updateValue(_:forKey:)는 이전 값을 반환하므로, 기존 값을 확인하며 변경할 때 유용

<br>

## 4️⃣ 딕셔너리 요소 삭제 (Removing Elements)
### 4-1. 특정 키 삭제 (removeValue(forKey:))
```
studentScores.removeValue(forKey: "Charlie")
print(studentScores) // "Charlie" 키가 삭제됨
```
- 삭제된 값이 있으면 그 값을 반환하고, 없으면 nil 반환
### 4-2. 키를 사용하여 직접 삭제
```
studentScores["Bob"] = nil // "Bob" 키 제거
print(studentScores)
```
- 특정 키를 nil로 설정하면 해당 키-값 쌍이 삭제됨
### 4-2. 모든 요소 삭제 (removeAll())
```
studentScores.removeAll()
print(studentScores) // 빈 딕셔너리 출력
```

<br>

## 5️⃣ 딕셔너리 반복문 활용 (Looping Through Dictionary)
### 5-1.  for-in을 사용한 키-값 쌍 순회
```
let capitals = ["KR": "Seoul", "US": "Washington D.C.", "JP": "Tokyo"]

for (key, value) in capitals {
    print("\(key): \(value)")
}

// 출력:
// KR: Seoul
// US: Washington D.C.
// JP: Tokyo
```
### 5-2. keys와 values로 개별 접근
```
let keys = Array(capitals.keys)
let values = Array(capitals.values)

print(keys)   // ["KR", "US", "JP"]
print(values) // ["Seoul", "Washington D.C.", "Tokyo"]
```

<br>

## 6️⃣ 딕셔너리 포함 여부 확인
### 6-1. 특정 키 존재 여부 확인 (contains)
```
if studentScores.keys.contains("Alice") {
    print("Alice의 점수가 있습니다.")
} else {
    print("Alice의 점수가 없습니다.")
}
```
### 6-2. nil 체크로 키 존재 여부 확인
```
if studentScores["Alice"] != nil {
    print("Alice의 점수가 존재합니다.")
}
```

<br>

## 7️⃣ 딕셔너리 정렬 (Sorting Dictionary)
### 7-1. 키 기준 정렬 (sorted)
```
let sortedByKey = studentScores.keys.sorted()
print(sortedByKey) // ["Alice", "Bob", "Charlie", "David"]

let sortedByValue = studentScores.values.sorted()
print(sortedByValue) // [78, 85, 90, 95]
```
### 7-2. 키-값 쌍 정렬 (sorted(by:))
```
let sortedDict = studentScores.sorted { $0.key < $1.key }
print(sortedDict) // 키 기준 오름차순 정렬된 배열 반환
```

<br>
<br>

✔️ 실무에서의 Best Practice
1.	안전한 값 접근을 위해 옵셔널 바인딩 사용
```
if let score = studentScores["Alice"] {
    print("Alice의 점수: \(score)")
}
```
2.	값이 없을 경우 기본값을 제공하는 ?? 연산자 활용
```
let score = studentScores["David"] ?? 0
```
3.	딕셔너리 반복 시 for-in 사용
```
for (key, value) in studentScores {
    print("\(key): \(value)")
}
```
4.	정렬이 필요한 경우 sorted() 사용
```
let sortedKeys = studentScores.keys.sorted()
let sortedValues = studentScores.values.sorted()
```

<br>

✔️ 정리
|개념|설명|
|-|-|
|딕셔너리 선언| var dict: [KeyType: ValueType] = [:]|
|요소 접근|dict[key] (옵셔널 반환)|
|요소 추가|dict[key] = value 또는 updateValue(_:forKey:)|
|요소 변경|dict[key] = newValue|
|요소 삭제|dict.removeValue(forKey:) 또는 dict[key] = nil|
|개수 확인|dict.count|
|포함 여부 확인|dict.keys.contains(key)|
|모든 요소 삭제|dict.removeAll()|
|반복문 활용|for (key, value) in dict|
|정렬|dict.keys.sorted(), dict.sorted { $0.key < $1.key }|
