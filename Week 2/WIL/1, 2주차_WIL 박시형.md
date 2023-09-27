1주차 WIL - 박시형
=============

Chapter 1 Variables
-------------
#1.1 The Var Keyword
  'var'은 변수를 지칭하고 어떤 타입이든 사용 가능하다는 특징이 있음
  변수를 업데이트할 때에는 변수의 본래 타입과 일치해야 함

  class에서 변수나 property를 선언할 때에는 타입을 지정함
  예를 들어, String '변수타입'으로 선언하고 시작도 가능

  함수나 메소드 내부에 지역 변수를 선언할 때 var 사용

  어떤 변수든 나중에 업데이트 가능함.

```dart
   void main() {
   String name = '시형';
   name = 'Sihyeong';
   }
 ```

#1.2 Dynamic Type
  여러 가지 타입을 가질 수 있는 변수에 쓰는 키워드가 dynamic이다.

 ```dart
   void main() {
   var name = '시형';
   name = 'Sihyeong';
   name = '15';
   name = 'True';
   }

   void main() {
   dynamic name;
   if(name is String){

   }
   if(name is int){
     name.
     }
   name = '15';
   name = 'True';
   }
 ```

#1.3 Nullable Variables
null safety란 개발자가 null 값을 참조할 수 없도록 하는 것이다.

 'null'은 값이 아예 존재하지 않는 것으로 null의 사용 유무에 쓰인다.

보통은 변수에 'null'을 넣지 못한다.

 ```dart
// Without null safety:
bool isEmpty(String string) => string.length == 0;
// String을 받아서 true or false를 return하는 함수 
// string의 length가 0인지 아닌지를 판별 
// null에는 length라는 속성이 없기 때문에 에러가 발생

main() {
  isEmpty(null);
  }


void main() {
  String sihyeong = '시형';
  sihyeong = null;
}
//여기서 sihyeong이 null도 string도 될 수 있게 하려면 여기에 물음표를 넣어준다.

void main() {
  String? sihyeong = '시형';
  sihyeong = null;
}
// 즉, null safety란 어떤 변수 혹은 데이터가 null가 될 수 있음을 명시하는 걸 의미한다.

void main() {
  String? sihyeong = '시형';
  sihyeong = null;
  sihyeong?.isNotEmpty;
}
// sihyeong이 null이 아니라면 isNotEmpty 속성을 달라고 요청한다.

void main() {
  String? sihyeong = '시형';
  sihyeong = null;
  sihyeong?.isNotEmpty;
  if(sihyeong != null){
    sihyeong.isEmpty;
    }
}
// sihyeong이 null이 아니라면 똑같이 sihyeong.isEmpty 이렇게 할 수 있고 아니면 

void main() {
  String? sihyeong = '시형';
  sihyeong = null;
  sihyeong?.isNotEmpty;
  sihyeong?.
    }
}
// 이렇게 sihyeong에 물음표를 써도 된다. 그러면 sihyeong이 null이 아닐 때만 isNotEmpty를 줄 것이다.
 ```


#1.4 Final Variables

   'var' 은 나중에 수정이 가능한 변수(예: String)으로 바꿀 수 있다.

  'final'은 한 번 정하면 변경이 불가능하다.

 ```dart
  void main() {
    final String name = '시형';
    name = 'SH'
    }

  // 다름 이름으로 변경이 불가능하다!


 ```
