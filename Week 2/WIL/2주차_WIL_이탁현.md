# 2주차 WIL - 이탁현

## Chapter 3 Functions

### 3.3 Optional Positional Parameters

`Positional parameters` 은 `argument`를 위치에 맞게 보냄
`named parameters` 은 `argument`를 `parameter`의 이름에 맞게 보냄
상황에 따라 `Nullable`을 사용하여 `required`가 아닐 경우 `argument`로 받지 않음

### 3.4 QQ Operator
`QQ` == `??` // Question Question Operator
```dart 
A??B 
```
에서 A가 Null이면 B를 호출하고 A가 Null이 아니면 A 호출함 
'assign operator'은 값이 NULL일 때 다른 값 출력



### 3.5 Typedef

## Chapter 4 Classes

### 4.1 Constructors

### 4.2 Named Constructor Parameters

### 4.3 Named Constructors

### 4.5 Cascade Notation

### 4.6 Enums

### 4.7 Abstract Classes

### 4.8 Inheritance

### 4.9 Mixins





### 3.3 Optional Positional Parameters
### 3.3 Optional Positional Parameters
### 3.3 Optional Positional Parameters
`` 로 변수 선언 가능
값을 업데이트 할땐 변수의 본래 `타입`과 일치해야 한다.

`변수의 타입`으로 도 변수 선언 가능

```dart
var name = 'GDSC';
String name2 = 'App Front';
```

### 1.2 Dynamic Type
Dynamic → 동적인

변수의 타입 → Dynamic

**변수의 타입을 특정할 수 없을 때 사용한다.**
```dart
dynamic name;
var name2;

name = 1;
name = 'GDSC';
```

### 1.3 Nullable Variables
Null Safety → 개발자가 null 값을 참조할 수 없도록 하는 기능

**null 은 존재 자체가 없는 상태! 부재!**

null 이 될 수 있음을 표시해야 한다.

기본적으로 모든 변수는 null이 허용되지 않는다.
```dart
String? nico = 'nico'
nico?.length
```

### 1.4 final Variables
나중에 수정할 수 있는 변수 → `var`

한 번 정의된 변수를 수정할 수 없게 하는 법! → `final`
```dart
final name = 'GDSC';
// 불가능!
// name = 'GDG';
```

### 1.5 Late Variables
`late` 는 `var`이나 `final` 앞에 붙일 수 있는 수식어

초기 데이터 없이 변수를 선언할 수 있게 해주는 수식어

아직 어떤 데이터가 올지 모른다고 말해주는 것!

정의되기 전에는 사용할 수 없다! → Null safety와 같은 기능
```dart
late final String name; //이러면 한 번만 값을 넣을 수 있는 변수를 생성
name = 'GDSC';
```

### 1.6 Constant Variables
`const`→ 상수

`compile-time constant` → **컴파일 될 때 알고 있는 값!!**

수정이 불가능하다는 점에선 final과 같다.
앱이 시작될 때 이전에 알고 있어야 하는 값!!
```dart
const API_KEY = 'eyzdfst2';
```

## Chapter 2 Data Type

### 2.0 Basic Data Types
모든 변수가 object 로 이루어져있다! ← Dart가 객체 지향 언어라고 불리는 이유

`int`, `double` 둘다 `num` 이라는 클래스를 상속 받는다.
`num` 을 통하여 모든 숫자형 변수를 표현이 가능하다.
```dart
String name = "GDSC"; //문자열
bool alive = true; //true or false
int age = 12; //정수
double money = 69.99; //실수형
num x = 1.1; //모든 숫자형 변수를 표현 가능!!
```

### 2.1 List
    
  ```dart
  var numbers = [1,2,3,4];
  List<int> numbers = [1,2,3,4];
  
  numbers.add(1);
  numbers.first; //List의 첫번째 값
  numbers.last; //List의 마지막 값
  ```
  
  `collection if` 와 `collection for` 
  
  - `collection if`
      
      ```dart
      var giveMeFive = true
      var numbers = [
        1,
        2,
        3,
        4,
        if(giveMeFive) 5 //giveMeFive 가 true 이면 5가 List 에 추가됨!
      ]
      ```
      
      collection에서 내부에 if 를 사용하여 값을 추가하거나 제거할 수 있다

### 2.2 String Interpolation
String Interpolation → 문자열에 변수를 추가해주는 기능
```dart
var name = "NaZe";
var age = 22;
var greeting = 'Hello everyone, my name is $name, nice to meet you! and I'm ${age+2}'
```

### 2.3 Collection For
```dart
var oldFriends = ['nico','lynn']
var newFriends = [
	'lewis',
	'ralph',
	'darren',
	if(var friend in oldFriends) "♥ $friend" //for문이 돌아가면서 collection에 값을 추가!
]
```
collection에서 내부에 for 를 사용하여 값을 추가할 수 있

### 2.4 Maps
Map 은 Key와 Value를 한 쌍으로 가지는 데이터 구조이다.

```dart
var player = {
	'name': 'NaZe',
	'xp': 19.99,
	'superpower': false
}; 

Map<int, bool> player2 = {
	1: true,
	2: false,
	3, true
};

Map<List<int>, bool> player3 = {
	[1,2]: true,
	[3,4,5]: false,
};
```

Map<String, Object> → Object 는 Any (어떤 것이든 된다)

### 2.5 Sets
Set은 List와 유사하지만, 내부 아이템이 중복되지 않는다는 특징을 가진다.

```dart
List<Int> numbers1 = [1,2,2,3,4];
Set<Int> numbers2 = {1,2,3,4};
```

## Chapter 3 Function

### 3.0 Defining a Function

`void` → return 값이 없다
`fat arrow syntax` `⇒` → 바로 return 값 반환

```dart
void sayHello(String name) {
	print("Hello $name nice to meet you");
}

String sayHello(String name) {
	return ("Hello $name nice to meet you");
}

num plus(num a, num b) => a+b;
```

### 3.1 Named Parameters
Named Parameters → Function 의 Parameters에 이름을 붙여주는 기능!

Define Function 을 할 때, Parameter를 { }로 감싼다.

Null Safety에 걸리지 않게 하기 위하여 → Default 값을 설정해주기!

required 키워드를 사용하여 해당 Function에 Parameter가 필수적으로 들어가 있도록 할 수 있다.
```dart
String sayHello({String name = 'anon', int age = 99, String country = 'wakanda'}) {
	return "Hello $name, you are $age, you're from $country"
}
String sayHello2({
	required String name,
	required int age,
	requured String country}
) {
	return "Hello $name, you are $age, you're from $country"
}
void main() {
	print(sayHello(
		age: 12,
		country: 'cuba',
		name: 'nico'
	));
}
```

### 3.2 Recap
`positional parameter` → Parameter의 순서가 중요함, 필수 Parameters

→ 각각의 Parameter의 위치를 기억해야 한다는 점!

`named parameter` → Parameter의 이름이 중요함

→ Default 값을 지정해준다!

→ required 키워드를 사용하여 Parameter를 필수로 가지고 선언하게 한다!

# 소감
강의를 들을 당시에는 양이 많다고 못 느꼈는데, WIL 쓰면서 보니까 공부해야할 양이 매우 많다는걸 알았다..
문법 자체는 python과 kotlin이랑 유사해서 익히기 어려운 언어는 아니라고 생각된다.
