# 2.3 Hello World
  - 모든 것은 위젯이다. 블록처럼 위젯에 위젯을 쌓아가며 앱을 만드는 것.
  - 위젯은 외우지 말고 찾아보며 사용하자. https://docs.flutter.dev/development/ui/widgets
  - 모든 위젯은 build 메서드를 사용해야한다.(build 또한 자동 완성 가능)
  - 모든 앱은 CupertinoApp 혹은 MaterialApp 중에 선택해야 하는데, materialapp이 훨씬 보기 좋으니 MaterialApp을 쓰자.
  - 모든 화면은 Scaffold(구조)를 가져야 한다.

# 3.0 Header
  - Row는 수평, Column은 수직 배열을 위한 것이다.
    - Row의 MainAxisAlignment는 수평 방향이다.
    - Row의 CrossAxisAlignment는 수직 방향이다.
  - 컬러를 고를 때에는 0xFF 뒤 색상코드를 적거나, Color.fromARGB를 사용하는 방식이 있다.
  - space(간격)을 주기 위해서는 SizedBox를 사용한다.
  - 마지막에 콤마(,)를 붙여주어야 포맷팅이 된다.

# 3.1 Developer Tools
  - Layout이 헷갈린다면 개발자 도구를 확인하면 된다.
  - 개발자 도구는 App이 어떻게 구성되었는지, 포함관계가 무엇인지 보여준다.

# 3.2 Buttons Section
  - Container는 child를 가진 단순한 box이다.
  - Container를 만들고 background color, border radius 등의 옵션들로 꾸밀 수 있다.
  - Padding widget으로 간격을 줄 수 있다.
    
# 3.3 VSCode Settings
  - constant는 수정할 수 없고, compile 전에 그 value를 알 수 있는 변수이다.
  - settings.json file 에서는 가이드라인을 생성하는 등 유용하게 활용할 수 있다.

# 3.4 Code Actions
  - Code Actions는 매우 간단한 방법으로 코드를 리팩팅하게 해준다.
    - 방법으로는 전구 표시를 클릭하거나,
    - 커서를 텍스트 옆에 두고 단축키 command + . 를 누르는 방법이 있다.
   
# 3.5 Reusable Widgets
  - Extract Widget 기능은 위젯을 재사용 가능하게 만들어준다.



< 간단한 소감 >
플러터로 넘어오니까 강의를 이해하고 적용하는 데 시간이 꽤 많이 리네요. 어렵습니다아 ㅜ.ㅜ
