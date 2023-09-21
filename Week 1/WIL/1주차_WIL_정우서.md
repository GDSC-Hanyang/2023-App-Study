# 1주차



# Dart

```dart
void main() {
  print("hello");
}
```

c랑 비슷하다,,

# 1. VARIABLES

- Var
    
    ```dart
    void main() {
      var name = "www";
      String name2 = "ddd";
      name = "aaa";
      name2 = "rrr";
      
    }
    ```
    
    지역변수 선언은 var로 자주 쓰나바,,,
    
    <aside>
    💡 var를 자주 사용하자!
    
    </aside>
    
- Dynamic
    
    ```dart
    void main() {
      var name;
      dynamic name2;
      name = "www";
      name = 12;
      name2 = "dddd";
      name2 = 15;
      
      if(name is String){
        print("wow");
      }
      if(name is int){
        print("int");
      }
    }
    ```
    
    dynamic이라는 변수형이 있대 (어떤 타입으로든 사용가능!!)
    
    if문에서 저렇게 쓰면
    
    if(name is String)안에서는 name을 String이라고 파악하고
    
    if(name is int)안에서는 name을 int라고 파악
    
    → name.어쩌구 를 할 때 파악한 타입에 맞춰서 사용가능!!
    
    <aside>
    💡 최대한 사용을 자제할것! (어떤 타입의 값이 들어올 지 모를때만 사용)
    
    </aside>
    
