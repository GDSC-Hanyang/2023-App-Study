# 2주차

# 3. FUNCTIONS-2

- Optional Positional Parameters
    
    ```dart
    String sayHello(
      String name, 
      int age, 
      [String? country = 'cuba']
      ) => "Hello $name age $age from $country";
    
    void main(){
    
      var res = sayHello('nico', 12);
      print(res);
    
    }
    ```
    
    함수 인자를 안넣을 수 있도록!! (이름을 설정해주는것과 다름!)
    
    → country를 지정해 주지 않아도 된다! (대신 디폴트값이 필요)
    
    자주 사용하지 말것
    
- QQ Operatro
    
    ```dart
    String cap(String? name){
      if(name != null){
        return name.toUpperCase();
      }
      return "NULL!";
    }
    
    String cap2(String? name) => name != null ? name.toUpperCase() : "NULL";
    
    String cap3(String? name) => name?.toUpperCase() ?? "NULL";
    
    void main(){
    
      cap("nico");
      cap(null);
    
      String? name;
    
      name ??= 'nico';
    
      name ??= "andofe";
    
      print(name);
    
    }
    ```
    
    null에 대한 처리를 위해 사용하는 ??
    
    A ?? B : A가 null이 아니면 그냥 A를 사용하고, null이면 B를 사용
    
    ⇒ 위에서 name?.toUpperCase()에서 ?를 사용한 이유는 name이 null인 경우에 그냥 uppercase함수 자체를 소환할 수 없어서 처리한것!!
    
    추가로 null이 될 수 있는 변수를  null로 만들고, 이게 null일 때 값을 넣어주는 ??= 연산자도 있음!!
    
    → 이경우 null이 아닐때는 들어가지 않음 (그래서 저기 print(name)할 때 nico가 출력되고 경고문구가 출력됨!! 왜냐면 name ??= “andofe”부분은 실행되지 않을거니까!!)
    
- Typedef
    
    ```dart
    typedef Listi = List<int>;
    typedef Mapss = Map<String, String>;
    
    List<int> revers(List<int> list){
      var rev = list.reversed; // list가 아니라 이터레이터임
      return rev.toList();
    }
    
    Listi revers2(Listi list){
      var rev = list.reversed; // list가 아니라 이터레이터임
      return rev.toList();
    }
    
    String sayHi(Mapss userInfo){
      return "Hi ${userInfo['name']}";
    }
    
    void main(){
    
      print(revers([1,2,3]));
      print(revers2([1,23,4,5]));
    
    }
    ```
    
    typedef!!! → 타입을 지정해주는것
    
    여기서 Listi랑 List<int>는 그냥 같은것!! 부르는 이름만 달라졌을 뿐
    
    Map을 이렇게 만들어도 동작은 하지만 이런경우 class를 사용하는게 더 좋다!
    

# 4. CLASS

- Class
    
    ```dart
    class Player{
      String name = 'nico';
      int xp = 1500;
    
      void sayHello(){
        print("name $name");
      }
    }
    
    class Player2{
      final String name = 'nico';
      int xp = 1500;
    }
    
    void main(){
    
      var p = Player();
      print(p.name);
      p.name = "new";
      print(p.name);
    
      var p2 = Player2();
      //p2.name = "new";
    
      p.sayHello();
    
    }
    ```
    
    class!! class에서 멤버변수는 무조건 타입을 선언해줘야함
    
    final로 만들어주면 나중에 수정이 불가능
    
    this 사용은 안하는게 좋음!!! (함수내에서 같은변수명이 있어서 어쩔수 없을때만 사용)
    
