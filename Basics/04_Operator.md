# Swift 연산자 (산술, 비교, 논리, 할당, 복합 연산자)
Swift에서는 다양한 연산자를 제공하여 변수를 조작하고 조건을 비교할 수 있다.
이번에는 산술 연산자, 비교 연산자, 논리 연산자, 할당 연산자, 복합 연산자를 학습하겠습니다.

## 1️⃣ 산술 연산자 (Arithmetic Operators)
Swift에서는 기본적인 사칙연산을 포함하여 산술 연산자를 제공한다.

| 연산자 |  설명 |  예제 |
|-|-|-|
| + | 덧셈 | 3 + 2 // 5 |
| - | 뺄셈 | 5 - 3 // 2 |
| * |	곱셈	| 4 * 2 // 8 |
| / |	나눗셈 |	10 / 2 // 5 |
| % |	나머지 |	10 % 3 // 1 |

✅ 예제
```
let a = 10
let b = 3

print(a + b) // 13
print(a - b) // 7
print(a * b) // 30
print(a / b) // 3  (정수 나눗셈)
print(a % b) // 1  (나머지 연산)
```
✅ 실수 연산 예제
```
let x: Double = 10.0
let y: Double = 3.0

print(x / y) // 3.3333 (실수 나눗셈)
```
- 💡주의:
  - 정수(Int)끼리 나눗셈을 하면 소수점 이하가 버려진다.
  - 실수 연산이 필요하면 Double 또는 Float 타입을 사용.

## 2️⃣ 비교 연산자 (Comparison Operators)
비교 연산자는 두 개의 값을 비교하고, 결과를 **true 또는 false (Bool 값)**으로 반환한다.

|연산자|설명|예제|
|-|-|-|
|==|같음|5 == 5 // true|
|!=|다름|5 != 3 // true|
|<|작음|3 < 5 // true|
|>|큼|10 > 5 // true|
|<=|작거나 같음|4 <= 4 // true|
|>=|크거나 같음|5 >= 2 // true|

✅ 예제
```
let x = 5
let y = 10

print(x == y) // false
print(x != y) // true
print(x < y)  // true
print(x > y)  // false
print(x >= 5) // true
```

- 💡주의:
  -  =(할당)과 ==(비교) 연산자를 혼동하지 않도록 주의.

- ❌ 잘못된 코드:
```
if x = 10 { // 오류 발생! '='는 할당 연산자이며 비교 연산자가 아님
    print("x는 10이다")
}
```
- ✅ 올바른 코드:
```
if x == 10 {
    print("x는 10이다")
}
```


## 3️⃣ 논리 연산자 (Logical Operators)
논리 연산자는 조건문이나 Bool 값을 조합할 때 사용된다.
|연산자|설명|예제|
|-|-|-|
|&&	|논리 AND (모두 true여야 true)|(true && false) // false|
|`|		|`|
|!|논리 NOT (반대 값 반환)|!true // false|

✅ 예제
```
let isSunny = true
let isWarm = false

print(isSunny && isWarm)  // false (둘 다 true여야 true)
print(isSunny || isWarm)  // true (하나라도 true면 true)
print(!isSunny)           // false (반대 값 반환)
```
💡 주의:
	•	&&는 모든 조건이 true일 때만 true
	•	||는 하나라도 true이면 true
	•	!는 논리값을 반전

## 4️⃣ 할당 연산자 (Assignment Operator)
할당 연산자는 변수에 값을 저장할 때 사용한다.

|연산자|설명|예제|
|-|-|-|
|=|값 할당|var x = 10|

✅ 예제
```
var number = 10
number = 20 // 새로운 값으로 변경
print(number) // 20
```


## 5️⃣ 복합 할당 연산자 (Compound Assignment Operators)
Swift는 연산과 할당을 함께 수행하는 연산자를 제공한다.
|연산자|설명|예제|
|-|-|-|
|+=|덧셈 후 할당|x += 3 (x = x + 3)|
|-=|뺄셈 후 할당|x -= 2 (x = x - 2)|
|*=|곱셈 후 할당|x *= 4 (x = x * 4)|
|/=	|나눗셈 후 할당|x /= 2 (x = x / 2)|
|%=|나머지 후 할당|x %= 3 (x = x % 3)|

✅ 예제
```
var score = 10
score += 5  // 10 + 5 = 15
score -= 3  // 15 - 3 = 12
score *= 2  // 12 * 2 = 24
score /= 4  // 24 / 4 = 6
score %= 5  // 6 % 5 = 1

print(score) // 1
```
- 💡 실무 팁:
- 복합 연산자를 사용하면 코드가 더 간결하고 직관적이므로 활용하는 것이 좋다.

- ✅ 실무에서의 Best Practice
1.	나눗셈 연산 시 타입을 주의해야 함
- Int / Int는 소수점을 버림 → 정확한 값이 필요하면 Double로 변환
```
let result = 10 / 3 // 3 (소수점이 버려짐)
let correctResult = 10.0 / 3.0 // 3.3333
```

 2.	&&와 || 연산자는 왼쪽에서 오른쪽으로 평가됨 (Short-Circuit Evaluation)
 - true || 어떤 값 → 어떤 값을 평가하지 않고 true 반환
 - false && 어떤 값 → 어떤 값을 평가하지 않고 false 반환
3.	비교 연산자 사용 시 =와 ==를 헷갈리지 않기
```
if x == 10 { } // 올바른 비교 연산자 사용
```
