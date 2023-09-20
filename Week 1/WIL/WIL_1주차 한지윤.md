## 1주차 WIL

# chapter1. variables
  #1.0 Hello World
  - Main 함수는 모든 Dart 프로그램의 Entry point이다.
  - 모든 코드는 main 함수 안에 들어가야 한다. (Main 함수에서 쓴 코드가 호출된다. 만약 main이 없다면 실행 X)
  - dart는 자동으로 세미콜론을 붙여주지 않기 때문에 직접 세미콜론을 달아주어야 한다. (일부러 세미콜론을 안 쓸 때가 있기 때문) 

  #1.1 The Var Keyword
  - 변수를 만드는 2가지 방법: var 키워드 또는 명시적 타입
    void main() {
    var name = ‘지윤’; // 방법1
    string name = ‘지윤’ // 방법2
  - 함수나 메소드 내부에 지역 변수를 선언할 때에는 var를 사용하고 (var를 사용하는 게 dart 스타일가이드의 권장 방식)
  - class에서 변수나 property를 선언할 때에는 타입을 지정해 준다.
  - 어떤 경우든 변수는 (타입을 지킨다면) 언제든지 수정이 가능하다. 

  #1.2 Dynamic Type
  - dynamic :여러 가지 타입을 가질 수 있는 변수에 쓰는 키워드이다.
    void main(){
    dynamic name;
  - 변수를 선언할 때 아무 값을 지정하지 않거나, 타입을 선언하지 않으면 자동으로 dynamic 타입을 가진다.
  - dynamic 타입은 해당 변수의 타입을 알기가 어려울 때 주로 사용한다.
  - 하지만 dynamic 타입은 다양한 타입을 가질 수 있기 때문에 이상적으로 ‘정말 필요할 때’ 사용해야 한다.

  #1.3 Nullable Variables
  - 기본적으로 dart에서 모든 변수는 non-nuallable이다.
  - null safety 기능은 어떤 변수, 혹은 데이터가 null이 될 수 있음을 표시해주는 기능이다.

    void main(){
    string name = ‘지윤’;
    name = null;
    } 
    -> 이 코드는 에러가 난다. name이 null 값을 참조할 수 있다고 알려주지 않았기 때문이다.
    수정한다면,
    void main(){
    string? name = ‘지윤’;
    name = null;
    -> 이 코드는 에러가 나지 않는다. ‘?’를 통해 변수가 null이 될 수 있음을 알려주는 것이다.
  
  - 만약 ‘?’를 붙인 변수는 이 변수가 null인지 아닌지 확인해야 한다.
    void main(){
    string? name = ‘지윤’;
    name = null;
    if(jiyun != null){
    jiyun.isNotEmpty:
    }
    }

  #1.4 Final Variables
  - 한 번 정의된 변수를 수정할 수 없게 만들려면 final로 바꿔주면 된다.
    void main(){
    final name = ‘지윤’;
    name = ‘지송’; // 수정 불가
  - ( final string name = ‘지윤’; -> 이런 식으로 타입명을 추가해 작성해 줄 수 도 있다.

  #1.5 Late Variables 
  - final이나 var 앞에 붙여줄 수 있는 수식어로, 초기 데이터 없이 변수를 선언할 수 있게 해준다.
  - late 변수를 만들고 (아직은 어떤 데이터가 올지 몰라! 라는 뜻), API에 요청을 보낸 뒤에, API에서 값을 보내주면, 그 응답값을 late 변수에 넣어 사용할 수 있다. 
    void main(){
    late final string name;
  - late 변수를 사용하면 dart에서 해당 변수에 대한 접근을 막기 때문에, 실수를 방지하는 장점도 있다.    
    print(name); // name 변수에 접근 불가이기 때문에 출력 안 됨 (나중에 정의하기로 했어~ 라는 뜻)

  #1.6 Constant Variables
  - Dart에서 const는 compile-time constant를 만들어준다.
    void main(){
    const name = ‘지윤’; // 컴파일 시점에 바뀌지 않는 값 (상수)
    final name = fetchAPI(); // 컴파일 시점에 바뀌는 값 (API에서 받아온 값, 사용자 입력 값)
    }

#2 DATA TYPES 
  #2.0 Basic Data Types
  - Dart는 객체 지향 언어로 불리우는데, 아래 타입을 포함한 대부분의 타입들이 object로 이루어져 있다.
  - 따라서 import할 필요 없이 해당 자료형이 가지는 모든 mothod를 사용할 수 있다.
  - 그 중, int와 double은 num이라는 자료형을 상속받은 자료형이다.
  - Num은 그 값이 integer일 수도 있고 double일 수도 있다.
    void main(){
    string name = ‘지윤’;
    bool isPlay = true;
    int age = 22;
    double money = 99.99;
    num x = 77;
    num y = 7.7;
    }

  #2.1 Lists
  - list를 사용하는 방법에는 2가지가 있다.
    void main(){
    var name = [1, 2, 3];
    list numbers = [4, 5, 6];
    }
  - list는 collection if와 collection for를 지원한다.
  - collection if는 list를 만들 때 if를 통해 존재할 수도 안 할 수도 있는 요소를 가지고 만들 수 있다.
    void main(){
    var giveMeFive = true;
    int item = [
    1,
    2,
    3,
    If(giveMeFive) 5, // giveMeFive가 true라면 5을 넣는다
    결국 이는 아래와 같은 기능이다.
    if(giveMeFive){
    item.add(5);
    }

  #2.2 String Interpolation
  - 텍스트 안에 변수를 삽입하는 방법.
  - 단순 삽입의 경우 따옴표 내부에 $변수명 형식으로 삽입한다.
  - 변수를 계산하여 삽입하는 경우 ${계산식} 방법을 사용한다.
    void main(){
    var name = ‘지윤’;
    var age = ‘22’;
    var greeting = “hello, I’m $name and I’m ${age+1}”;
    pring(greeting);
    }
    ->	Hello, I’m 지윤 and I’m 23 years old.

  #2.3 Collection For
  - 일단 두 개의 리스트를 생성해 보자. 
    void main(){
    var oldFriends = [‘미래’, ‘영서’];
    var newFriends = [‘동혁’,‘민재’,‘세현’];
    for (var friend in oldFriends) ‘❤️$friend’, // collection for 사용
    ];
    print(newFriends); // -> [동혁, 민재, 세현, ❤️미래, ❤️영서]
    }

  #2.4 Maps
  - Map은 key와 value를 연결하는 객체이다. 키와 값 모두 모든 유형의 객체가 될 수 있다.
  - 각 키는 한 번만 발생하지만 동일한 값을 여러 번 사용할 수 있다.
    void main() {
    var player = { // 여기서 var는 Map<int, bool>로 대체될 수 있음
    1: true,
    2: false,
    3: true,
    };
    }
  - var을 사용하면 컴파일러가 key와 vlaue를 유추해서 보여준다. // Map<Integer, bool>
  - 복잡한 타입의 Map도 정의할 수 있다.
    void main() {
    Map<List<int>, bool> player = {
    [1,2,3,5]: true,
    };

  #2.5 Sets
  - List와 달리, Set에 속한 모든 아이템들이 유니크해야 할 때 사용한다.
  - List는 같은 요소가 여러 개 반복될 수 있지만 set은 중복이 허용되지 않는다.
  - Set 도 두 가지 방법으로 정의할 수 있다.
    var numbers= {1,2,3};
    set numbers = {1,2,3};
  - list는 대괄호 []를 쓰고 set은 중괄호 {}를 쓴다.

 
#3 FUNCTIONS
  #3.0 Defining a Function
  - Dart는 객체지향언어이기 때문에 함수도 객체!
    String sayHello(String name) {
    return “Hello my name is $name nice to meet you”;
    }
    void main() {
    Print(sayHello(“jiyun”));
    } 
  - 하나의 표현식만 포함하는 함수의 경우 fat arrow syntax(단축구문)을 사용할 수 있다.
    String sayHello(String name) => “Hello my name is ${name} nice to meet you”; 
  - fat arrow syntax의 다른 활용 // num plus(num a, num b) => a + b;

  #3.1 Named Parameters
  String sayHello(String name, int age, String country)
  => return “Hello $name, age: $age, country: $country”;
  void main(){
  print(sayHello(“potato”, 22, “korea”));
  }
  -> 이 코드의 문제점은 potato가 무엇인지 22가 무엇인지 알 수가 없다는 것이다.
  Positional parameter는 각각의 위치를 기억해야 하기 때문에 번거로움이 있다.
  - 이 문제를 해결하기 위해 dart에서는 named parameters를 지원한다.
    String sayHello({String name, int age, String country})
    => return “Hello $name, age: $age, country: $country”;
    void main(){
    print(sayHello({
    name: “potato”,
    age: 22,
    country: “korea”,
    });
  - required를 사용하면 null safety가 적용되어 사용자가 반드시 값을 입력해야 한다.
    String sayHello({
    required string name,
    required int age,
    required string country
    }) => return “Hello $name, age: $age, country: $country”;
  -> 입력값이 하나라도 빠지면 컴파일러가 결과를 출력하지 않는다.
     혹은 null이 아닌 default value를 지정해준다면 입력값 없이도 결과 출력이 가능하다.