#1.5 Late Variables

  // 'late' 는 'var'이나 'final' 앞에 붙일 수 있는 수식어이다.

  void main() {
    late final String name = '시형';
    name = 'SH';
    name = '12';
    }
  // late를 사용하면 변수를 먼저 만들고 데이터를 나중에 넣을 수 있게 해 준다. 

  void main() {
    late final String name = '시형';
    print(name);
}
// 장점: 실수를 막는다 (예시: print(name); 같은 것을 막아줌 name이 late 변수이므로 값을 넣기 전까지는 접근하지 않아야 함을 알려줌)데이터 없이 단순 선언을 하게 해준다.
// name 안에 아무것도 없으므로 접근 불가능하다.
// flutter에서 data fetching을 할 때 유용하며 API와 작업할 때 많이 보게 됨.
// late 변수를 만들고 API에서 값을 보내주면 그걸 late 변수에 넣어주는 것

 ```



#1.6 Constant Variables

  // 'const'는 상수 (javascrpit, typescript의 const는 dart의 final과 비슷함)
  // 'const'는 compile-time constant를 만듦.
  프로그램 시작 전에 알아야 하는 값

 ```dart
  void main() {
    const name = '시형';
    name = '12';  // 수정이 불가
 }

 void main() {
    const API = '121212'; // API 키 값을 const에 넣어주면 절대 바뀌지 않고 컴파일이 될 때 그 값을 알고 있을 것. 이건 하드 코딩된 것 -> 코드 안에 있고 복사 붙여넣기 된 

 }

 void main() {
    const API = fetchAPI(); // 하지만 API 요청을 한다(사용자의 휴대폰에서 앱을 실행할 때 이뤄지는 것들, 예를 들어 fetchAPI)고 하면 이건 compile-time constant가 아님. 컴파일러는 API 변수의 값을 모름 -> 왜냐하면 이건 API에서 받아와야 하기 때문 

 }

 void main() {
    final API = fetchAPI(); // 따라서 const가 아니고 final을 써야 함

}
 void main() {
    const API = fetchAPI(); // const는 컴파일할 때 알고 있는 값에 사용해야 (앱스토에 앱을 올리기 전 알고 있는 값) -> 앱스토에 앱을 올리기 전에 값을 알고 있다면 그건 const / 어떤 값인지 모르고, 그 값이 API로부터 온다거나 사용자가 화면에서 입력해야 하는 값이면 그건 final이나 var이 되어야 함.

 }

void main() {
    const max_allowed_price = 120; // 앱에서 사용할 상수들이 있다면 const를 써주면 됨. const 변수들은 컴파일할 때 평가된다(앱에 담긴 코드를 앱스토어에 보내기 전)

 }

 ```

#1.7 Recaps

  // final, const, var를 구분하자.


Chapter 2 Data Types
-------------

#2.0 Basic Data Types

void main() {
    String name = '시형';
    bool alive = true; // true 혹은 false를 값으로 가지는 bool 자료형
    int age = 12; // 숫자 자료형 Integer
    double money = 69.99; // 끝에 소수점을 붙일 수 있다 const max_allowed_price = 120; // 앱에서 사용할 상수들이 있다면 const를 써주면 됨. const 변수들은 컴파일할 때 평가된다(앱에 담긴 코드를 앱스토어에 보내기 전)

 }
  // Dart의 모든 것들은 object로 구성되어 있다. function도 object다. Dart는 객체 지향 언어이다. String이 class이고 bool 자료형도 class이고 integer도 class
  // 그런데 int와 dobule은 num이라는 클래스를 상속받았음

void main() {
    String name = '시형';
    bool alive = true; // true 혹은 false를 값으로 가지는 bool 자료형
    int age = 12; // 숫자 자료형 Integer
    double money = 69.99; // 끝에 소수점을 붙일 수 있다 const max_allowed_price = 120; // 앱에서 사용할 상수들이 있다면 const를 써주면 됨. const 변수들은 컴파일할 때 평가된다(앱에 담긴 코드를 앱스토어에 보내기 전)
    num x = 12; // num 자료형을 사용하면 그 숫자는 integer일 수도 있고 double일 수도 있다. 그럴 때 num을 사용한다. 이게 integer와 double의 부모 class이다. 이 모든 게 object, class로 이루어져 있기 떄문에 실제로 자료형 안에 어떤 게 들어있는지 볼 수 있다. 
    x = 1.1;
 }


void main() {
    String name = '시형';
    name. // String이 가지는 모든 method가 자동완성된다. 
    bool alive = true; // true 혹은 false를 값으로 가지는 bool 자료형
    int age = 12; // 숫자 자료형 Integer
    age. // 숫자도 마찬가지로 isOdd, isEven, isNegative 등 수학적인 기능이 많이 있다. 
    double money = 69.99; // 끝에 소수점을 붙일 수 있다 const max_allowed_price = 120; // 앱에서 사용할 상수들이 있다면 const를 써주면 됨. const 변수들은 컴파일할 때 평가된다(앱에 담긴 코드를 앱스토어에 보내기 전)
    num x = 12; // num 자료형을 사용하면 그 숫자는 integer일 수도 있고 double일 수도 있다. 그럴 때 num을 사용한다. 이게 integer와 double의 부모 class이다. 이 모든 게 object, class로 이루어져 있기 떄문에 실제로 자료형 안에 어떤 게 들어있는지 볼 수 있다. 
    x = 1.1;
 }

 ```

