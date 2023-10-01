# 3주차

# 2. HELLO FLUTTER

flutter 시작

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutter!!!"),
        ),
        body: Center(
          child: Text("hello!!"),
        ),
      ),
    );
  }

}
```

runApp : 이걸로 앱을 실행하는것!! → 안에 들어가는건 Widget이라는 class

App class는 StatelessWidget을 상속받아서 Widget이 되었음!!! (그래서 runapp에 넣을 수 있음)

StatelessWdiget을 상속받는순간 build함수를 정의하는건 필수가된다!!

build함수는 Widget을 리턴함! 뭘 리턴하든 여기서 리턴한걸 화면에 보여준대

MaterialApp → 테마같은 느낌!! 구글앱 느낌으로 보여줌

CupertinoApp → ios같은 느낌으로 보여줌

flutter는 구글이 만들어서 MaterialApp이 더 좋대,, 실습도 이걸로!

그냥 materialApp만 리턴하면 검은화면밖에 안보임!! → 여러 인자를 설정해줘서 화면에 뭔갈 띄워줄 필요가 생긴다. home을 설정해서 시작화면을 정해주는..? 건가봄??

Scaffold : 이뿌게 보여주는걸 도와주는 widget인가봐..

appbar : 와면 상단에 있는 바! 여기에 title로 text를 정해주는것!

body : 중간부?? 그냥 text로 하면 왼쪽위에 올라가 있어서 잘림!! center로 해주면 한가운데에 보인다! (child를 가운데로 보여주는것)

<img width="795" alt="스크린샷 2023-09-26 12 42 26" src="https://github.com/GDSC-Hanyang/2023-App-Study/assets/88480816/3d5d5d17-1e57-4fc2-aa90-4abb796141af">

# 3. UI CHALLENGE

[https://dribbble.com/shots/19858341-Finnancial-Mobile-IOS-App](https://dribbble.com/shots/19858341-Finnancial-Mobile-IOS-App)
<img width="762" alt="스크린샷 2023-09-27 01 15 43" src="https://github.com/GDSC-Hanyang/2023-App-Study/assets/88480816/89dce3a7-4b10-4d83-b6fd-e72eedfc18e2">


똑같이 만들어보기!!

## ~ 3.5 버튼

코드는 파일로 올림

<img width="207" alt="스크린샷 2023-09-27 01 17 19" src="https://github.com/GDSC-Hanyang/2023-App-Study/assets/88480816/abb9b28c-c858-4288-9231-d1aca7c8cb6a">

1. 전체적으로 수직으로 배열되어 있음
    
    → Column 위젯 사용!!
    
2. 각 Column 안에서는 수평으로 배열된 부분이 존재 (메뉴바와 hey, selena / 버튼 두개)
    
    → Column의 멤버로 Row가 들어감
    
3. 구간 사이사이 빈공간이 존재
    
    → SizedBox위젯을 사용해서 띄어주기
    
4. Transfer버튼과 Request버튼은 배경색, text, 글자색을 제외하고는 완전히 같음!!
    
    → 복붙하지 말고 Button이라는 class를 직접 정의해서 재사용할것
    

<img width="352" alt="스크린샷 2023-09-27 01 30 12" src="https://github.com/GDSC-Hanyang/2023-App-Study/assets/88480816/2c05920d-d6be-451f-bbd2-78cf08e58945">

- MaterialApp
    - home : Scaffold
        - backgroundColor
        - body : Pading
            - padding
            - child : Column
                - crossAxisAlignment
                - children // list
                    - SizedBox
                    - Row
                        - mainAxisAlignment
                        - children // list
                            - Column
                                - crossAxisAlignment
                                - children
                                    - Text
                                    - Text
                    - SizedBox
                    - Text
                    - SizedBox
                    - Text
                    - SizedBox
                    - Row
                        - Button
                        - Button

## 각종 도구

- Widget Inspector
    
    <img width="241" alt="스크린샷 2023-09-27 01 31 28" src="https://github.com/GDSC-Hanyang/2023-App-Study/assets/88480816/3e96158b-9816-47aa-8eb0-f310f545def9">

    오른쪽 파란색 돋보기 모양 클릭
    
    <img width="378" alt="스크린샷 2023-09-27 01 33 18" src="https://github.com/GDSC-Hanyang/2023-App-Study/assets/88480816/70bc46af-cb37-42a5-808d-df6428f6361b">
    <img width="398" alt="스크린샷 2023-09-27 01 33 56" src="https://github.com/GDSC-Hanyang/2023-App-Study/assets/88480816/14e2cce1-c10f-4af5-b949-96a9f99b4d81">

    위젯들의 계층구조와 어떻게 생겼는지 눈으로 확인가능
    
- open user settings
    
    ```json
    "[dart]": {
            "editor.formatOnSave": true,
            "editor.formatOnType": true,
        },
        "editor.codeActionsOnSave": {
            "source.fixAll": true
        },
        "dart.previewFlutterUiGuides": true,
    ```
    
    이런 옵션들을 추가해서
    
    const 자동추가, 에러메시지를 코드작성할 때 바로 확인, 코드에서 바로 가이드라인 확인 을 해줄 수 있다.
    
- code actions

    <img width="207" alt="스크린샷 2023-09-27 01 36 44" src="https://github.com/GDSC-Hanyang/2023-App-Study/assets/88480816/8be1655b-f6e8-4f15-b7b1-f706d66669a6">

    전구모양을 클릭하면 뜬다
    
    위젯을 다른 위젯속에 넣거나 (wrap)
    
    속에 있는 위젯만 빼고, 겉에 있던 위젯만 삭제하거나(remove this widget)
    
    위젯을 재활용하기 위해 따로 클래스를 정의할 때 (extract widget)
    
    굳이 복붙할 필요를 없애준다!
