#5.0 User Interface
- Flexible: 하나의 박스가 얼마나 공간을 차지할 지 비율을 설정할 수 있다.

#5.1 Timer
- BorderRadius를 통해 위젯을 둥글게 만들었다.
- Timer 함수를 통해 시간이 거꾸로 가는 타이머를 만든다.
- TImer method로 시간을 초기화할 수 있다.
- Late modifer는 poperty를 당장 초기화할 필요 없게 만든다.
- onStartPressed를 통해 터치마다 시간이 가도록 만든다.

#5.2 PausePlay
- 전강의와 마찬가지로 isRunning을 활용해 pause 동작을 만들어본다.
- onPausePressed는 타이머를 취소할 수 있게 만들어 주었다.

#5.3 Date Format
- pomodoros를 몇 번 했는지 세어볼 수 있게 할 거다.
- duration을 통해 분 단위의 시간을 만들 수 있다.
- split와 substring을 사용해 내용을 분할할 수 있다.
- 디버그 콘솔에서 진행 과정을 확인할 수 있다.

#6.0 Introduction
- 네이버 웹툰 API를 이용한 앱을 만들어 볼 것이다.

#6.1 AppBar
- Widget은 key라는 것을 가지고 있고, ID처럼 쓰인다.
- flutter는 위젯을 식별하기 위해 ID를 사용한다.
- Elevation 기능을 통해 음영을 조절할 수 있다.
- 구글폰트에서 폰트를 불러올 수 있다.

#6.2 Data Fetching
- Pubspec.yaml 파일은 프로젝트 설정을 할 수 있는 파일이다.
- 이곳에서 http 패키지를 바로 설치할 수 있다.
- Future는 미래에 받을 값의 타입을 알려준다.
- Async 함수 내에서 await을 통해 응답값을 기다리게 할 수 있다.

#6.3 fromJson
- 텍스트로 된 응답 바디를 Json으로 디코딩해주는 작업이 필요하다.

#6.5 waitForWebToons
- 데이터를 fetch해서 state에 넣는 방법으로 Await을 이용한다
- initState에서 데이터를 받아오는 함수를 호출할 수 있도록 한다

#6.6 FutureBuilder
- StatelessWidget 상태에서 데이터를 fetch해서 넣는 방법이 있다.
- 클래스 안에 future을 넣어야 하기 때문에 위의 const는 삭제해야 한다.
- Future builder 에는 builder라는 매개변수가 필요하다.
- Snapshot은 상태와 변화를 알려준다. 

#6.7 ListView
- ListView는 여러 항목을 나열하는 데 최적화되어있다. (-> 스크롤뷰)
- Snapshot의 데이터는 future의 결과물이다.
- ListView.builder는 보다 최적화된 Listview이다. (사용자가 볼 수 없는 아이템은 build하지 않기 때문이다)
- ListView.seperated는 seperatorBuilder 인자를 필요로 한다.

#6.8 Webtoon Card
- Extract method를 통해 별개의 메소드로 분리해줄 수 있다
- Expanded는 화면의 남는 공간을 차지하는 widget이다
- Image.network를 통해 이미지를 띄울 수 있다.
- 그림자가 잘리는 현상을 제거하기 위해 padding을 사용했다.

<간단한 소감>
시험기간과 더불어서 진행하니까 헷갈리는 게 많이 있었다.
과제를 만족스럽게 하지는 못했지만, 
열심히 강의를 따라하다보니 여차저차 니코 쌤과 같은 화면이 나오기는 했다.
마지막까지 잘 만들어보고 싶다.