#2.1 List

 ```dart

void main() {
  var numbers = [1,2,3,4];
}

void main() {
  List<int> numbers = [1,2,3,4]; // integer로 된 list (string 추가 불가능)
  numbers.add(1);
}

void main() {
  List<int> numbers = [1,2,3,4]; // integer로 된 list (string 추가 불가능)
  numbers.first // List의 첫 번째 요소를 가져다 줌.
  numbers.last // List의 마지막 요소를 가져다 줌.
  numbers.isEmpty // List가 비어있는지 아닌지를 알려
  numbers.add  // List에 새로운 하나의 요소 추가 가능
  numbers.addAll // List에 한꺼번에 여러 요소 추가 가능
}

// dart의 List의 장점은 collection if와 collection for을 지원한다는 점이다.
// List를 만들면 꼭 쉼표로 마무리해라.

void main() {
  var numbers = [
1,
2,
3,
4,
];
}
// List 구조가 복잡해지면 더 훨씬 보기 편하다고 느끼게 될 것이다.

void main() {
  var giveMeFive = true;
  var numbers = [
   1,
   2,
   3,
   4,
   if (giveMeFive) {
     numbers.add(5); //giveMeFive가 true라면 List에 5를 추가할 수 있
];

}

//collection if로는 List를 만들 수 있고 if로 존재할 수도 안 할 수도 있는 요소를 가지고 만들 수 있다.

void main() {
  var giveMeFive = true;
  var numbers = [
   1,
   2,
   3,
   4,
   if (giveMeFive) 5
];
print(numbers);

}


#2.2 String Interpolation

//String Interpolation은 text에 변수를 추가하는 방법이다. 

void main() {
  var name = '시형';
  var greeting = 'Hello everyone, my name is 
  $name, nice to meet you!'; // 달러 기호 뒤에 반드시 변
  print(greeting);
}

// 무언가를 계산하고 싶다면 달러 기호를 적고 중괄호를 적어주고 계산할 내용을 그 사이에 적는다
void main() {
  var name = '시형';
  var age = 25;
  var greeting = 'Hello everyone, my name is 
  $name, and I\'m ${age+2}!'; // 달러 기호 뒤에 반드시 변수 그리고 I'm에서 작은 따옴표가 있으므로 escape 기호 \를 쓴다.


  print(greeting);
}
 ```

#2.3 Collection For

 ```dart
void main() {
  var oldFriends = ['시형','나영']
  var newFriends = [
	'현준',
	'남균',
	'유리',
	if(var friend in oldFriends) "♥ $friend" // oldFriends의 리스트 내 값을 하트를 붙여서 넣어준다.
 ];
  print(newFriends);
}
// UI interface를 만들 때 collection if와 collection for은 게임 체인저이다. 예를 들어 메뉴나 navigation bar를 만드는 데 user가 로그인을 했는지 안 했는 나타내는 버튼을 추가하고 싶다. collection for 역시 좋은 기능이다. 시간을 아껴준다.
void main() {
  var oldFriends = ['시형','나영']
  var newFriends = [
	'현준',
	'남균',
	'유리',
	if(var friend in oldFriends) "♥ $friend" // oldFriends의 리스트 내 값을 하트를 붙여서 넣어준다.
 ];
  for(var friend in oldFriends){
	newFriends.add()
}
  print(newFriends);
}
// 이거는 너무 복잡함.

void main() {
  var oldFriends = ['시형','나영']
  var newFriends = [
	'현준',
	'남균',
	'유리',
	for (var friend in oldFriends) "♥ $friend",
 ];

  print(newFriends);
}
```
앱에서 UI 등 만질 때 특정 값을 따로 표시할 수 있기에 많은 코드를 아끼고 효율적인 사용 가능