- Constructiors
    
    ```dart
    class Player{
      final String name;
      int xp;
    
      Player(this.name, this.xp);
    
      void sayHello(){
        print("name $name");
      }
    }
    
    void main(){
    
      var p = Player("woo", 11);
      
    
      p.sayHello();
    
    }
    ```
    
    constructor만들 때 그냥 함수로 만들어서 [this.name](http://this.name) =name;… 이렇게 만들면 멤버 변수 선언할 때 late도 붙여야 하고, 반복되는거라 별로 안이쁨!!
    
    → 저렇게 만들 수 있다!! 저러면 late도 필요없음
    
- Named Constructor Parameters
    
    ```dart
    class Player{
      final String name;
      int xp;
      String team;
      int age;
    
      Player({required this.name, 
            required this.xp, 
            required this.team, 
            required this.age});
    
      void sayHello(){
        print("name $name");
      }
    }
    
    void main(){
    
      var p = Player(
        name : 'woo',
        age : 11,
        xp : 44,
        team : "test",
      );
      
    
      p.sayHello();
    
    }
    ```
    
    멤버변수가 너무 많아지면 named parameter로 만들어주면 된다!!
    
    (required가 없으면 Null때문에 에러생김!)
    
- Named Constructors
    
    ```dart
    class Player{
      final String name;
      int xp, age;
      String team;
    
      Player({required this.name, 
            required this.xp, 
            required this.team, 
            required this.age});
    
      Player.createBlue({required String name, 
                         required int age,}) : 
                         this.age = age,
                         this.name = name,
                         this.team = 'blue',
                         this.xp = 0;
    
      Player.createRed(String name, int age) : 
                         this.age = age,
                         this.name = name,
                         this.team = 'red',
                         this.xp = 0;
    
      void sayHello(){
        print("name $name");
      }
    }
    
    void main(){
    
      var p = Player.createBlue(
        name : 'woo',
        age : 11,
      );
    
      var p2 = Player.createRed("woo2", 33);
      
    
      p.sayHello();
      p2.sayHello();
    
    }
    ```
    
    어떤 플레이어는 파란팀에 xp0으로 초기화 하고싶고, 어떤 플레이어는 빨간팀에 xp0으로 초기화 하고 싶을 때
    
    → 그냥 함수를 만들고, 뒤에 정의할 때 : 를 사용함!! : 다음에 초기화 해주면 된다
    
    함수 인자만들 때 named로 쓰든 positonal로 쓰든 선택인가봄!! 아무튼 저렇게 따로 초기화를 해줄 수 있다!
    
- Recap
    
    ```dart
    class Player{
      final String name;
      int xp;
      String team;
    
      Player.fromJson(Map<String, dynamic> playerJson) : 
        name = playerJson["name"],
        xp = playerJson["xp"],
        team = playerJson["team"];
    
      void sayHello(){
        print("name $name");
      }
    }
    
    void main(){
      var apiData = [
        {
          "name" : "woo1",
          "team" : "red",
          "xp" : 0,
        },
        {
          "name" : "woo2",
          "team" : "red",
          "xp" : 0,
        },
        {
          "name" : "woo3",
          "team" : "red",
          "xp" : 0,
        },
      ];
    
      apiData.forEach((playerJson) {
        var player = Player.fromJson(playerJson);
        player.sayHello();
       });
    
      
    
    }
    ```
    
    constructor를 잘 설정해줘서 이렇게 구조화되지 않은채로 들어오는 데이터도 내가 만든 클래스에 맞게 넣어줄 수 있다!!
    
- Cascade Notation
    
    ```dart
    class Player{
      String name;
      int xp;
      String team;
    
      Player({required this.name, 
            required this.xp, 
            required this.team,});
    
      void sayHello(){
        print("name $name");
      }
    }
    
    void main(){
    
      var nico = Player(name: "nico", xp: 1200, team: 'red');
      var poit = nico
      ..name = "ee"
      ..xp = 111111
      ..team = 'blue'
      ..sayHello();
      
    }
    ```
    
    클래스의 멤버를 변경할 때 [nico.name](http://nico.name) = “djdddd”라고 해주는 데신
    
    바로 앞에 ;를 없애고 ..name = “ddddd”라고 해주면 편하게 바꿀 수 있다!!
    
- Enums
    
    ```dart
    enum Team {red, blue}
    enum XPLevel {beginner, medium, master}
    
    class Player{
      String name;
      XPLevel xp;
      Team team;
    
      Player({required this.name, 
            required this.xp, 
            required this.team,});
    
      void sayHello(){
        print("name $name");
      }
    }
    
    void main(){
    
      var nico = Player(name: "nico", xp: XPLevel.beginner, team: Team.red);
      var poit = nico
      ..name = "ee"
      ..xp = XPLevel.master
      ..team = Team.blue
      ..sayHello();
      
    }
    ```
    
    새로운 타입을 만들어줄 수 있다 → 선택지를 줄여줘서 오타로 인해 발생하는 문제를 해결할 수 있음!!
    
- Abstract Class
    
    ```dart
    abstract class Human{
      void walk();
    
    }
    
    enum Team {red, blue}
    enum XPLevel {beginner, medium, master}
    
    class Player extends Human{
      String name;
      XPLevel xp;
      Team team;
    
      Player({required this.name, 
            required this.xp, 
            required this.team,});
    
      void sayHello(){
        print("name $name");
      }
    
      void walk(){
        print("walk!!!!!");
      }
    
    }
    
    class Coach extends Human{
      void walk(){
        print("c woakjd");
      }
    }
    
    void main(){
    
      var nico = Player(name: "nico", xp: XPLevel.beginner, team: Team.red);
      var poit = nico
      ..name = "ee"
      ..xp = XPLevel.master
      ..team = Team.blue
      ..sayHello();
      
    }
    ```
    
    추상클래스 → 함수명만 선언해두는것!!
    
    나중에 이를 상속받는 클래스에서 반드시 구현해줘야함!! (구현 안하면 에러)
    
- Inheritance
    
    ```dart
    class Human{
      final String name;
      Human({required this.name});
      void sayHello(){
        print("im $name");
      }
    
    }
    
    enum Team {red, blue}
    
    class Player extends Human{
      final Team team;
      Player({
        required this.team,
        required String name
      }) : super(name : name);
    
      @override
      void sayHello(){
        super.sayHello();
        print("and im ${team} player");
      }
    
    }
    
    void main(){
      var p = Player(team: Team.red, 
          name: "ww");
      p.sayHello();
      
    }
    ```
    
    클래스를 “상속”받는것!!!!!! → 부모의 생성자도 같이 호출해줘야함 (super사용)
    
    오버라이딩 가능!!
    
- Mixins
    
    ```dart
    mixin class Strong{
      final double strengthLevel = 1500.99;
    }
    mixin QuickRunner{
      void runQuick(){
        print("runnnnnnn");
      }
    }
    mixin class Tall{
      final double height = 1.99;
    }
    
    enum Team {red, blue}
    
    class Player with Strong, QuickRunner, Tall{
      final Team team;
      Player({required this.team});
    
    }
    
    class Horse with Strong, QuickRunner{}
    
    class Kid with QuickRunner{}
    
    void main(){
      
      var p = Player(team: Team.red);
      p.runQuick();
    }
    ```
    
    dart가 업데이트 돼서 mixin사용할 때 mixin class ~~ 또는 mixin ~~라고 써줘야 한대!! (그냥 class만 쓰면 에러)
    
    ⇒ 생성자가 없는 클래스로 보면 되고, 그냥,,, 저렇게 속성 나타낼 때 사용하나봄!!
    
    상속을 with로 받는다는 특징!!
