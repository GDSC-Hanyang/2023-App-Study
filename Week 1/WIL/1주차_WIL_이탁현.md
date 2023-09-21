1주차 WIL - 이탁현
=============

Chapter 1 Variables
-------------
#1.1 The Var Keyword
  'var'은 어떤 타입이든 사용 가능
  
  아예 '변수타입'으로 선언하고 시작도 가능
 
```dart
   var name = 'TAKtak';
   String name2 = 'Kong Tak';
 ```
     
#1.2 Dynamic Type

  변수의 타입을 정하지 않고 임의로 쓸 때 'danamic'을 쓴다.
 
 ```dart
  dynamic name;
  name = 1;
  name = 'Taks';
 ```

#1.3 Nullable Variables

 'null'은 값이 아예 존재하지 않는 것으로 null의 사용 유무에 쓰인다.

보통은 변수에 'null'을 넣지 못한다.

 ```dart
  String? nico = 'nico'
  nico?.length
 ```


#1.4 Final Variables

   var' 은 추후에 수정이 가능하나

  'final'은 한번 선언하면 변경이 불가능하다.
  
 ```dartd
  final name = 'Kongtak';

  //다름 이름으로 변경 불가능

  // name = 'gdsc'; 와 같은게 불가능
 ```
#1.5 Late Variables

  'late' 는 'var'이나 'final' 앞에 붙일 수 있다.
  
  데이터 없이 단순 선언을 하게 해준다.
  
  값을 넣기 전까진 사용 불가능

 ```dart
  late final String name; 
  //한 번만 값을 넣을 수 있는 변수를 생성
  name = 'Kongtak';
  // 한 번 넣었으니 이젠 변경 불가능
 ```

#1.6 Constant Variables

  'const'는 상수로 수정이 불가능하다.
  
  프로그램 시작 전에 알아야 하는 값

 ```dart
  const API_KEY = 'asdqwer132';
 ```

#1.7 Recaps

  'null' 체크 할 때 isEmpty와 같은 축약형도 가능.

 
Chapter 2 Data Types
-------------

#2.0 Basic Data Types

  모든 변수는 object로 이루어짐. --> objecte oriented
  
  'num'의 클래스로 부터 상속받는 'int' , 'double'
  
```dart
  String name = "KongTak";  //문자열로 적용
  bool handsome = true; //참 거짓
  int age = 12; //정수값
  double gold = 12.2; //실수값
  num x = 2.2; //숫자형 변수값
 ```

#2.1 List

 ```dart
  var numbers = [1,2,3,4];
  var givemeFive = true;
  var numbers = [
  1, 2, 3 ,4 
  if(givemeFive) 5
  ]; // givemeFive가 참이면 5가 추가됨. dart의 좋은 점 중 하나.
 ```
 
#2.2 String Interpolation

'변수명'을 텍스트 안에 넣을 때 쓴다.
 ```dart
   var name = "Kongtaks";
   var age = 25;
   var greeting = 'Hello everyone, my name is $name, nice to meet you! and I'm ${age+2}'
   // $를 name앞에 붙임으로써 name의 변수값을 my name is '@'에 넣을 수 있다.
 ```
텍스트 내의 값을 바꿀 수 있어서 편리함.

#2.3 Collection For

 ```dart
  var oldFriends = ['nico','lynn']
  var newFriends = [
	'lewis',
	'ralph',
	'darren',
	if(var friend in oldFriends) "♥ $friend" // oldFriends의 리스트 내 값을 하트를 붙여서 넣어준다.
 ]
 ```
앱에서 UI 등 만질 때 특정 값을 따로 표시할 수 있기에 많은 코드를 아끼고 효율적인 사용 가능

#2.4 Maps

 'Map' 안에는 'Key'와 'Value'로 나누어져 있는 자료구조이다. 
 
 ```dart
  var player = {
	'name': 'NaZe',
	'xp': 19.99,
	'superpower': false
}; 
 ```
'API'와 같은 구조에 쓰인다면 'Map'보다는 'Class'가 더 나을 것이다.

#2.5 Sets

```dart
  List<Int> numbers1 = [1,2,2,3,4];
  Set<Int> numbers2 = {1,2,3,4};
  // 중괄호와 대괄호 차이. 
  // Set은 각각 안의 값에 유니크함이 있어서 1을 계속 추가해도 1이라는 고유값 하나가 있기에 추가 되지않음.
 ```



Chapter 3 Functions
-------------


'void'로 선언할 경우 그 함수는 리턴값이 없다.
#3.0 Defining a Function

 ```dart
   void sayHello(String name) {
	print("Hello $name nice to meet you");
  } //리턴 값은 없지만 실행을 돼서 'print'가 출력 됨
 ```

#3.1 Named Parameters


함수의 'parameters'에 이름을 붙여준다.

 'required'을 사용하면 함수에 'parameter'가 필수로 들어감.
  ```dart
   String sayHello({String name = 'anon', int age = 99, String country = 'wakanda'}) {
	return "Hello $name, you are $age, you're from $country"
  }
  void main() {
	print(sayHello(
		age: 12,
		country: 'korea',
		name: 'kongtaks'
	));
 ```
#3.2 Recap

'Positional parameter'은 'Parameter'의 순서가 중요함, 필수 Parameters
  
'Parameter'의 위치를 기억하게.

위 내용대로 

'Named Parameters'에는 required로 함수에 필수로 들어가게 하는것. 

'default' 지정해서 'null'오류 안 생기게 하는 것 잊지말기. 