#2.4 Maps

// Map은 JavaScript나 TypeScript의 object, python의 Dictionary 같은 것이다.
void main() {
   var player = {  // var이므로 자료형을 따로 명시할 필요가 없다.이 변수의 자료형은 Map<String, Object>이다. key와 value로 이루어진 자료구조 Map을 만들었는데 key는 String이고 보다시피 전부 String이다. value는 Object임. Dart는 object에서 모든 게 생겨나서 object는 기본적으로 어떤 자료형이든지 될 수가 있다. TypeScript에서 object는 any이다. 
      'name' : '시형', 
      'xp' : 19.99, // 원하는 어떤 것이든 올 수 있다.
      'superpower' : false, // 원하는 어떤 것이든 올 수 있다.
   };
}

void main() {
   var player = { 
      'name' : '시형', 
      'xp' : '19.99', // 전부 다 String으로 만들면 key는 String이고 value 역시 String이다.
      'superpower' : 'false', // 중요한 건 원하는 대로 정의할 수 있다는 것. 컴파일러가 정해주길 기다릴 필요가 없다.
   };
}

void main() {
   Map <int, bool> player = {   // key는 숫자만 올 수 있고 value는 true 혹은 false만 적을 수 있다. int는 key의 자료형, bool은 value의 자료형 -> 컴파일러가 key와 value의 자료형을 유추할 것
// 되게 복잡한 key 설정도 가능 key로 integer List, value로는 bool을 가지도록 설정 가능함
// 어떤 key든 value든 명시해줄 수 있음. 모든 게 class에서 나오고 Dart에서는 모두 class이기 때문임.
// Map도 마찬가지로 method와 property를 갖고 있음. player를 입력하면 entries, isEmpty 등 다양하고 keys, length, value도 가능 (예 player.length), containsKey의 경우 특정 요소가 포함되어있는지 아닌지 체크할 때 씀
// 특정 key가 존재하지 않는다면 추가할 수도 있음
      1: true
      2: false
      3: true
};
}

# 2.5 
void main() {
   var numbers = {1, 2, 3, 4};
}

void main() {
   Set<int> numbers = {1, 2, 3, 4};
}
// Set과 List의 차이는 Set에 속한 모든 아이템들은 유니크하다는 것, 예를 들어 numbers에 1을 추가하려고 하는데 여러 번 반복하고 출력하면?

void main() {
   Set<int> numbers = {1, 2, 3, 4}; // Set은 중괄호
   numbers.add(1);
   numbers.add(1);
   numbers.add(1);
   print(numbers);
}
// Run하면 1 많이 추가했어도 1, 2, 3, 4 밖에 안 나옴 -> Set이기 때문에 , Set은 Sequence(순서)가 있고 List랑 같지만 모든 요소가 유니크하다.

void main() {
   List<int> numbers = [1, 2, 3, 4]; //List는 대괄호

}
// 디버그 콘솔에 결과값 [1, 2, 3, 4, 1, 1, 1] 

void main() {
   var numbers = {1, 2, 3, 4}; // Set은 중괄호
   numbers.add(1);
   numbers.add(1);
   numbers.add(1);
   print(numbers);
}
// 요소가 항상 하나씩만 있으면 Set, unique할 필요가 없다면 List
// Dart에서 List는 Python의 List와 같고 Dart에서 Set은 Python의 Tuple과 같다 그리고 자바스크립트도 Set이 있다

