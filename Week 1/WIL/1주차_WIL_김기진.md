# Chapter 0. Dart의 특징

1. Compiler
- Dart Wep : dart code를 javascript로 변환
- Dart Native : dart code를 기기에 맞게 변환 -> 여러 OS에서 자유롭게 사용 가능

 - JIT(Just – In - Time) : dart VM(Virtual Machine)으로 코드 결과가 바로 보임 (개발중에만 사용)
 - AOT(Ahead – Of - Time) : 컴파일을 하고 그 결과인 binary(machine code)를 배포

2. NULL safety

3. dartpad.dev 에서 바로 dart 코드 작성 가능
 
# Chapter 1. Variable

1. function
 ;을 반드시 써야 함!
 - main
 - print : 출력함수

2. Variable
 - 선언
var ‘변수 이름’ = ‘원하는 데이터’; // 타입은 알아서 판단해줌 (처음 선언할 때 타입으로 인식)
‘타입’ ‘변수 이름’ = ‘원하는 데이터’; // String a = ‘hello’;

 - dynamic : 필요할 때만 사용하는게 좋음
	var ‘변수 이름’; // 타입이 assign할 때마다 달라질 수 있음
	dynamic ‘변수이름’;	

 - null safety : null을 refer하지 못하게 자동으로 막음
	‘타입’? ‘변수 이름’ // 타입 뒤에 ? 붙이면 nullable variable이 됨
	‘변수이름’?.~~ // ‘변수이름’ 이 null이 아니라면 실행

 - final (modifier) : 변수 값 고정 (const 느낌 근데 아님 !) (주로 runtime에서 만들어짐)
	final ‘타입’ ‘변수이름’ = ‘원하는 데이터’
	final ‘변수이름’ = ‘원하는 데이터’ // 가능

 - late : 초기 선언 없이 final 값 설정 가능 // 실수를 방지 !
	late final ‘타입’ ‘이름’;

 - const : complie time const로 만듦
	const 변수는 컴파일될 때 값이 이미 있어야 됨 (하드코딩)
 
# Chapter 2. Data Type
- 모든 data는 object로 이루어짐

1. List

- List<‘타입’> ‘변수 이름’ = [ , , , , ];
- var ‘변수 이름’ = [, , , ,] ;

- list function
 	arr.add(A); // arr을 A에 추가
 	arr.first; // 처음 element
 	arr.last; // 마지막 element

- collection if
	int arr = [1, 2, 3, if(true / false or other,,,,) 5] // if ()가 참이면 5를 list에 추가

- collection for : 리스트에 리스트를 추가함
	List<String> arr = [‘a’, ‘b’, ‘c’];
List<String> new_arr = [‘d’, ’e’, ’f’, for (String a in arr) “$a”];
// new_arr은 [ d e f a b c] 로 됨, “$arr”에 다른 String 추가도 가능

- String interpolation : String에 text를 추가하는 방법
String str = ‘Hello im $추가하고 싶은 텍스트, bye’; 
// $ 뒤에는 변수가 들어가야 함, 계산식도 가능 ${변수 + 값}, ‘ 를 String에 넣고싶으면 \’ 으로 사용

2. Map // 자바 map이랑 비슷함 Map<key, value> a = {~: ~, ~: ~};
	Map<’타입’, ’타입’> // key와 value에는 자료 / object 가능
	var a = { 
‘xp’: 1.9,
‘hello’: ‘hi’
};
3. Set // list와 비슷하지만 순서가 있고 중복된 자료가 없음
	Set<’타입’> ‘변수 이름’ = {~, ~, ~, ~};
	var ‘변수이름’ = {~, ~, };
	
 
# Chapter 3. Function

- 리턴타입 함수이름 (파라미터) {~~~~}

- return만 하는 function
	Int sum(int a, int b) => a + b; // {return a+b;} 와 같은 동작

1. named argument

- String information(String name, int age, String country) 일 때 argument를 다른 방식으로 전달 가능
함수를 String information({String name = ‘anything’, int age = ‘-1’, String country = ‘nope’})로 바꿈 //parameter 안에 중괄호 추가하고 defalut값을 넣어줌 (null safety에 안걸리기 위해)
혹은 String information({required String name, required int age, required String country}) 로 바꿈
	// required를 변수 앞에 쓰면 값을 받아야 함수 호출 가능
	기존 : information(‘lewis’, 23, ‘korea’)
	name argument : 
information(
age: 23, 
country: ‘korea’, 
name: ‘lewis’
);
	// 이러면 argument가 무엇을 의미하는지 파악하기 쉬움

 


# 소감
java와 비슷한 객체지향이라 이해하는되는 도움이 되었지만 사실 자바도 거의 까먹어서 자주자주 보고 가벼운 코드를 짜는 것이라도 계속 해야겠다
