# Swift 반복문 (for, while, repeat-while) – 기본 반복문과 활용법
반복문은 같은 동작을 여러 번 수행할 때 사용.
Swift에서는 **for, while, repeat-while**을 사용하여 반복을 수행할 수 있다.

<br>

📌 요약
- 반복문	설명
- for-in	배열, 컬렉션, 범위 등의 요소를 순회
- while	조건이 true일 동안 실행
- repeat-while	최소 1회 실행 후, 조건이 true면 반복
- break	반복문 강제 종료
- continue	현재 반복을 건너뛰고 다음 반복 실행

<br>

## 1️⃣ for-in 반복문 (For Loop)
for-in 반복문은 배열, 범위, 컬렉션 등을 순회할 때 사용.  

<br>

✅ 기본 구조

```
for 변수 in 컬렉션 {
    // 실행할 코드
}
```
<br>
✅ 예제 1: 범위(Range) 반복 
 
```
for i in 1...5 {
    print("i 값: \(i)")
}

// 출력:
// i 값: 1
// i 값: 2
// i 값: 3
// i 값: 4
// i 값: 5
```

💡 1...5: 1부터 5까지 포함하는 범위(Closed Range).   
💡 1..<5: 1부터 5 “미만”까지 포함하는 범위(Half-Open Range).

<br>

✅ 예제 2: 배열(Array) 순회

```
let fruits = ["🍎", "🍌", "🍇"]

for fruit in fruits {
    print("과일: \(fruit)")
}

// 출력:
// 과일: 🍎
// 과일: 🍌
// 과일: 🍇
``` 
<br>


✅ 예제 3: 반복문에서 index 사용

```
let names = ["Alice", "Bob", "Charlie"]

for (index, name) in names.enumerated() {
    print("\(index + 1)번째 이름: \(name)")
}

// 출력:
// 1번째 이름: Alice
// 2번째 이름: Bob
// 3번째 이름: Charlie
```
- enumerated(): 배열을 (index, value) 형태의 튜플로 변환.

<br>
<br>

## 2️⃣ while 반복문 (While Loop)
while문은 조건이 true일 때 반복 실행.  

<br>

✅ 기본 구조
```
while 조건 {
    // 조건이 true이면 실행될 코드
}
```

✅ 예제 1: while 반복문 기본
```
var count = 3

while count > 0 {
    print("카운트다운: \(count)")
    count -= 1
}

// 출력:
// 카운트다운: 3
// 카운트다운: 2
// 카운트다운: 1
```
💡 count 값이 0이 되면 while 조건(count > 0)이 false가 되어 반복이 종료된다.

<br>
<br>

## 3️⃣ repeat-while 반복문 (Do-While Loop)
repeat-while은 최소 한 번 실행한 후 조건을 검사.  
 
<br>

✅ 기본 구조
```
repeat {
    // 코드 실행
} while 조건
```

✅ 예제 1: repeat-while 기본
```
var num = 0

repeat {
    print("현재 값: \(num)")
    num += 1
} while num < 3

// 출력:
// 현재 값: 0
// 현재 값: 1
// 현재 값: 2
```
💡 repeat-while은 조건을 나중에 검사하기 때문에, 조건이 처음부터 false여도 한 번은 실행.

<br>

✅ 비교 예제: while vs repeat-while
```
var x = 5

while x < 3 {
    print("while 실행됨") // 실행되지 않음
}

repeat {
    print("repeat-while 실행됨") // 1번 실행됨
} while x < 3

// 출력:
// repeat-while 실행됨
```
- while은 처음부터 조건이 false면 한 번도 실행되지 않음
- repeat-while은 최소 한 번 실행됨  

<br>
<br> 

## 4️⃣ 반복문에서의 제어문 (break, continue)
반복문을 조절하기 위해 **break(반복문 종료)와 continue(다음 반복으로 건너뛰기)** 를 사용할 수 있다.  

<br>

✅ break - 반복문 종료
```
for num in 1...5 {
    if num == 3 {
        print("반복 종료")
        break
    }
    print("숫자: \(num)")
}

// 출력:
// 숫자: 1
// 숫자: 2
// 반복 종료
```
💡 break를 만나면 반복문이 즉시 종료된다.  

<br>

✅ continue - 특정 조건에서 건너뛰기
```
for num in 1...5 {
    if num == 3 {
        continue // 3일 때는 아래 코드 실행을 건너뜀
    }
    print("숫자: \(num)")
}

// 출력:
// 숫자: 1
// 숫자: 2
// 숫자: 4
// 숫자: 5
```
💡 continue를 만나면 현재 반복을 건너뛰고 다음 반복을 수행합니다.  

<br>

## 5️⃣ for문 활용 – 2중 반복문 & 구구단
반복문을 중첩해서 사용할 수도 있다.  

<br>

✅ 1. 2중 반복문 예제
```
for i in 1...3 {
    for j in 1...3 {
        print("i: \(i), j: \(j)")
    }
}

// 출력:
// i: 1, j: 1
// i: 1, j: 2
// i: 1, j: 3
// i: 2, j: 1
// i: 2, j: 2
// i: 2, j: 3
// i: 3, j: 1
// i: 3, j: 2
// i: 3, j: 3
```
💡 바깥쪽 루프(i)가 한 번 실행될 때마다 안쪽 루프(j)가 전체 실행됨.

<br>

✅ 2. 구구단 출력 예제
```
for i in 2...9 {
    for j in 1...9 {
        print("\(i) × \(j) = \(i * j)")
    }
    print("------------") // 단 구분선
}
```
💡 i는 단(29), j는 19까지 증가하며 i * j를 출력.

<br>
<br>

✔️ 실무에서의 Best Practice
1.	배열 순회에는 for-in을 사용 → enumerated()와 함께 사용하면 index도 쉽게 확인 가능.
2.	조건이 명확하지 않을 때는 while을 사용 → 언제 끝날지 모르는 반복에 적합.
3.	반드시 한 번 실행해야 하는 경우 repeat-while 사용 → 사용자 입력 처리 등에 유용.
4.	break와 continue는 신중하게 사용 → 코드 흐름이 복잡해질 수 있으므로 필요할 때만 사용.

<br>