## Chapter 3 Functions

### 3.0 Defining a Function

   void sayHello(String name) { // void 함수가 아무것도 return 안한다
        print ("Hello $name nice to meet you!"):
}

   String sayHello(String name) { 
        return "Hello $name nice to meet you!":
}

   String sayHello(String potato) { 
        return "Hello $potato nice to meet you!":
}

   void main() {
     print(sayHello('시형'));
}

   String sayHello(String potato) => "Hello $potato
   nice to meet you!"; 
     num plus(num a, num b) => a + b; // 중괄호나 대괄호 필요 없음 
}

   void main() {
     print(sayHello('시형'));
}

### 3.1 Named Parameters
   String sayHello(String name, int age, String country) {
   return "Hello $name, you are $age, and you come from
   $country";
}

   void main() {
     print(sayHello('patato', 19, 'cuba'));
}

   void main() {
     print(sayHello(
        age: 12,
             country: 'cuba',
             name: 'nico',
     ));
   }


   void main() {
     print(sayHello(
        age: 12,
             country: 'cuba',
             name: 'nico',
     ));
   }



   String sayHello(String name, int age, String country) {
   return "Hello $name, you are $age, and you come from
   $country";
}



# 3.2 Recap

// positional parameter : parameter의 순서가 중요, 사용할 때 각각의 위치 기억 vs named parameter

# 소감
강의를 따라가는데 있어서 처음에는 어려웠으나 조금씩 나아지고 있는 것 같아 뿌듯하다.

# 2주차 WIL - 박시형

## Chapter 3 Functions

### 3.3 Optional Positional Parameters


   String sayHello(String name, int age, String
   country) => 'Hello, $name, you are $age years old from
   $country';

   void main() {
     sayHello('nico', 12, 'cuba');
}

// Positional parameters의 경우 'argument'를 위치에 맞게 보낸다는 특징이 있다
// Named parameters의 경우 'argument'를 'parameter'의 이름에 맞게 보낸다.
// 상황에 따라 'Nullable'을 사용하며 'required'가 아닐 경우 'argument'로 받지 않아야 한다.

### 3.4 QQ Operator

   String capitalizeName(String name) => name.
   toUpperCase();

   void main() {
     capitalizeName('nico');
     capitalizeName(null);

}

   String capitalizeName(String? name) => name. // ?의 의미 name 값이 null일 수도 있고 아닐 수도 있다
   toUpperCase();

   void main() {
     capitalizeName('nico');
     capitalizeName(null);

}

   String capitalizeName(String? name) {
    if (name != null) {
          return name.toUpperCase();
    }
    return 'ANON';
}

   void main() {
     capitalizeName('nico');
     capitalizeName(null);

}

// QQ = ?? 좌항이 null이면 우항을 return
   String capitalizeName(String? name) =>
    name.toUpperCase() ?? 'ANON';
    left ?? right

   void main() {
     capitalizeName('nico');
     capitalizeName(null);

}

 
// A??B 에서 A가 Null이면 B를 호출하고 A가 Null이 아니면 A 호출하는 것
'assign operator'은 값이 NULL일 때 다른 값 출력한다고 함.



### 3.5 Typedef
   typedef ListOfInts = List<int>;
 
   List<int> reverseListOfNumbers(List<int> list) {
    var reversed = list.reversed;
    return reversed.toList();
   } 

   void main() {
    reverseListOfNumbers([1, 2, 3]);
   }
// console [3, 2, 1]


## Chapter 4 Classes

### 4.0 Your First Dart Class
   class Player {
   String name = '시형';
   int xp = 1500;
   }

   void main() {
    var player = new Player(); // new 붙일 필요 없음.
   }

   class Player {
   String name = '시형';
   int xp = 1500;
   }

   void main() {
    var player = Player(); 
    print(player.name);
    player.name = 'SH';
    print(player.name);
   }
// console
// 시형
// SH



