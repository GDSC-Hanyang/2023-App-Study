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

`assign operator`은 값이 `NULL`일 때 다른 값 출력


### 3.5 Typedef

`Typedef`는 자료형에 `ailias`를 붙이게 해줌

```dart 
typedef ListOfChar =  List<char>;
```

이때 `ListOfChar`이 우측의 자료형으로서 하나의 type으로 작동함

## Chapter 4 Classes

### 4.1 Constructors

```dart
class Player{ 
	late final String name;
	late int xp;
	Player(String name, int xp){
	this.name = name;
	this.xp = xp;
}
Player(this.name, this.xp); 
void sayHello()
{
print(“Hi my name is $name");
}
}
```

구조체 만들기

`late` 와 `this pointer` 사용에 혼동이 안오게 조심

### 4.2 Named Constructor Parameters

```dart
class Player { 
	final String name;
	int xp;
	String team;
	int age;
Player(this.name, this.xp, this.team, this.age); //이였으나 밑으로 변경
Player({required this.name, required this.xp, required this.team, required this.age}); 
void sayHello() {
print(“Hi my name is $name");
}
}
var player = new Player(
	name: ‘Tak’,
	xp: 1500,
	team: ‘red’,
	age: 25,
);
```
이렇게 데이터가 많아도 `argument` 의 위치를 기억하지 않아도 됨


### 4.3 Named Constructors

`name constructors`는 몇가지 `argument`만 뽑아서 공유하고 싶을 때 씀

```dart
Player.createBluePlayer({required String name, required int age}) : // 클론, 이로써 초기화 가능 name인지 position인지 구분할 것
var player = Player.createBluePlayer(
	name: ‘nico’,
	age: 21,
);
```

### 4.5 Cascade Notation

```dart
void main() {
var nico = Player(name: 'nico, xp:1200, team: 'red'); //; 지우기
nico.name = 'tak'; // ; 지우기
nico.xp = 12000; // ; 지우기
nico.team = 'blue';
}
```
`Cascade Notation` 하면 `nico.`을 `..'으로 변경  

이런 과정으로 개발자들이 좋아하는 편한 디자인 완성

추후에 자주 사용할 가능성 높음


### 4.6 Enums

`Enum` 굉장히 자주 사용할 예정
여러 argument의 형태를 통합 시킴

```dart
enum Team { red, blue }
```

 String이어도 ‘’ 쓰지 않게 하는 등 실수를 대폭 줄여줌


### 4.7 Abstract Classes

```dart
abstract class Human {
void walk(); // 청사진으로 작용하기에 선언만 해줘도 충분
}
class Player extends Human {
	void walk() {print(‘go’);}  //그래서 실제로 쓸 때 추후에 선언을 해줘야함 
```

추후에 데이터를 다룰 때 편함


### 4.8 Inheritance

```dart
Class Player extends Human {
final Team team;
Player({required this.name, required String name}) : super(name: name);
```
`extend` -> 부모로부터 `유산을 물려받는 느낌`으로 타 Class의 선언을 가져와서 사용

### 4.9 Mixins

`Mixins`-> `with`라는 새로운 키워드. 여러 클래스에 재사용이 가능함  
           `constructor`이  없어서 다른 class에 사용할 때 유용함
`Inheritance` 는 자식이 부모 `class`에 `instance` 되어서 다른 경우



# 소감
 학부에서 배웠던 내용 중 겹치는 것이 많아서 편하게 듣고 이해하기 좋았다. 
 중요한 내용인 것을 아는 만큼 세세하게 공부했다.
