# 3주차 WIL 김지송

## Chapter 2 Hello Flutter

### 2.3 Hello Flutter

Widget -> "레고 블록"
Widget 들을 합치는 방식으로 앱을 구성한다.
제공되는 Widget이 매우 많지만! 다 외울 필요는 없다.
사용하다 보면 중요하고 자주 사용하는 것은 알게 되기 때문이다.

class 를 Widget으로 만들면 flutter SDK 에 있는 3개의 core Widget 중에 하나를 extend 받아야 한다.
```dart
class App extends StatelessWidget {
@override // <- 부모 class에 있는 걸 override 한다는 annotation
  Widget build(BuildContext context) { // <- Widget을 return 하여 보여준다
    return MaterialApp(
      home: Scaffold( // <- Scaffold (앱의 구조/뼈대)
        appBar: AppBar(
          title: Text('Hello flutter'),
        ), //AppBar 의 argument 중 title 이라는 위젯
        body: Center(
          child: Text('Hello world!'),
	      ), //body 의 argument 중 child 이라는 위젯
	    ) // Scaffold
    ); //Material App
  }
}
```

앱의 root Widget은 2개의 옵션 중 하나를 return 해야 한다.

1. material 앱을 return (구글의 디자인 시스템)
2. cupertino 앱을 return (애플의 디자인 시스템)

Scaffold 는 전체적인 앱의 구조를 말해주는 것

### Widget

**`Row` → 자식 Widget을 양옆으로 두고 싶을 때 사용한다.**
- mainAxisAlignment → 수평(가로) 방향 정렬
- crossAxisAlignment → 수직(세로) 방향 정렬
- children → [ ] (List) 안에 widget을 넣어 사용

**`Column` → Widget 을 위 아래로 놓고 싶을 때 사용**
- mainAxisAlignment → 수(세로) 방향 정렬
- crossAxisAlignment → 수평(가로) 방향 정렬
- children → [ ] (List) 안에 widget을 넣어 사용

**SizedBox -> space(간격)을 주기 위해 사용**

**Color (색상 넣는 법)**
- `Colors.{색상}`
- `Color(0xFF{색상코드})`
- `Color.fromRGBO(Red,Green,Blue,Opacity)`
- `.withOpacity()` → 투명도 넣기

**Padding → Widget 에 padding 주기**
- child 에 padding 값을 준다.
    
**Text → 텍스트를 넣는 Widget**
- style argument 에 TextStyle

**`Container` → html 의 div 같은 것, child를 가지고 있는 단순한 box**

```dart
return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFF181818),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hey, Selena',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
```

컴파일 때 생성되면 좋은 것들은 const 로 선언해줘야 함.

`setting.json`
```json
"editor.codeActionsOnSave": {
            "source.fixAll": true
 }, //const 자동 추가 설정
```