### 4.1 Constructors

   class Player {
   final String name;
   int xp;
   }
   
   Player(String name, int xp) {
     this.name = name;
     this.xp = xp;
   }
 
   void sayHello() {
     print("Hi my name is $name");


   class Player {
   late final String name; // late는 변수들의 값을 나중에 받는다.
   late int xp;
   }
   
   Player(String name, int xp) {
     this.name = name;
     this.xp = xp;
   }
 
   void sayHello() {
     print("Hi my name is $name");


   void main() {
    var player = Player('시형', 1500);
      player.sayHello();
      var player2 = Player('나영', 2500);
      player2.sayHello();
// Console
// Hi my name is 시형
// Hi my name is 나영

   class Player {             // late없이 간결한 코드
   final String name;
   int xp;
   }
   
   Player(this.name, this.xp);

   void sayHello() {
     print("Hi my name is $name");
   }
}

// Console
// Hi my name is 시형
// Hi my name is 나영



### 4.2 Named Constructor Parameters

  class Player {
  final String name;
  int xp;
  String team;
  int age;

  Player(this.name, this.xp, this.team, this.age);

  void main(){
    var player = Player('시형', 1500, 'red', 25);
    player.sayHello();
    var player2 = Player('나영', 2500, 'blue', 22);
      players2.sayHello();
  }

// 다른 방식

  void main(){
    var player = Player(
    name: '시형',
      xp: 1500,
      team:'red',
      age: 25,
    );
    player.sayHello();
    var player2 = Player('나영', 2500, 'blue', 22);
      players2.sayHello();
  }


// required named parameters

  class Player {
  final String name;
  int xp;
  String team;
  int age;

  Player({
     required this.name, 
     required this.xp,
     required this.team,
     required this.age,
     });

  void main(){
    var player = Player(
    name: '시형',
      xp: 1500,
      team:'red',
      age: 25,
    );


    var player2 = Player(
    name: '나영',
      xp: 2500,
      team:'blue',
      age: 22,
    );


  // 변수가 null일 수도 있다는 가능성 때문에 required나 기본값을 주어야 함.


### 4.3 Named Constructors

  class Player {
  final String name;
  int xp;
  String team;
  int age;

  Player({
     required this.name, 
     required this.xp,
     required this.team,
     required this.age,
     });


  void sayHello() {
    print("Hello, my name is $name");
   }


  void main(){
    var player = Player(
    name: '시형',
      xp: 1500,
      team:'red',
      age: 25,
    );


    var player2 = Player(
    name: '나영',
      xp: 2500,
      team:'blue',
      age: 22,
    );

//////////

  class Player {
  final String name;
  int xp, age;
  String team;

  Player({
     required this.name, 
     required this.xp,
     required this.team,
     required this.age,
     });

  Player.createBluePlayer({required String name, required int age})

  void sayHello() {
    print("Hello, my name is $name");
   }


  void main(){
    var player = Player.createBluePlayer(
      name: '시형',
          age: 25,
    );


    var redplayer = Player.createRedPlayer(
      name: '나영',
          age: 22,
    );


//  콜론(:)을 사용 -> property들을 초기화

  class Player {
  final String name;
  int xp, age;
  String team;

  Player({
     required this.name, 
     required this.xp,
     required this.team,
     required this.age,
     });

  Player.createBluePlayer({required String name, required int age})
  : this.age = age,
    this.name = name, 
    this.team ='blue',
    this.xp = 0;

  Player.createRedPlayer(String name, int age})
  : this.age = age,
    this.name = name, 
    this.team ='red',
    this.xp = 0;

  void sayHello() {
    print("Hello, my name is $name");
   }


  void main(){
    var player = Player.createBluePlayer(
      name: '시형',
          age: 25,
    );


    var redplayer = Player.createRedPlayer(
      name: '나영',
          age: 22,
    );

### 4.4 Recap 
  class Player {
  final String name;
  int xp, age;
  String team;

  Player.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson['name'],
        xp = playerJson['xp'],
        team = playerJson['team'];

  void sayHello() {
    print("Hello, my name is $name");
   }

  void main(){
    var apiData = {
     { 
       "name" : "시형",
           "team" : "red",
       "xp" : 0,
     }


### 4.5 Cascade Notation

  class Player {
  String name;
  int xp, age;
  String team;

  Player({required this.name, required this.xp, required this.team});

  void sayHello() {
    print("Hello, my name is $name");
   }

  void main() {
    var sihyeong = Player(name: '시형', xp: 1200, team : 'red');
    sihyeong.name = 'las';
    sihyeong.xp = 1200000;
    sihyeong.team = 'blue';
   }
### 4.6 Enums

  enum Team { red, blue }

  class Player {
  String name;
  int xp, age;
  Team team;

  Player({
     required this.name, 
     required this.xp, 
     required this.team
   });

  void sayHello() {
    print("Hello, my name is $name");
   }

  void main() {
    var potato = nico
     ..name = '시형'
        ..xp = 1200000
     ..team = Team.blue
     ..sayHello();
}


### 4.7 Abstract Classes
// abstract method and class
  enum Team { red, blue }

  enum XPlevel { beginner, medium, pro }

  class Player {
  String name;
  int xp, age;
  Team team;

  Player({
     required this.name, 
     required this.xp, 
     required this.team
   });

  void sayHello() {
    print("Hello, my name is $name");
   }

  void main() {
    var nico = Player(
       name: 'nico'
       xp: XPLevel.medium,
       team: Team.red,
     );
    var potato = nico
     ..name = '시형'
        ..xp = 1200000
     ..team = Team.blue
     ..sayHello();
}


//

  abstract class Human {
    void walk();
  }

  enum Team { red, blue }

  enum XPlevel { beginner, medium, pro }

  class Player extends Human{
  String name;
  int xp, age;
  Team team;

  Player({
     required this.name, 
     required this.xp, 
     required this.team
   });

  void walk
    print('im walking')

  void sayHello() {
    print("Hello, my name is $name");
   }

  void main() {
    var nico = Player(
       name: 'nico'
       xp: XPLevel.medium,
       team: Team.red,
     );
    var potato = nico
     ..name = '시형'
        ..xp = 1200000
     ..team = Team.blue
     ..sayHello();
}

### 4.8 Inheritance
   class Human {
     final String name;
     Human(this.name);
     void sayHello() {
        print("Hi my name is $name");
    }
}

  enum Team { blue, red }

  class Player extends Human{
    final Team team;

    Player({required this.team, required String
    name})  : super(name);

}


  void main() {
    var player = Player(team: Team.red)
     }
    name: 'nico';
       xp: XPLevel.medium,
       team: Team.red,
     );
     player.team

### 4.9 Mixins

  class Strong {
    final double strengthLevel = 1500.99;
   }

  class QuickRunner {
  void runQuick() {
     print("RUUUUUN!!!");
     }
}

  enum Team { blue, red }

  class Player {
    final Team team;

    Player({
      required this.team, 
    }); 

}


  void main() {
    var player = Player(team: Team.red)
     }
    name: 'nico';
       xp: XPLevel.medium,
       team: Team.red,
     );
     player.team


//
  class Strong {
    final double strengthLevel = 1500.99;
   }

  class QuickRunner {
  void runQuick() {
     print("RUUUUUN!!!");
     }
}

  class Tall {
    final double height = 1.99;
  }

  enum Team { blue, red }

  class Player with Strong, QuickRunner, Tall {
    final Team team;

    Player({
      required this.team, 
    }); 

}
  class Horse with Strong, QuickRunner {}
  
  class Kid with QuickRunner {}


  void main() {
    var player = Player(team: Team.red)
     }
    name: 'nico';
       xp: XPLevel.medium,
       team: Team.red,
     );
     player.team

# 소감 : 강의 양이 많았지만 WIL 작성하면서 강의를 듣는 것이 훨씬 나았다. 잘 기억도 되고 코딩을 같이 하면서 하니까 시간은 오래 걸리지만 알차고 이해도 잘 된다.