- Null safety
    - null safety : null값을 참조할 수 없도록 막는거 (컴파일 에러임)
    
    ```dart
    bool isEmpty(String string) => string.length == 0;
    
    void main() {
      String? nico = "nico";
      nico = null;
      if(nico != null){
        nico.isNotEmpty;
      }
      nico?.isNotEmpty;
    }
    ```
    
    기본적으로 변수에 null을 넣을 수 없음!!
    
    → null을 넣어야 하는 경우 변수선언할 때 타입뒤에 ‘?’를 붙이면 null도 사용가능!!
    
    이런경우 nico.어쩌구를 사용할 때 nico가 null인지 아닌지 따로 확인할 필요가 있음
    
    방법1 : If문으로 검사하기
    
    방법2 : ?를 붙여서 검사하기 (if문이랑 완전 같은동작!! null이 아닐때만 .뒤에거를 실행해줌
    
- Final
    
    ```dart
    void main() {
      final nico = "nico";
      final String name = "name";
      
    }
    ```
    
    상수만들기 → final사용
    
    (타입자리에 그냥 final만 써도되고, 타입까지 명시해도 가능!)
    
- Late
    
    ```dart
    void main() {
      late final nico;
      late final String name;
      
      //print(name);
      
      nico = "nico";
      name = "name";
      
      print(name);
      
    }
    ```
    
    상수를 만드는데 값을 나중에 넣어주고 싶을 때 late사용!!
    
    (일단 데이터를 넣으면, 바꿀수는 없음!!) → 나중에 값을 어디서 받아올 때 사용하나봄
    
    변수를 사용하려면 값을 넣은 다음에 사용할 수 있다 (넣기전에 사용하면 에러!!)
    
    (런타임에 결정된다)
    
- Const
    
    ```dart
    void main() {
      const name = "nico";
      
      // compile-time constant
      
      // const API = fetchApi();
      
    }
    ```
    
    final이랑 비슷한데 컴파일타임에 결정되는 상수!! (#define이랑 비슷한건가..?)
    
    즉 값이 컴파일 시점에서 정해지지 않으면 const가 아니라 final을 사용해야함!!
    
    api도 사용자가 앱을 실행해서 뭔갈 입력해서 정해지는 값이므로 const를 사용하면 안됨!!
    

# 2. DATA TYPES

- Basic Data Types
    
    ```dart
    void main() {
      String name = "name";
      bool tf = true;
      int age = 10;
      double money = 33.3;
      
      num num1 = 1;
      num num2 = 1.1;
       // int일수도, double일수도! 
       // int, double이 num을 상속받음
    }
    ```
    
    모든 자료형은 class로 이루어짐!! → 각 타입에 맞는 함수를 사용할 수 있음 (변수.어쩌구)
    
    int, double은 num클래스를 상속받은 클래스임 ⇒ 즉 num은 int, double 둘 다 사용가능
    
- List
    
    ```dart
    void main() {
      var numbers = [
        1,
        2,
        3,
        4,
        5,
      ];
      List<int> numbers1 = [
        2,
        2,
        2,
        2,
      ];
    
      var giveMefive = true;
      var numbers22 = [
        1,
        2,
        3,
        4,
        if (giveMefive) 5,
      ];
      
      print(numbers22);
    }
    ```
    
    리스트는 같은 자료형만 담을 수 있음!!
    
    collection if라는 구문 사용가능 (list 안에 if문을 써서 요소를 추가할지 말지 결정가능!
    
    굳이 if(~~){list.add()} 같은거 추가없이 사용할 수 있다!
    
    [……. 4,] 이렇게 마지막을 “ , “으로 끝내면, fomatting할 때 자동으로 저렇게 만들어줌!
    
- String Interpolation
    
    ```dart
    void main() {
      //string inerpolation
      
      var name = "nico";
      var age = 10;
      var greeting = "hello my name is $name. nice to meet you!!\nand my age is ${age + 2}";
      print(greeting);
      
    }
    ```
    
    문자열 속에 변수를 넣고싶을 때!!!
    
    $변수명 이렇게 사용하고, 숫자같은경우 어떤 연산 후에 넣어주고 싶으면 ${변수 + 어쩌구} 이렇게 해준다!
    
    예시에서 나이는 12살로 프린트됨!
    
    (greeting변수에 저장되는건 텍스트임!! 변수를 가져와서 텍스트로 만들어주는것)
    
- Collection
    
    ```dart
    void main() {
      var old = ['nico', 'klyn'];
      var newf = [
        'lews',
        'ral',
        'darr',
        for (var friend in old) "love $friend",
      ];
      print(newf);
    }
    ```
    
    collection for!! if처럼 리스트 안에서 for를 사용하는것!
    
    old리스트 속 내용을 new리스트에 추가할 때 저렇게 사용가능 (밖에 굳이굳이 for를 안써도 된다는 장점)
    
    여기서 string interpollation을 이용해서 저장되는 이름을 조금 바꿔줄 수 있다!
    
    결과 : [lews, ral, darr, love nico, love klyn]
    
- Map
    
    ```dart
    void main() {
      var player = {
        'name' : 'nico',
        'xp' : 1.33,
        'superpower' : false,
      };
      print(player);
      var player2 = {
        'name' : 'nico',
        'xp' : '1.33',
        'superpower' : 'false',
      };
      
      Map<int, bool> player3 = {
        1 : true,
        2 : false,
        3 : true
      };
    }
    ```
    
    key : value구조!! ⇒ key랑 value의 타입은 내가 원하는 뭐든 가능함!!
    
    첫번째처럼 다양하면 타입이 object로 되어있음!
    
    <aside>
    💡 map은 자주 사용하지 말것!!
    
    (key, value 구조를 가지는 데이터는 class를 사용하는게 더 나음)
    
    </aside>
    
- Set
    
    ```dart
    void main() {
      var numbers = {1,2,3,4};
      Set<int> numbers2 = {1,2,5,3};
      numbers.add(1);
      numbers.add(1);
      numbers.add(1);
      numbers.add(1);
      numbers.add(1);
      numbers.add(1);
      print(numbers);
    }
    ```
    
    집합!! 중복이 안된다! 1을 아무리 여러번 추가해도, 1은 하나만 들어가 있음 (리스트와 다른점)
    

# 3. FUNCTIONS

```dart
void sayhello(String name){
  print("hello $name!!!!!!!");
}

String returnhello(String name){
  return "hello $name!!!!!!!";
}

String returnhello2(String name) => "hello $name!!!!!!!";

void main() {
  sayhello("woo");
  print(returnhello("weeee"));
  print(returnhello2("kee"));
}
```

함수구현이 return 한줄만 있는경우, ⇒ 를 이용할 수 있음!!

```dart
String sayHello({String name = "dewoo", 
                 int age = 1, 
                 String country = "decoun"}){
  return "Hello $name, age : $age, from $country";
}

String sayHello2({required String name, 
                  required int age, 
                  required String country}){
  return "Hello $name, age : $age, from $country";
}

void main() {
  //print(sayHello("woo", 19, "ko"));
  print(sayHello( age : 12, country : "kooo", name : "woo2"));
  print(sayHello());
  print(sayHello2(age : 17, country : "ko33oo", name : "w2oo2"));
}
```

함수 파라미터 설정할 때 순서를 안외워도 사용할 수있도록 설정!!

→ 이 때 null이 들어올 수 없으므로 반드시 디폴트 값을 설정해줘야함!!

다만 디폴트값을 설정하기 싫다면, required를 사용!! ⇒ 해당인자를 넣어주지 않으면 에러가 생긴다.
