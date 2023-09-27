# Chapter 3. Variable

1. Optional positional parameters
- Positional parameters : sayHello(1,2,3) // argument를 순서대로 전달
- named parameters : sayHello(name:1, age: 2 ~~~) // argument를 parameter의 이름에 맞게 전달

String sayHello(String name, int age, [String? Country = ‘korea’]) // required이 아니길 원하는 parameter에 []를 넣음, country가 없을 수도 있다. (required 가 아니다 – argument로 받지 않아도 됨)
	이러면 sayHello(‘nico’, 12); 이런 식으로 call 가능

2. QQ operator // ??, ?=
- left ?? right // left가 null이면 right 호출, left가 null이 아니면 left 호출
String capitalizeName(String? name) => name != null ? name.toUpperCase() : ‘ANON’; // 조건문이 참이면 : 기준 true면 왼쪽 /  false면 오른쪽
	String capitalizeName(String? name) => name.toUpperCase() ?? ‘ANON’; // 위에랑 동일하게 동작
	capitalizeName(‘nico’); // NICO
	capitalizeName(null); // ANON

- ?? assign operator // 값이 null이면 다른 값을 할당함
	String? name;
	name ??= ‘nico’;

3. Typedef // 자료형에 alias를 붙일 수 있음
- typedef ListOfInts = List<int>; // ListOfInts 랑 List<int>랑 같은 자료형
 
# Chapter 4. Class
- 	class Player { 
	String name = ‘nico’; // class 생성에서는 var 로 하면 안됨
	int xp = 1500;

	void sayHello() {
print(“hello~ ${this.name}”); // this는 필요할 때만 사용
}
}

1. Constructors
class Player { 
	late final String name;
	late int xp;
	
	Player(String name, int xp) { // 자바랑 매우 유사, return type 없고 class이름과 동일한 이름
	this.name = name;
	this.xp = xp;
}
Player(this.name, this.xp); // 위 constructor와 동일하지만 변수에  late가 없어야 됨
void sayHello() {
print(“hello~ ${this.name}”); // this는 필요할 때만 사용
}
}

	var player = Player(‘nico’, 1500); // new Player(‘nico’, 1500) 과 동일
	player.sayHello();
 
2. named constructor parameters
class Player { 
	final String name;
	int xp;
	String team;
	int age;
Player(this.name, this.xp, this.team, this.age); // positional argument가 많아서 헷갈림
>>>	Player({required this.name, required this.xp, required this.team, required this.age}); // function named argument와 동일, paramter에 {} 추가
void sayHello() {
print(“hello~ ${this.name}”);
}
}
var player = new Player(
	name: ‘nico’,
	xp: 1200,
	team: ‘red’,
	age: 21,
);

3. named construcor // 여러 개의 constructor
	Player.createBluePlayer({required String name, required int age}) :  // 세미콜론이 아닌 콜론을 씀
	this.age = age,
	this.name = name,
this.team = ‘blue’, // parameter로 받지 않음
this.xp = 0; // parameter로 받지 않음 , 마지막 assign에는 세미콜론


var player = Player.createBluePlayer(
	name: ‘nico’,
	age: 21,
);
 
API 를 fultter class로 변환하는 일이 많음

class Player {
	final String name;
	int xp;
	String team;
	
	Player.fromJsom(Map<String, dynamic> playerJson) : 
		name = playerJson[‘name’],
		team = playerJson[‘team’],
		xp = playerJson[‘xp’];
}

var apiData = [ // List<Map<String, dynamic>>
{
	‘name’: ‘nico’,
	‘team’ :‘blue’,
	‘xp’: 0,
},
{
	‘name’: ‘lynn’,
	‘team’ :‘red’,
	‘xp’: 0,
},
{
	‘name’: ‘me’,
	‘team’ :‘blue’,
	‘xp’: 0,
},
	apiData.forEach((playerJson) {
		var player = Player.fromJson(playerJson);
}
)
]
 
4. cascade notation // class의 변수 값을 변경하는 것
	var nico = Player(name: ‘nico’, xp: 1200, team: ‘red’);
	nico.name = ‘las’;
	nico.xp = 1555000;
	nico.team = ‘blue’;

	var nico = Player(name: ‘nico’, xp: 1200, team: ‘red’)  // 세미콜론 지우고
	..name = ‘las’  // objectname. 대신 ..으로 변경하고
	..xp = 1555000
	..team = ‘blue’; // 세미콜론은 마지막에만 작성

5. Enums // 오타 줄이기 위해 만듦
	enum Team { red, blue } // String이어도 ‘’ 안씀
	Team team = Team.red // Team.red / Team.blue 둘 중 하나로만 쓸 수 있음
	

6. abstract class // 청사진 느낌
abstract class Human {
void walk(); // 그 외 구현을 하지 않음, 무엇이 있다 정도만 알려주는 용도
}
class Player extends Human { // 여기서 반드시 walk function을 정의해야 됨
	void walk() {print(‘~~~’);}
}
 

7. inheritance
	class Human {
	final String name;
	Human(this.name); // named argument 가능
	void sayHello() { print(‘~~’); }
}

class Player extends Human {// 여기에 Human의 모든 것을 넣고 싶을 때 extends를 사용해서 구현
	final Team team;
	Player({required this.team, required String name}) : // 여기도 콜론으로 함
	super(name); // named argument 가능
	
	@override
	void sayHello() { 
	super.sayHello(); // 부모클래스의 sayHello 호출
print(‘~~~’); 
}
}
var player = new Player(team: Team.red, name: ‘nico’);


8. mixins // constructor가 없는 class, class에 어떤걸 추가할 때 사용
	class Strong{ // mixins
	final double strength = 1500.99;
}
class QuickRunner { // mixins
	void runQuick() { print (‘ruun!!’); }
}
	class Player with Strong, QuickRunner { // extends가 아닌 with으로 불러옴
}
 
#Chapter 2-2. Flutter

- Dart Pad // dartpad.dev >> sample(우측상단) >> counter


# 소감
세미콜론이 안들어가는 경우도 있고 콜론이 들어가는 경우도 있어서 문법에 유의하며 이 파일을 앞으로도 엄청 열어볼 것 같은 예감이 든다…
