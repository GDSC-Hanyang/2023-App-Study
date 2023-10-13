# 4주차

# Card 부분 만들기

→ 같은 카드를 여러개 사용하므로 CurrencyCard 클래스를 만들어 재활용한다!

## 구현은 container로 하는건 똑같음

→ 둥근 사각형 모양은 decoration에서 borderRadius: BorderRadius.circular(25) 로 설정

→ 아이콘은 Icon위젯을 활용!
  Icon()안에 여러가지 아이콘을 활용할 수 있다
  <img width="670" alt="스크린샷 2023-10-04 23 52 40" src="https://github.com/GDSC-Hanyang/2023-App-Study/assets/88480816/1ec6077b-6dde-414a-a413-0f0f32ab9994">
  미리보기도 가능!!
  
→ 카드가 겹쳐지는 부분, 아이콘을 카드범위를 넘겨서 움직이는것
  Transform.translate()의 offset을 조절해서 구현

→ 아이콘이 카드범위를 넘겨서 커지는것
  Transform.scale()의 scale을 조절해서 구현

→ 카드범위를 벗어난 아이콘을 자르는것
  clipBehavior: Clip.hardEdge로 설정하면 잘린다

→ 핸드폰 화면이 작아 픽셀이 잘리는 부분
  Scaffold에서 body를 body: SingleChildScrollView( 이렇게 감싸주면 스크롤할 수 있도록 설정된다


#StatefulWidget
state를 가지는 위젯!!
→ 실시간으로 변하는 정보를 화면에 반영할 수 있다
⇒ stateless위젯으로 만들었던 클래스를 code action으로 바로 stateful위젯으로 변경할 수 있다

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> numbers = [];

  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Click count",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              for (var n in numbers) Text("$n"),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(Icons.add_box_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

IconButton 위젯 onPressed : 버튼을 눌렀을 때 실행할 함수
  → 이 함수를 적절히 만들어주면 되는것!
    이때 바뀌는 정보에 맞춰 다시 build를 해줘야 하므로, setState함수 내부에 구현해준다!!

#Buildcontext
→ 해당 위젯의 부모의 정보를 담고있는것
  build함수의 인자!

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({supaer.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: const Scaffold(
        backgroundColor: Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "My large Title",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
```

부모에서 정한 Theme을 자식이 접근해서 사용할 수 있음!!
<img width="318" alt="무제" src="https://github.com/GDSC-Hanyang/2023-App-Study/assets/88480816/a52a3cf7-4ca1-431f-8282-b246fc16d82a">
→ 내가 사용하려는곳은 MyLargeTitle이고 Theme을 정한건 MaterialApp인데
  Theme.of(context)로 타고 올라가서 사용할 수 있어짐!!

⇒ null safty때문에 ! 또는 ? 를 사용하지 않으면 에러가뜬다!! (null일 가능성이 있으니까)


#Widget Lifecycle
위젯은 라이프사이클을 가지고 있다
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text("nothing"),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    super.initState();
    print("hello init");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("build helo");
    return Text(
      "My large Title",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
```

- initstate : 위젯이 만들어질 때 딱 한번만 실행된다
    
    → 값들을 초기화 할때 사용함
    
- dispose : 위젯이 사라질 때 실행된다
    
    → 위젯트리에서 위젯이 사라질 때!!
      위에서 버튼을 누르는것에 따라 MyLargeTitle이 생겼다 말았다 하므로
       버튼을 누를때마다 dispose가 실행됬다가, init됐다가 반복함!
  <img width="288" alt="무제2" src="https://github.com/GDSC-Hanyang/2023-App-Study/assets/88480816/bb5c5b85-039a-4975-8984-1bf2eaefdd32">
맨 처음 실행할 때 init이 호출

→ 아이콘을 한번 누르면 위젯이 사라지므로 dispose

→ 아이콘을 다시 누르면 위젯이 생기므로 inite!!
