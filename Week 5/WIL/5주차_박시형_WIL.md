#5 POMODORO APP

##5.0 User Interface (13:35)

// 1. Pomodoro라는 애플리케이션(생산성 기술)은 25분 동안 일한 뒤 5분 쉬는 것을 말한다
// 2. 오늘 만들 화면 : 25분짜리 카운터가 있고 버튼이 있다, 사용자가 완료한 총 횟수가 있다, 플레이 버튼을 누르면 25분에서 거꾸로 내려 간다, 시간이 0이 될 때 횟수를 올릴 것이다 -> 그러면 사용자가 그 날 동안 25분 간격의 작업을 몇 번이나 완료했는지 알 수 있다
// 3. App Widget을 StatelessWidget으로 바꾼다
// 4. screens 라는 폴더를 만들고 home_screen.dart 를 만들어 준다
// 5. Stateful Widget을 사용, 스크린의 이름으로 HomeScreen을 적는다
// 6. home을 HomeScreen으로 변경
// 7. HomeScreen은 scaffold를 그려줘야 함
// 8. body는 Column으로 렌더링됨.
// 9. Flexible이라는 children component을 사용, Flexible의 역할은 하드 코딩되는 값을 만들게 해주는 것, 높이가 200 픽셀, 너비가 100 픽셀이 아니라 UI를 비율에 기반해서 더 유연하게 만들 수 있게 해 준다
// 10. 첫 번째 Flexible은 Container라는 child를 가진다 
// 11. 두 번째 Flexible의 color를 green으로 변경하고 세 번쨰 Flexible은 blue로 바꾼다
// 12. Flexible의 비율(서로 간의 크기를 비교해서 얼마나 커야 하는 지)을 정한다. 첫 번째: 기본값인 1의 flex값을 갖고 두 번째는 flex가 2, 세 번째는 1로 정함(기본값)
// 13. Column 안에 box가 세 개가 있는데 하나가 다른 것보다 큼 -> Flexible 때문, Flexible는 하나의 박스가 얼마나 공간을 차지할 지 비율을 정할 수 있다. 가운데 박스가 위와 아래의 박스보다 두 배로 큰건 사용자가 비율을 정해주었기 때문 -> 이제 다양한 화면을 만들 수 있다,  화면마다 크기가 다르니까 400 pixel 크기의 상자처럼 하드코딩하는 대신에 크기가 큰 iPhone에서는 작아 보이고, Android에서는 크게 보일 수 있다, 그 대신 우린 비율을 정할 거고 Framework와 Flutter Engine이 정확한 비율을 맞춰 줄 것이다
// 14. decoration은 필요가 없어서 지운다
// 15. Scaffold의 배경색을 넣는다. -> 현재 context의 Theme을 요청해서 backgroundColor를 가져온다
// 16. 첫 번째 Container에 counter를 만들고 child는 Text고 안에는 일단 25:00, style은 textStyle, color는 cardColor(베이지색)
// 17. const 지우기, fontSize 는 89, FontWeight에서 w600
// 18. Container의 alignment property로 bottomCenter
// 여기까지가 첫 번째 Flexible
// 19. 두 번째에 있는 큰 Flexible ->  Container 대신 Center을 넣는다 -> Center의 child는 엄청 큰 IconButton ->  play icon -> Icons의 play에서 outline(외곽선) -> 
// 20. onPressed는 버튼을 클릭했을 때 실행되는 함수, const 지우기, iconSize는 98, color는 테마와 똑같이 바꾸기  
// 여기까지가 두 번째 Flexible
// 21. 세 번째 Flexible -> Container의 child는 Column -> Column의 children 중 하나는 Text고 Pomodoros , 다른 Text는 오늘 완료한 횟수 -> Container에 decoration도 넣음 BoxDecoration, 배경색은 현재 테마에서 cardColor를 가져오기
// 22. Pomodors 와 0을 엄청 크게 만들자 ->  column이 전체 공간을 쓰지 않고 그저 가운데만 차지하고 있다 -> container를 row로 감싸준다, code action을 열어서 Wrap with Row를 눌러준다
->  이걸 화면 끝까지 확장한다 -> Expanded widget 사용 -> column 안에 가운데 정렬 (mainAxisAlignment사용)
// 23. text에 스타일 입히기 -> fontSize는 20, Pomodoros(오타 수정), 색상은 context의 Theme에 있음, 위쪽의 const를 지운다


import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '25:00',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: () {},
                icon: const Icon(Icons.play_circle_outline),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


##5.1 Timer (05:48)
// 1. 거꾸로 카운트세기 -> tate를 카운트 할 시간(초)으로 초기화하기 전에 Pomodoros가 있는 Container에 border radius를 넣어 보기 좋게 함 -> 둥글게 됨
// 2. 25분에서 남은 시간에 대한 변수를 초기화 -> 25분을 초로 환산하면 1500초 -> 카운트를 시작할 함수 : void onStartPressed + Timer 함수(Dart의 표준 라이브러리에 포함되어 있음): Timer를 통해 정해진 간격에 한번씩 함수를 실행 가능, 사용자가 버튼을 누를때만 타이머가 생성되게 함 -> late라는 variable modifierm를 사용 
// 3. late modifier는 이 property를 당장 초기화 하지 않아도 된다는 걸 뜻한다. 하지만 property를 사용하기 전에 반드시 초기화한다고 약속함(나중에 초기화한다) -> 그럼 사용자가 이 버튼을 누를때 timer를 Timer로 초기화하기 위해 Timer는 Dart의 Standard Library에서 가져오고 Periodic time는 주기마다 바로 이 함수를 실행함, 주기는 우리가 원하는 대로 정함
// 4. 1초마다 함수를 실행, Duration 주기 입력, seconds가 1 -> 매 1초마다 여기있는 함수가 실행됨.
// 5. onTick이라는 새로운 method를 만든다 (매번 타이머가 바뀔 때마다 즉 1초마다 HomeScreenWidget의 setState를 실행함, 그때마다 남은 시간(totalSeconds)에서 1초씩 뺀다)
// 6. 함수 이름을 복사(괄호를 넣지 않는다. 왜? 괄호는 함수를 지금 실행하는 걸 의미하기 때문) -> Timer가 매 초마다 괄호를 넣어 실행해준다, periodic이 실행하는 함수는 그 인자로 Timer 자체를 받는다 -> Timer timer를 넣기 -> 그러면 Timer는 매 초마다 onTick 이라는 함수를 실행 할 거고 onTick 함수는 state를 변경해 totalSeconds를 1초 줄일 것이다
// 7. 25:00을 totalSeconds로 대체하면 UI에 생김 -> 새로고침 후 onPressed에 onStartPressed -> 버튼을 누르면 매 초 타이머가 작동될 때마다 1초씩 줄어든다.

import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
@@ -8,6 +10,22 @@ class HomeScreen extends StatefulWidget {
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  late Timer timer;

  void onTick(Timer timer) {
    setState(() {
      totalSeconds = totalSeconds - 1;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
@@ -19,7 +37,7 @@ class _HomeScreenState extends State<HomeScreen> {
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '25:00',
                '$totalSeconds',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
@@ -34,7 +52,7 @@ class _HomeScreenState extends State<HomeScreen> {
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: () {},
                onPressed: onStartPressed,
                icon: const Icon(Icons.play_circle_outline),
              ),
            ),
@@ -47,6 +65,7 @@ class _HomeScreenState extends State<HomeScreen> {
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),




## 5.2 Pause Play (04:26)
// 1. 이제 일시정지 버튼을 만들어서 타이머를 일시정지하자 -> 그래서 isRunning이란 boolean property를 만든다 -> 기본값은 false로 설정
// 2. 아이콘을 타이머가 작동 중인지에 따라서 다른 아이콘을 보여준다, 만약 작동 중이라면 일시 정지 아이콘을 보여준다 -> pause circle 외곽선으로 된 아이콘을 사용한다, 만약 작동중이 아니면 play circle을 보여준다
// 3. 사용자가 타이머를 시작하면 setState에서 isRunning을 true로 변경 ( 즉, 버튼을 눌렀을 때 setState, isRunning이 true)
// 4. 일시 정지 되어있을 때 버튼을 누른다면 카운트를 시작해야 하지만 카운트가 작동 중일 때 버튼을 누르면 일시정지 해야함. -> 그래서 이제 다른 method를 만든다. void onPausePressed 이건 타이머를 멈추는 역할을 한다 -> setState에서 isRunning을 false로 한다
// 5. 타이머가 작동 중인지에 따라 onPressed를 변경한다 -> 결과: 타이머도 잘 되고 일시정지도 클릭하면 잘 작동하고 타이머도 잘 멈춘다.


@@ -1,16 +1,17 @@
import 'dart:async';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer) {
    setState(() {
      totalSeconds = totalSeconds - 1;
    });
  }
  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '$totalSeconds',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: onStartPressed,
                icon: const Icon(Icons.play_circle_outline),
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(isRunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


## 5.3 Date Format (10:27)
// 1. 새로운 property를 class에 추가한다(Pomodoros를 몇 번 완료했는지 세어 준다) -> 0부터 시작 -> 맨 끝에 있는 0을 실제 값인 변수로 변경: totalPomodoros -> 
// 2. onTick: 매 초 마다 실행되는 method -> 만약 totalSeconds가 1이라면 타이머가 끝났다는 의미니까 다시 카운터를 시작한다 -> 카운터를 멈춤 -> totalSeconds가 0이라면 카운터를 중지할 것임, 그리고 1500초로 다시 시작 -> totalPomodoros도 증가시킨다 -> setState 안에서 totalPomodoros는 1을 더해주고 isRunning은 false, totalSeconds도 초기값인 1500으로 전부 초기화한다
-> isRunning은 false, totalSeconds는 최대값인 25분으로 되돌리고 totalPomodoros도 1 증가시킴 -> 아니라면 계속해서 남은 시간을 1만큼 감소시킴
// 3. 타이머 취소: 타이머가 0이 됐을 때 timer.cancel
// 4. 25분을 보면서 기다리고 싶지 않으니까 10초로 바꾼다 -> 새로고침하면 10이 보이고  play를 누른다 -> 초기화되고 아래 숫자는 증가한다 -> 다시 play로 돌아간 게 보임 -> 다시 1500초로 돌아감,  Pomodoros 숫자는 1로 증가했다 
// 5. 1500을 실수하지 않게 명확하게 하기 위해서 const 변수를 만든다 -> static const 변수로 만든다 -> totalSeconds는 twentyFiveMinutes 변수로 시작한다 -> 타이머를 재시작 할 때 twentyFiveMinutes으로 시작
// 6. 지금처럼 초 단위로 보여주긴 싫고 분 단위로 바꾼다: format이라는 새로운 method를 만든다 -> format은 seconds라는 정수를 하나 받는다 -> duration 변수를 만들고 Duration class에서 seconds에 seconds를 넘겨줄 것임 -> duration을 출력,  seconds를 문자열로 반환 -> void 대신 String으로 바꿈 -> totalSeconds 대신 format method를 실행 -> format에 totalSeconds를 보낸다 
// 7. '25:00'처럼 형식을 맞추고 싶다 -> 이제부터 build method가 1초마다 실행된다(왜냐하면 우리가 1초마다 setState를 하고 있으니까 이 함수도 매 초 계속 실행됨): 지금은 똑같이 초 단위로 반환하지만나중에는 우리가 원하는 형식으로 만들어줄 것임.
// 8. 디버깅 콘솔에서 duration을 확인 -> 새로고침 후 디버깅 콘솔을 열고 시작버튼을 누르면 우리가 가진 duration이 보임 (Class인 Duration은 유용하다)
// 9. 첫번째 것만 list에서 선택하고 싶다 -> 디버그 콘솔에서 첫번째 것만 가져오게 함

@@ -1,23 +1,34 @@
import 'dart:async';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) {
    setState(() {
      totalSeconds = totalSeconds - 1;
    });
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }
  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '$totalSeconds',
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(isRunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          '0',
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


## 5.4 Code Challenge (01:59)

// 1. 6장 웹툰 앱 하나를 남기고 있는 상황에서 우린 API, data fetching 등등을 쓸 거다
// 2. 코드 챌린지: 현재 앱은 지금 일시정지와 재생만 할 수 있다 -> 만약 내가 재시작 하고 싶다면? 여길 다시 25로 되돌리고 싶다면? 이 세션을 다시 시작하고 싶다면 어떻게 해야할까? -> 23분이나 기다릴 수 없으니까 작게 카운트 리셋 버튼을 만들어라 
리셋하고 재시작 하는 걸 원해

// 3. state에 모든 로직, 데이터들을 여기에 적으면 된다
// 4. 화면을 변경하고 싶을때 setState안에 넣으면 된다.
// 5. 타이머의 주기(1초)마다 onTick 함수를 실행한다.
// 6. 멈추고 싶을때는 timer.cancel 

@@ -1,25 +1,36 @@
import 'dart:async';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  //
  //
  int totalSeconds = 1500;
  static const pomoTimes = 1500;
  int totalSeconds = pomoTimes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;
  // late = 나중에 초기화
  void onTick(Timer timer) {
    setState(() {
      totalSeconds = totalSeconds - 1;
    });
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = pomoTimes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }
  // periodic이 실행하는 함수는 argument로 Timer 자체를 받음
  // (new) Timer Timer.periodic(Duration duration, void *Function(Timer)* callback)
  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(
      () {
        isRunning = true;
      },
    );
    // (timer) { }를 every duration 마다 실행
  }
  void onPausePressed() {
    timer.cancel();
    setState(
      () {
        isRunning = false;
      },
    );
  }

  String format(int second) {
    var duration = Duration(seconds: second);

    return duration.toString().split(".").first.substring(2, 7);
  }

  void onResetPressed() {
    setState(() {
      totalSeconds = 1500;
      isRunning = false;
      timer.cancel();
      totalPomodoros = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '$totalSeconds',
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 50,
                  fontSize: 80,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            flex: 6,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(
                  isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          '0',
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: onResetPressed,
                          child: const Text(
                            'Reset',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w200,
                              color: Colors.white54,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

#6 WEBTOON APP

## 6.0 Introduction (05:09)
// 1. 데이터 불러오기, 인터넷에서 패키지를 다운 받아 사용하기, 스마트폰의 API 사용하는 법, 폰에 데이터를 저장하는 법을 배울 것이다
// 2. 노마드코더가 만든 비공식 네이버 웹툰 API를 사용한다( 웹툰 정보만 제공하는 API ): today라는 endpoint가 있는데 endpoint를 통해서 오늘의 웹툰에 대한 정보를 받을 수 있다, 최대 12세 이용가 웹툰만 다루도록 한다(성인용 웹툰은 제외), today에 요청을 하면 당일 웹툰에 대한 정보를 얻을 수 있고 다른 날에 요청한다면 다른 정보를 받는다, API에서 제공되는 웹툰들은 전부 전체이용가 -> 웹툰의 제목, 썸네일 URL 그리고 ID를 받게 됨 -> 웹툰의 ID를 알면 다른 endpoint를 사용할 수 있고 그 endpoint는 today 대신에 웹툰의 ID를 붙여넣으면 된다 -> endpoint를 요청하면 웹 사이트에서 웹툰을 클릭했을 때처럼 해당 웹툰에 대한 정보를 얻을 수 있다.
// 3. 응답에는 제목, 설명, 장르 그리고 연령 제한이 포함되어있다.  웹툰 썸네일도 포함 -> 웹툰 웹사이트를 보면 최근 화 목록을 볼 수 있으나 이 API는 그냥 교육 목적이기 때문에 전체 목록을 주진 않을 것임 -> 각 웹툰 당 최근 10화, 9화 정도만 반환할 것임	
// 4. 웹툰의 최근 화 목록에 접근하려면 웹툰의 ID를 적고 뒤에 episodes 라고 적으면 된다 -> 엔터를 누르면 제목, 평점, 썸네일 등의 최근 에피소드에 대한 정보를 얻을 수 있다 
// 5. 교육용 목적으로만 사용하고 웹툰 내용은 전혀 포함하고 있지 않다 -> 웹툰은 저작물이므로 보여주지 않고 대신 앱을 만든다 -> 사용자를 네이버 웹툰 사이트로 보내서 웹툰을 직접 읽도록 해주는 것 -> 우리가 만들 앱은 웹사이트에서 이미 공개한 정보만 보여줄 것(제목, 설명, 연령 제한, 카테고리, 에피소드의 제목, 당일 웹툰 목록)


## 6.1 AppBar (05:58)

// 1. 홈 화면을 만들자 -> "위젯 Constructor에서 key를 사용하시오"는 에러가 아닌 경고 -> code actions을 열면 quick fix를 통해 "Constructor에 key를 넣으시오."로 바꾸고 저장해서 고친다
// 2. 위젯의 key를 stateless widget이라는 슈퍼클래스에 보냈다:  위젯은 ID같은 식별자 역할을 하는 key가 있다라고만 알면 된다. -> Flutter가 위젯을 빠르게 찾을 수 있게 하며 code actions같은 툴이 알아서 해줄 것이다. 정리하면 위젯은 key라는 걸 가지고 있고, ID처럼 쓰인다, Flutter는 위젯을 식별하기 위해서 ID를 쓰는 것이다.
// 3. screens라는 폴더를 하나 만들고 그 안에다가 home_screen.dart라는 파일을 생성한다
// 4. 자동완성을 이용해서 stateless widget 하나를 만든다. 그리고 이 위젯을 HomeScreen이라고 부를 것이다. -> stateless widget는 Scaffold를 반환할 것임 -> scaffold는 screen을 위한 기본적인 레이아웃과 설정을 제공한다.
// 5. AppBar를 렌더링하기 : 많은 매개변수가 있다, title을 쓰고 Text를 적고 AppBar를 배경색인 초록색으로 바꾼다(backgroundColor라 적고 material design 라이브러리에서 색을 고른 뒤 녹색을 고른다)
// 6. AppBar의 글씨 색을 바꾸기 위해 foregroundColor를 사용한다 -> 제목은 녹색이 되었고 배경을 하얀색으로 바꾼다
// 7. 음영이 마음에 안들면 elevation이라 적고 값을 0이라 하면 된다. 그러면 음영이 아예 사라진다 -> 1로 설정하면 줄 같이 보이고 아니면 크게 80을 줘도 된다. 1이나 0정도가 적당한데 2로 했음
// 8. 제목을 좀 더 크게 만들 수도 있다 -> style, TextStyle이라 적고 fontSize라 적어준다. 
// 9. 폰트 바꾸기 = Google Fonts에서 폰트를 불러오는 방법:Google Fonts에서 엄청 이뻐보이는 한국어 폰트를 고른다, 제목을 오늘의 웹툰으로 바꾼다
// 10. 글씨를 좀만 더 두껍게 만든다: FontWeight에서 w500이나 w400
// 11. carousel (이미지 슬라이더)를 만들기 <- 왜? 좌우로 스크롤 할 수 있는 오늘의 웹툰 뷰를 만들려고 -> 다음 시간에 함
// 12. body의 배경색을 바꾸자 -> AppBar는 하얀색인데 body 배경색은 약간 회색이다 -> backgroundColor에서 Colors.white라 적어준다

1번. lib/main.dart파일

@@ -1,24 +1,17 @@
import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() {
  runApp(App());
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xFFE7626C),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const HomeScreen(),
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}


2번: lib/screens/home_screen.dart

@@ -1,128 +1,22 @@
import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(isRunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
              ),
            ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "어늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        ),
      ),
    );
  }
}

3번. test/widget_test.dart

@@ -1,19 +1,19 @@
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toonflix/main.dart';
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpWidget(App());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

## 6.2 Data Fetching (11:44)
// 1. lib 폴더 안에 services라는 새로운 폴더를 만든다 -> 그 안에 api_service.dart라는 파일을 만든다 -> 이 파일 안에는 Flutter 위젯이나 클래스가 아닌 평범한 Dart 클래스를 만들어주고 이 클래스를 ApiService라 부를 것임 -> ApiService는 몇몇 property(멤버변수)를 가질 것임
// 2. 예를 들어 baseUrl를 정의한다 -> 우리가 원하는 건 오늘의 웹툰을 불러오는 것: final String today
// 3. method 만들기: 현재는 이 method가 어떤 타입을 반환할지 알기 어려우므로 나중에 이걸 위해 Future라는 걸 배울 예정 -> 반환 타입을 void로 정의 -> 이 method를 getTodaysToons이라고 부른다 -> URL에 요청을 보내기 위해서는 http라는 패키지를 먼저 설치해야 함(Flutter나 Dart 패키지를 찾고 싶으면 pub.dev라는 Dart, Flutter 공식 패키지 보관소로 가면 된다, Node.js의 npm이나 Python의 PyPI랑 비슷한 개념) (Null safety가 적용되어 있고 안드로이드, iOS, 리눅스, MacOS, 웹, 윈도우에서 다 작동한다)
// 4. 설치 방법 : 방법1: 커맨드 라인에 실행시키기, 방법2, 방법3: pubspec.yaml이라는 특별한 파일(프로젝트에 대한 정보와 설정이 담긴 파일, 앱이 Material Design을 사용하는지 안하는지 설정할 수 있고 우리 앱에 이미지를 포함하려면 여기다가 이렇게 설정할거고 등등, 이 파일은 프로젝트 설정을 하는 곳이라서 매우 중요)에 붙여넣기
// 5. 모듈의 버전을 적을 수 있다(http의 0.13.5 버전). 그리고 여기 dependencies에 넣을 수 있다. -> VSCode 익스텐션에 버튼(pubspec.yaml을 열었으면 있는 버튼)을 누르면 pubspec.yaml 여기에 복붙한 모든 패키지를 설치해 준다.
// 6. 또 다른 방법: flutter pub add http -> dart pub add http나 flutter pub add http를 복붙하면 VSCode가 자동으로 패키지를 설치해 줄 것임.
// 7. URL로 GET 요청을 보내고 싶어서 get 함수를 쓴다 : 이 get 함수는 http 패키지로부터 자동으로 불러올 수 있다(import) -> 문제는 이 함수의 이름이 구체적이지 못하므로 이 패키지에 namespace를 지정해줘야 함 -> http.get -> uri 타입을 매개변수로 전달해줘야 하므로 baseUrl를 일단 넣어주고 today 변수를 적어줌
// 8. http 패키지의 get 함수의 반환 타입을 보면 반환 타입은 Future 라는 타입,  Future 안에는 Response라는 타입이 있다 -> Future는 미래에 받을 값의 타입을 알려준다. 
-> 예시) 2 더하기 2라는 코드를 Dart로 돌리면 Dart는 그냥 위에서부터 아래까지 쭉 읽고 특정 부분에 오면 바로 처리를 하고 넘어간다(코드가 매우 간단하기 때문) -> 만약에 API에 요청을 보내면 
그 요청을 처리하는데 오랜 시간이 걸릴 수 있다(유저 네트워크 문제로 오래 걸릴 수도, 서버의 메모리 문제로 느릴 수도) -> 요청이 처리될 때까지 사용자가 기다려야 함 -> getTodaysToons라는 함수를 부르면 Dart가 바로 코드를 처리하는 걸 원하지 않고 Dart가 이 부분이 제대로 완료될 때까지 기다리길 원한다. API 요청이 처리돼서 응답을 반환할 때까지 기다리는 것이다 -> 이게 async(비동기) programming(어떤 일이 일어날 때까지 기다리게 만드는 것, 프로그램이 side effect (부작용)을 기다리게 하는 것, 여기서는 서버가 응답할때까지 프로그램을 기다리게 하는 것) -> 그래서 우리는 Dart한테 이 부분이 끝날 때까지 기다리라고 알려 줄 것이다. -> 만약에 기다리라고 안하면 Dart는 이 함수를 돌릴거고, 이 코드를 실행시키고, API에 요청을 한 다음에 그냥 넘어가버릴 것이다 (우리가 원하는 게 아님)
// 9. Dart에게 결과값을 기다리라고 말할 때 await 라는 키워드를 사용하여 이 부분이 처리될 때까지 기다리라고 한다 -> await은 asynchronous function(비동기 함수)내에서만 사용될 수 있어서 async 이런 식으로 쓴다(JavaScript와 비슷) -> async await의 경우 데이터가 올 때까지 잠깐 멈춰야될 때가 있고 나서 작업을 계속 진행한다. -> future 타입과 await를 사용한다(지금 당장 실행되는 게 아니라 "미래"에 일어난다) -> type signature를 보면 어떤 데이터 타입을 받는지 알 수 있다 -> future 타입은 현재가 아닌 미래에 받을 결과 값의 타입을 알려준다. 그래서 완료가 되었을 때 Response라는 타입을 반환할 거라고 알려주는 것이다.
// 10. response.statusCode가 200일 때 response.body를 출력하자.  -> status가 200이 아닐 경우에는 에러를 발생시킨다 throw Error -> 여기선 아무것도 반환하지 않는다.
// 11. 정리 1. getTodaysToons라는 method를 만든다. 2. baseUrl과 today endpoint로 API URL를 만들고 API 서버에 요청을 보낸다. 3. 서버에서 요청을 처리하고 응답을 주는 걸 기다리고 응답을 response 변수에 저장하고 상태 코드가 200인지 체크한다. 4. 200은 요청이 성공했다는 뜻이므로 body를 출력한다. 5. response의 body에는 서버가 보낸 데이터가 있다.
// 12. main.dart으로 가서 제대로 되는지 확인하기 위해서 ApiService를 생성하고, getTodaysToons를 한 번 불러본다 -> 이 코드는 함수만 돌리고 아무것도 안 한다 + 사용자는 그냥 디버그 콘솔을 보기만 할 것이다 -> 잘 작동한다

1번   lib/main.dart

@@ -1,7 +1,9 @@
import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}


2번 lib/services/api_service.dart

@@ -0,0 +1,16 @@
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}

3번.  pubspec.lock

@@ -1,72 +1,86 @@
# Generated by pub
# See https://dart.dev/tools/pub/glossary#lockfile
packages:
  async:
    dependency: transitive
    description:
      name: async
      url: "https://pub.dartlang.org"
    source: hosted
    version: "2.9.0"
  boolean_selector:
    dependency: transitive
    description:
      name: boolean_selector
      url: "https://pub.dartlang.org"
    source: hosted
    version: "2.1.0"
  characters:
    dependency: transitive
    description:
      name: characters
      url: "https://pub.dartlang.org"
    source: hosted
    version: "1.2.1"
  clock:
    dependency: transitive
    description:
      name: clock
      url: "https://pub.dartlang.org"
    source: hosted
    version: "1.1.1"
  collection:
    dependency: transitive
    description:
      name: collection
      url: "https://pub.dartlang.org"
    source: hosted
    version: "1.16.0"
  cupertino_icons:
    dependency: "direct main"
    description:
      name: cupertino_icons
      url: "https://pub.dartlang.org"
    source: hosted
    version: "1.0.5"
  fake_async:
    dependency: transitive
    description:
      name: fake_async
      url: "https://pub.dartlang.org"
    source: hosted
    version: "1.3.1"
  flutter:
    dependency: "direct main"
    description: flutter
    source: sdk
    version: "0.0.0"
  flutter_lints:
    dependency: "direct dev"
    description:
      name: flutter_lints
      url: "https://pub.dartlang.org"
    source: hosted
    version: "2.0.1"
  flutter_test:
    dependency: "direct dev"
    description: flutter
    source: sdk
    version: "0.0.0"
  http:
    dependency: "direct main"
    description:
      name: http
      url: "https://pub.dartlang.org"
    source: hosted
    version: "0.13.5"
  http_parser:
    dependency: transitive
    description:
      name: http_parser
      url: "https://pub.dartlang.org"
    source: hosted
    version: "4.0.2"
  lints:
    dependency: transitive
    description:
      name: lints
      url: "https://pub.dartlang.org"
    source: hosted
    version: "2.0.1"
  matcher:
    dependency: transitive
    description:
      name: matcher
      url: "https://pub.dartlang.org"
    source: hosted
    version: "0.12.12"
  material_color_utilities:
    dependency: transitive
    description:
      name: material_color_utilities
      url: "https://pub.dartlang.org"
    source: hosted
    version: "0.1.5"
  meta:
    dependency: transitive
    description:
      name: meta
      url: "https://pub.dartlang.org"
    source: hosted
    version: "1.8.0"
  path:
    dependency: transitive
    description:
      name: path
      url: "https://pub.dartlang.org"
    source: hosted
    version: "1.8.2"
  sky_engine:
    dependency: transitive
    description: flutter
    source: sdk
    version: "0.0.99"
  source_span:
    dependency: transitive
    description:
      name: source_span
      url: "https://pub.dartlang.org"
    source: hosted
    version: "1.9.0"
  stack_trace:
    dependency: transitive
    description:
      name: stack_trace
      url: "https://pub.dartlang.org"
    source: hosted
    version: "1.10.0"
  stream_channel:
    dependency: transitive
    description:
      name: stream_channel
      url: "https://pub.dartlang.org"
    source: hosted
    version: "2.1.0"
  string_scanner:
    dependency: transitive
    description:
      name: string_scanner
      url: "https://pub.dartlang.org"
    source: hosted
    version: "1.1.1"
  term_glyph:
    dependency: transitive
    description:
      name: term_glyph
      url: "https://pub.dartlang.org"
    source: hosted
    version: "1.2.1"
  test_api:
    dependency: transitive
    description:
      name: test_api
      url: "https://pub.dartlang.org"
    source: hosted
    version: "0.4.12"
  typed_data:
    dependency: transitive
    description:
      name: typed_data
      url: "https://pub.dartlang.org"
    source: hosted
    version: "1.3.1"
  vector_math:
    dependency: transitive
    description:
      name: vector_math
      url: "https://pub.dartlang.org"
    source: hosted
    version: "2.1.2"
sdks:
  dart: ">=2.18.4 <3.0.0"

4번. pubspec.yaml

name: toonflix
description: A new Flutter project.

# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev
publish_to: "none" # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
  sdk: '>=2.18.4 <3.0.0'
  sdk: ">=2.18.4 <3.0.0"

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  flutter:
    sdk: flutter

  http: ^0.13.5

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
dev_dependencies:
  flutter_test:
    sdk: flutter
  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^2.0.0
# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true
  # To add assets to your application, add an assets section, like this:
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg
  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware
  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages
  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages


## 6.3 fromJson (09:59)
// 1. 이제 우리는 서버로부터 데이터를 받을 수 있다 -> 이제 우리는 서버로부터 받는 이 JSON 형식의 데이터를 Dart와 Flutter에서 쓸 수 있는 데이터 형식인 클래스로 바꿔줘야 함 -> 다시 말해 우리는 이 텍스트를 클래스로 바꿔줘야 함(웹툰 하나하나를 클래스로 만들어서 전체를 여러 클래스들로 이루어진 리스트로 변환해줘야 한다)
// 2. models라는 새로운 폴더를 만든다 -> 그 안에 webtoon.dart라는 파일을 만든다 -> 클래스 하나를 만들고 이 클래스를 WebtoonModel이라고 부른다 -> 나중에 webtoon 위젯을 만들 수도 있으니
파일도 webtoon_model.dart로 바꿔준다
// 3. 이제 클래스가 가질 property (멤버변수)를 정의해준다 -> 클래스의 Property를 정의하는 건 매우 쉽다, 응답이나 API를 찾아보면 응답이 매우 간단하다 -> title, thumb, id 총 3개의 문자열 -> Constructor를 만들어서 title, thumbnail, id를 필수 매개변수로 설정한다.
// 4. response.body는 그냥 string -> 이 body를 JSON으로 decode 해줄 것임(본래 포맷이 string이 아니라 JSON이라서) -> JSON으로 바꾸려면 jsonDecode라는 함수 사용 -> 사용 방법: string을 매개변수로 넘겨주면 된다 -> jsonDecode의 반환값 타입은 dynamic(어떤 타입이든 수용 가능 -> 그래서 우리가 타입을 직접 정해줘야 된다) -> jsonDecode의 리턴 타입은 응답 텍스트를 보면 여러 object로 이루어진 리스트 (디버깅 콘솔) -> 여러 object로 이루어진 리스트 -> final이라 적고 타입은 List -> dynamic으로 이루어진 List가 된다
// 5. 이 변수를 webtoons라고 선언해줌 -> for loop을 사용해서 webtoons에 있는 webtoon을 하나씩 출력해본다.
// 6. 그냥 텍스트로 된 응답 body를 JSON으로 디코딩해주는 과정이다. -> 보면 그냥 string인데 그걸 JSON으로 변환하는 것이다 -> dynamic으로 이루어진 리스트를 반환 받는다 ->  webtoon을 출력해주고 나중에 그걸 클래스로 만들어준다 
// 7. dynamic 타입인 webtoon으로 WebtoonModel 클래스를 초기화한다(무료 Dart beginner 강의에서 배운 named constructor를 쓴다) -> named constructor의 이름은 fromJson -> fromJson named constructor는 map을 받는다 -> 이 Map은 String과 dynamic 타입으로 이루어져있다 -> 이걸 json이라고 부를 것이다 ->  webtoon을 쓰는 대신에 WebtoonModel를 불러와서
-> WebtoonModel.fromJson이라 적고 webtoon을 넘겨줘서 WebtoonModel를 만든다.
// 8. 클래스의 title, thumb, id를 SON의 제목, 썸네일, 아이디 값을 토대로 초기화 -> named constructor라고 하고 이름이 있는 클래스 constructor(생성자)
-> 이름 있는 부분이 title, thumb, id 등을 초기화하는 편리한 구문일 뿐 -> 여기에서 우리 API로부터 JSON을 넘겨주고 WebtoonModel의 title을 JSON의 title로 초기화시켜줌 -> 이게 바로 이 클래스가 받을 JSON이다
// 9. WebtoonModel title은 JSON의 title로 초기화되고 썸네일은 JSON의 썸네일에 대응하고, ID는 JSON의 ID에 대응한다. -> 이 코드는 API로부터 받은 JSON으로 새로운 WebtoonModel을 만들 것이다.
// 10.var이라고 하든 final이라 하든 변수에 저장한다. -> 이 변수의 타입은 WebtoonModel -> 이걸 출력할 것이다, toon의 제목, 썸네일, ID에 접근 가능 -> 새로고침 후 디버깅 콘솔을 보면 WebtoonModel의 인스턴스가 47개 -> 그리고 toon.title이라고 한다 -> 디버깅 콘솔을 보면 데이터가 Dart에서 사용할 수 있는 형식으로 되어있는 걸 알 수 있다
// 11. 마지막으로 여러 WebtoonModel로 구성된 list를 만들 것임 -> 이 리스트는 처음에는 비어있다, 이걸 webtoonInstances라고 부르자. -> 우리가 JSON으로 웹툰을 만들 때마다 그 웹툰을 webtoonInstances 리스트에 추가해준다.
// 12. webtoonInstances.add라 치고, 그 안에서 웹툰 클래스를 정의한다 -> webtoonInstances를 반환해준다.
// 13. Dart 에러 (사용자가 WebtoonModel 리스트를 반환하고 있기 때문, 하지만 이 method는 아무것도 (void) 반환하지 않는다고 했었음) -> 이 method가 WebtoonModel 리스트를 반환하는 걸로 바꿔준다 -> 그래도 아직도 계속 틀렸다고 뜨는데 이 함수가 future를 기다리는 비동기 함수이기 때문 -> Future를 써서 해결

1번. lib/models/webtoon_model.dart

@@ -0,0 +1,8 @@
class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}

2번 lib/services/api_service.dart

@@ -1,15 +1,22 @@
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}

## 6.4 Recap (06:09)

// 1. API에 요청을 보낼 ApiService라는 클래스를 만듦 (pub.dev에서 http 패키지를 다운 받았고 API에 HTTP 요청을 보냈음)
// 2. http.get은 Future라는 타입을 반환함. Future란 당장 완료될 수 있는 작업이 아니라는 것이므로 우리는 이 작업이 끝날 수 있을 때까지 기다려야함.
// 3. 그 작업이 마무리가 되면, Response라는 타입을 반환함. Future가 마무리되기를 기다렸다가 Response를 저장
// 4. Response가 성공했는지 확인하고 Response의 body 부분을 디코딩, 응답의 body는 그냥 string 문자열임. 우리는 string을 JSON 형식으로 변환하고 싶다(원래 응답의 포맷이 JSON이니까 나중에 우리가 사용할 수 있도록 JSON으로 변환해주는 것)
// 5. API에서 받은 JSON으로 webtoonModel를 만들고 싶다. 필수는 아니지만 JSON의 형식이 dynamic 값으로 이뤄진 리스트인 것을 기억하기 쉽도록 적어둔다. 이 값들이 정확히 뭔지는 알 수 없음. 그냥 JSON인 것만 알고 값을 위한 타입은 아직 없음. 우리 API를 신뢰하고, API를 접근할 수 있기 때문에우리는 이 API가 웹툰 리스트를 반환할 것이라는 것을 알 수 있음. 리스트인 것을 알기 때문에 여기에서 for in 구문을 사용 가능함.
// 6. 리스트에 있는 웹툰 하나 당 fromJson이라는 named constructor를 사용해서 WebtoonModel를 만들어줌. constructor를 만들어줌. JSON에 property가 없을 수 있으니깐 에러가 날 수도 있지만 late로 지정해주면 문제 없이 작동함. 문제는 이게 잘 쓰이는 패턴이 아님. 우리가 여기서 하는 건 웹툰 JSON으로 WebtoonModel 인스턴스를 만드는 게 다임. 그리고 JSON은 그냥 map, 그냥 string이 key이고, value가 dynamic인 map이다.
// 7. WebtoonModel 인스턴스를 생성한 다음에는 WebtoonModel을 webtoonInstances 리스트에 넣어줌. 처음에 리스트에는 아무 것도 없지만 우리가 WebtoonModel를 만들고 나면 webtoonInstances 리스트에 WebtoonModel를 넣어주는 것. 그리고 그 리스트를 반환함. 리스트를 출력해볼 수도 있음
// 8. webtoonInstances를 출력하기: 새로고침 해주고 디버깅 콘솔에 가면 WebtoonModel 인스턴스로 이뤄진 리스트임. 이제 다시 이전에 만든 constructor로 되돌린다. constructor 방식
대신 우린 named constructor를 사용함. Constructor의 인수만 적어주고 property를 적어주면 초기화 가능 -> map은 object처럼 Dart가 지원하는 key-value 데이터 구조임. 이 경우에는 key는 JSON의 key이고 value는 JSON의 body.
// 9. final instance 
// 10. 지금까지 API 요청을 보내고 JSON을 받은 게 다임. 그리고 JSON에 있는 아이템 각각을 WebtoonModel Instance로 만들어줬다.
// 11. 우리 API 데이터를 갖고 있는 WebtoonModel의 리스트가 있고 이제 화면에 출력을 할 것임.
// 12. Future를 기다리기 위해 await를 사용할 때는 async를 사용해야 함. 그리고 비동기 함수로 지정하면 그 함수의 반환 값 타입은 Future
// 13. 함수가 마무리되었을 때 반환할 타입을 적어줘야 함. 왜냐하면 우리가 이 함수를 불렀을 때 이 함수가 완전하게 마무리될 때까지 기다리고 싶기 때문임. 그래서 함수를 Future로 지정했음. 이 함수도 종료되려면 해당 부분이 완료될 때까지 기다려야 되기 때문에 우린 이 함수를 기다려주고 함수는 이 부분을 기다림.

파일: lib/services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';
class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";
  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      final webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }
}

## 6.5 waitForWebToons (05:48)
// 1. 이제 클래스의 모든 method와 property를 static으로 바꾼다. 이 클래스에는 state 가 없다.
// 2. main 함수에서 호출하는 코드를 지운다. 이건 그냥 콘솔로 확인해보려는 거였음.
// 3. 이제 이 method를 HomeScreen에서 호출할 것임. 데이터를 보여줘야 하는 곳이 바로 거기임
// 4. Future 데이터를 불러와서 보여주는 방법은 두 가지: 1. 기초적인 방법(지난 섹션에 배웠던 것들을 복습) -> 우선 HomeScreen을 StatefulWidget으로 바꿈(state를 사용할 거라서) -> 
code action을 열어서 StatefulWidget으로 바꿔줌 -> 그러면 widget은 여기에 있고, 여기 State가 생김(State는 UI와 변할 수 있는 데이터를 가지고 있음) -> State가 가지는 데이터를 써주고 데이터의 타입은 WebtoonModel의 리스트 -> 이름은 webtoons으로 지정 -> 초기값은 빈 배열
// 5. 이제 isLoading state를 하나 더 만듦. -> 초기값은 true
// 6. initState를 사용 -> 먼저 super.initState를 호출 -> 여기서는 waitForWebtoons라는 함수를 호출 -> 함수 만들기 -> 비동기 함수(HTTP 요청을 기다리는 함수를 기다려야 하기 때문 / API service에 있는 이 함수는  HTTP 요청을 기다리고 있음. 즉, getTodaysToons 함수가 http 요청을 기다리기 때문에 getTodaysToons 함수가 종료되는 것도 기다려야 함)
// 7. 이제 State의 webtoons 배열에 데이터를 넣기 :  getTodaysToons 함수를 await 하면 그 값은 WebtoonModel의 리스트가 됨. -> 이 작업이 끝나면 isLoading을 false로 바꿈 -> 어떤 함수를 호출하면 StatefulWidget의 UI가 새로고침 되었음. ->  setState를 호출 -> webtoons와 isLoading을 print(두 개를 한 번에는 못 한다)
// 8. 콘솔을 열면 처음엔 webtoons가 빈 배열, IsLoading은 true ->  webtoon에 Instance of WebToonModel이 엄청 들어왔음, isLoading은 false가 되었음.
// 9. 어려운 건 데이터를 fetch하는 부분 -> Future를 이해하고 그걸 어떻게 기다리는지만 알면 된다 -> 우리가 한 것은 initState를 사용한 것뿐 -> initState에서 이렇게 데이터를 받아오는 함수를 호출하고 받아오기가 끝나면 그 데이터를 webtoons에 넣음 -> isLoading을 false로 바꾸고 화면을 새로고침 (근본적으로 build 메서드를 다시 실행하라고 하는 것)
// 10. 이 방법은 그다지 맘에 들진 않음 -> 왜? webtoons와 isLoading을 만들어야 하고 그 다음엔 수동으로 await 해줘야 하고 isLoading을 false로 바꾸는 것도 잊으면 안 되고 setState도 쓰고 그걸 또 initState에 써야 함 -> 함수도 만들고, async도 써 주고... 할 일이 너무 많다 -> 실수를 할 수도 있고, 반복이 많아질 수도 있음
// 11. 일단 데이터가 없는 상태에서 화면이 뜨면 로딩화면을 보여주고, 데이터를 받은 후에 데이터를 보여줄 거임. -> API에서 데이터를 fetch 할 때 항상 일어나는 일 -> Future를 기다리는 좀 더 나은 방법은 다음 강의에서 다룸.

1번 lib/main.dart

@@ -1,9 +1,7 @@
import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

2번 lib/screens/home_screen.dart

@@ -1,10 +1,34 @@
import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebToons() async {
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForWebToons();
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "어늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

3번 lib/services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }
}

## 6.6 FutureBuilder (07:05)
// 1. 이 ApiService 클래스는 만들 필요 없다 -> 만든 이유: 코드를 정돈하고, 서비스로 분리하고 UI와 API 접근이 간섭받지 않기 위해 -> 하지만 원한다면 다른 곳에 복사 붙여넣기 하면 모든 게 똑같고 마지막에 setState만 하면 된다.
// 2. 필요한 데이터를 fetch하는 다른 방법: StatelessWidget인 상태에서 fetch 할 수 있기 때문에 좋음. 그래서 굳이 StatefulWidget을 사용할 필요가 없음. -> code actions을 열어서 StatelessWidget으로 되돌린다. -> 만들어 둔 Future를 클래스의 가장 처음에 불러온다 -> 이름은 webtoons -> APIService.getTodaysToons 메소드로 값을 가져옴 
// 3. HomeScreen을 const 클래스로 만들었는데 지워야 함. 생각해보면 당연하다 -> 지금 클래스 안에 Future을 넣었으므로 클래스가 const 일 수가 없음(const는 컴파일 전에 값을 알고 있다는 뜻) -> 이런 경우에 우리가 값을 알 수 없다. -> Future는 API로부터 오는 값이므로 이 클래스는 const가 될 수 없다.
// 4. main.dart도 여기 const를 쓰고 있으므로 지움
// 5. 어떻게 Future를 기다릴 수 있을까? 그리고 Future의 로딩 상태를 어떻게 build 메소드에 전달할 수 있을까? -> webtoons를 출력해 보면 우리가 Future를 전혀 기다리지 않고 있단 걸 볼 수 있다.Debug Console에는 WebtoonModel의 리스트의 "Future"가 찍히고 있다. WebtoonModel의 리스트 그 자체가 아니다. Future가 찍히니까, 이걸 기다려야 한다. -> Widget 중 FutureBuilder 사용  -> scaffold의 body에 FutureBuilder를 넣음
// 6. FutureBuilder에는 builder라는 매개변수가 필요(Builder는 UI를 그려주는 함수) -> initialData도 전달 가능,  future도 전달 -> FutureBuilder에게 webtoons를 기다려달라고 함 -> 이제 FutureBuilder가 여기에 await을 붙여줌. await를 쓸 필요가 없음(FutureBuilder가 해 줄 것이기 때문)
// 7. 여기에 builder 함수를 만들어야 함. -> FutureBuilder가 Builder에 전달하는 매개변수: 첫 번째는 BuildContext, 두 번째는 snapshot이야 -> snapshot을 이용하면 Future의 상태를 알 수 있음. -> snapshot을 살펴 보면 Future가 데이터를 받았는지, 아니면 오류가 났는지 알 수 있음 + connectionState도 알 수 있음.
// 8. 사용자를 위해 기다려줌.이 future를 기다려줄 거고 snapshot을 통해서 변화를 알려줄 것임. -> snapshot.hasData가 참이면 Future가 완료되서 데이터가 존재하면 "There is data!"라는 Text를 반환함. -> 데이터가 없으면, "Loading"을 반환한다. -> 새로고침하면 굉장히 빨리 변함 -> 잘 보면 "Loading..." 이 나타난 뒤에 데이터가 들어옴(로딩 다음에 데이터), StatefulWidget을 쓸 필요가 없다. ->적절한 Widget을 사용하기만 하면 된다 -> widget이 future를 기다리고 snapshot.hasData가 참이면, UI에 이 Text를 보여주고 hasData가 거짓이면, 이걸 보여줌.
// 9. await할 필요도 없고, setState도 쓸 필요 없고, isLoading을 조작할 필요도 없이 아무것도 안 해도 됨. -> Future를 만들고, 그걸 FutureBuilder에 넣기만 하면 됨. -> FutureBuilder는 자기가 기다릴 Future랑 builder 함수를 받음 ->  그리고 builder 함수는 context와 snapshot을 전달받음. -:snapshot은 바로 Future의 상태임(로딩 중인지, 데이터가 있는지, 에러가 났는지를 알 수 있음)

1번 lib/main.dart

@@ -1,16 +1,16 @@
import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
void main() {
  runApp(const App());
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

2번 lib/screens/home_screen.dart

@@ -1,34 +1,14 @@
import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebToons() async {
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForWebToons();
  }
  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "어늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text("There is data!");
          }
          return const Text('Loading....');
        },
      ),
    );
  }
}
## 6.7 ListView (11:59)
// 1.  Future에 final 키워드를 붙여줘야 경고 문구가 사라진다 -> 그냥 Loading 문구를 리턴하고 싶지 않으므로 대신 Center를 리턴함. 자식으로는 CircularProgressIndicator를 넣음. -> 새로고침하면 뭔가가 로딩되는 걸 볼 수 있다 -> loading indicator가 뜸
// 2. 데이터는 snapshot.data 안에 있음. snapshot이라는 이름이 싫으면, futureResult, 혹은 future로 바꿔도 됨. future.hasData가 참이면, 그 다음 것을 실행한다. -> snapshot이란 이름을 쓰겠지만 원하는 이름으로 골라쓰면 돼.
// 3. Text 대신에 ListView를 씀 -> 많은 양의 데이터를 연속적으로 보여주고 싶을 때 Colum이나 Row는 적절하지 않음 -> ListView는 여러 항목을 나열하는데 최적화된 Widget -> 그럴 때에는 ListView 쓰자 -> ListView는 버전이 많음(초보자들을 위한 버전을 써 본 다음 최적화된 버전을 써 볼 것임) -> ListView의 기본값들을 이용하면 여러 항목을 나열하는데 도움이 된다는 걸 알게 될 
// 4. 이 코드 블럭은snapshot이 데이터를 가지고 있을 때만 실행된다. future의 동작이 끝나고 서버가 응답했을 때
// 5. ListView는 children을 가질 수 있다. 여기서 collection for을 다시 써 본다.
// 6. shapshot의 데이터는 future의 결과값 그리고 future의 결과는 WebtoonModel의 리스트 -> snapshot.data가 null일 수 있어서 보다시피 오류가 나고 있음. ->  null이 아니라고 다트에게 말해야 함 -> null이 아닌 걸 아는 이유: 이 코드는 snapshot.hasData가 참일 때만 실행되기 때문(snapshot.hasData가 거짓이면 이 코드는 실행되지 않는다) -> 느낌표를 써 주면 이건 shapshot에 데이터가 있다고 확신한다는 걸 의미함.
// 7. 결과: 자동으로 멋진 scroll view -> ListView 때문
// 8. 이제 ListView를 수정하자 (비효율적) -> 안에 여러 항목을 넣기만 하면 잘 작동함 -> 기본적으로 scoll view도 제공함 -> ListView의 문제는 최적화되지 않았다는 것(한 번에 모든 아이템들을 로딩하고 있어 좋지 않다) -> 만약 여러분이 인스타그램이나 틱톡 같은 SNS를 만들고 있다면 타임라인에 있는 모든 사진을 한 번에 로딩하면 안 됨. -> 사용자가 보고있는 사진이나 섹션만 로딩해야 함. 한 번에 다 로딩하면, 메모리를 굉장히 많이 사용됨. -> 계속 스크롤을 내릴 수 있는 무한스크롤 같은 기능을 쓰면 결국은 메모리가 죽고 말 것임. -> 그래서 ListView를 이렇게 쓰는 대신에 다른 종류의 ListView를 써 볼 것임.
// 9. ListView.builder는 좀 더 최적화된 ListView -> ListView.builder는 옵션이 많다 -> 예를 들어, 스크롤 방향을 수직 방향이 아니라 수평방향으로 스크롤 하고 싶다. 두 번째로, list의 아이템의 개수를 설정 가능(이건 ListView를 최적화 해주는 좋은 기능, 다트가 몇 개의 아이템을 build 할 건지 알게 됨) - webtoons의 전체 크기는 snapshot.data.length(snapshot.data가 WebtoonModel의 리스트니까) -> 반드시 존재한다는 걸 아니까 느낌표를 넣어준다.
// 10. 필수 인자가 있어야 한다 -> Widget을 반환하는 함수의 이름은 itemBuilder -> 두 번째 shortcut을 선택 -> FutureBuilder의 builder와 아주 비슷함 -> 다른 점: 0, 1, 2... 같은 인덱스에만 접근할 수 있음, 이 인덱스로 어떤 아이템이 build 되는지 알 수 있음. -> ListView.builder는 사용자가 보고 있는 아이템만 build함. -> 사용자가 어떤 아이템을 안 보고 있다면 ListView.builder는 해당 아이템을 메모리에서 삭제할 것임.
// 11. 어떤 아이템이 build 되는지 알 수 있는 유일한 방법은 인덱스를 이용하는 것 뿐이다. -> itemBuilder는 인덱스가 0, 1, 2...인 아이템이 build 됐다고 알려줄 것임. -> 지금은 snapshot.data가 리스트라서 이 작업은 아주 쉬워.
// 12. 정리: ListView.builder도 리스트를 build 하는 것은 공통점이나 차이점은훨씬 최적화가 되어 사용자가 볼 수 없는 아이템은 build하지 않음. -> ListView.builder는 모든 아이템을 한 번에 만드는 대신 만들려는 아이템에 itemBuilder 함수를 실행한다. -> 그러면 여기서 build 되는 아이템의 인덱스에 접근할 수 있다. -> 우리의 snapshot.data는 리스트이기 때문에 0, 1, 2... 같은 인덱스로 아이템에 접근할 수 있다.
// 13. 인덱스를 프린트하는 방법: Debug console로 가서 새로고침 -> 10개의 아이템만 만들어짐 -> 한 번에 다 로딩하지 않고 필요할 때 아이템을 만든다. itemBuilder 함수가 인덱스 0에서 10까지 호출된다 -> 그래서 인덱스로 0부터 10까지의 아이템을 찾은 다음 그걸로 Text를 build 하고 있음 
// 14. 콘솔을 지우고 스크롤 한다 -> 스크롤 하면 필요한 아이템이 만들어진다 -> 뒤로 이동하면 아이템들이 다시 만들어진다(재활용됨) -> 이렇게 한 번에 모든 아이템을 만들지 않는 것이  ListBuilder 함수 -> 프레임워크에 탑재된 기능
// 15. 몇 가지 개선: ListView.separated는 separatorBuilder라는 필수 인자를 하나 더 가진다 -> separatorBuilder은 widget을 리턴해야 하는 함수 -> 그리고 그 widget은 리스트 아이템 사이에 렌더 될 것임(아이템들을 구분하기 위해서) ->그리고 SizedBox를 리턴(너비는 20 정도)로 -> ListView가 리스트와 구분자를 렌더함.
// 16. 처음에는 구분자를 렌더하지 않음. -> 맨 앞에는 구분자가 없다. 
// 17. ListView.separated, futureBuilder는 개발 경험과 최적화에 많이 신경썼다고 느껴짐 + SDK 패키지라 최고다 -> 여기에 print(index) 하면  정확히 어떤 아이템이 만들어지고 있는지 보여줌.


파일 lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "어늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text("There is data!");
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            );
          }
          return const Text('Loading....');
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
## 6.8 Webtoon Card (13:55)

// 1. 초보자 버전(ListView 안에 아이템들을 모두 수동으로 그리는 방식) -> 초보자 버전도 스크롤 뷰도 제공하고 괜찮았음
// 2. ListView.Builder는 더 최적화 돼 있다. -> 모든 아이템을 한 번에 로드하지 않는다,  필요할 때만 로드함 -> 그게 바로 itemBuilder가 있는 이유
// 3. itemBuilder는 ListView의 아이템을 만드는 역할을 함 -> itemBuilder는 만들어야 하는 아이템의 위치(숫자)를 받음 -> 그 숫자는 0부터 아이템의 총 개수까지 이르게 됨 -> itemBuilder가 4번 아이템을 만들기 위해 호출되면 데이터에서 4번 아이템을 가져오면 된다 -> 그리고 4번 아이템의 title을 가진 widget을 리턴함.
// 4. ListView.separated에는 또 다른 Builder(아이템들 사이에 구분자를 넣어주는 builder)가 있다 -> 구분자를 넣을 수 있고 margin이나 padding을 설정해 줄 필요가 없다, 간격이 얼마나 될지만 말해주면 된다. -> SizedBox를 리턴하기만 하면 되고 구분자는 뭐든 될 수 있다(widget, 이모지, 텍스트 뭐든 가능하다)
// 5. Builder가 너무 많은 게 싫으면 부분을 추출해서 별개의 메소드로 작성하면 된다. 한 번에 코드를 쓰는 것 대신에 전구 위에 마우스를 올리면 나오는 code actions에서 extract method를 선택한다.
// 6. 새 메소드의 이름을 makeList 라고 하면 이제 makeList라는 함수의 결과를 리턴한다. -> 이건 snapshot을 넘겨 받음(전부 자동) -> 함수가 반환하는 타입, snapshot의 타입도 제대로임. -> 우리가 snapshot을 쓴다는 걸 알기 때문에 그걸 parameter로 받는 method를 만들었다. -> 바뀐 건 아무것도 없고 코드는 훨씬 보기 좋아졌다.
// 7. 이제 SizedBox를 이용해서 리스트와 위쪽 사이에 공간을 넣자 -> 웹툰의 표지를 보여주는 이미지를 만들고 싶다 -> 첫 번째, 리스트를 만들기 전에  Column과 SizedBox를 넣는다 -> Column를 리턴해주고 children을 넣는다 + SizedBox를 높이 200으로 하나 넣는다 -> makeList(snapshot)을 넣는다 -> 저장하고, 새로고침하면 보다시피 에러가 뜬다. -> 이 에러는 수평 뷰포트가 제한없는 높이를 가지기 때문이다.

// 8. 이 Column에는 SizedBox와 ListView가 있다 -> 문제는 ListView에 높이값이 없다는 것 -> 그래서 Column은 ListView가 얼마나 큰지 알지 못한다 -> 그래서 ListView에 제한없는 높이값이 넘어왔다고 하는 것(무한한 높이) -> 해결하려면 ListView에 제한된 높이를 줘야 함. 이를 위해서 makeList를 Expanded로 감싼다(Expanded는 화면의 남는 공간을 차지하는 widget) -> 문제는 ListView가 무한한 높이를 가지는 것(레이아웃 시스템은 ListView가 얼마나 큰 지를 모른다) -> 왜냐면 ListView는 Column 안에 있고 Column도 역시 무한한 높이를 가지기 때문임  -> 그래서 ListView.separated를 Expanded widget 안에 넣어줄 것임. -> Expanded는 Row나 Coumn의 child를 확장해서 child가 남는 공간을 채우게 한다. -> ListView를 Expanded 안에 넣으면 ListView가 남는 공간을 채우게 될 거고 그러면 크키가 적당한 선으로 조정될 것임.
// 9. SizedBox를 50으로 고침 -> 나중엔 SizedBox에 이미지가 들어갈 것임.
// 10. seperated ListView를 만들고 있었음 -> 공간을 40을 주고 Text 대신에 Column을 children과 Text와 함께 리턴함 -> 새로고침 
// 11. Column의 맨 위에 이미지를 넣자 : Image도 flutter가 제공하는 widget이므로 Image.network를 쓰자. -> Image.network은 URL이 필요
// 12. 결과 : 스크롤을 빨리 하면 이미지가 로딩된다. -> 빨리 스크롤하면, 이미지가 필요에 따라 로딩 된다. -> 이건 우리가 itemBuilder를 쓰고 있다는 걸 보여준다.
// 13. 커버 이미지를 작게 만들자: Image.network를 Container 안에 넣어야 한다. -> Container가 child로 이미지를 가진다고 해준다. -> Container의 너비를 250으로 설정 -> 그러면 Container를 자동으로 SizedBox로 바꿨음
// 14. 텍스트를 보기 좋게: fontSize는 22, fontWeight는 w600
// 15. 사이에 간격을 넣기: 이미지와 텍스트 사이에 SizedBox 높이 10으로 넣기 -> SizedBox가 됐던 걸 Container로 바꿔줌 -> Container를 쓰는 이유는 이 박스를 꾸밀 거기 때문
// 16. 아직 BorderRadius가 clipBehavior 때문에 적용이 안 됬다 -> clipBehavior는 자식의 부모 영역 침범을 제어하는 방법이었음 -> hardEdge로 설정해서 저장하면 둥근 모서리를 갖게 되고 15로 고쳐준다
// 17. 그림자: BoxDecoration에서 만든다 -> boxShadow 그림자는 원하는 만큼 만들 수 있다 ->  boxShadow를 쓰고 배열을 하나 만들어서 BoxShadow를 넣음. -> boxShadow 안에서 BoxShadow를 세팅함 -> blurRadius는 그림자가 얼마나 멀리까지 드리울지를 정함 -> 
offset은 그림자의 위치를 정한다 -> (0, 0) 같은 좌표로 지정하면 된다(정확히 중앙에 위치) -> 색깔도 조절 -> 검은색으로 해서 withOpacity도 설정 (불투명도는 50%) -> blurRadius를 더 크게 하면 그림자가 더 커짐  -> 불투명도를 1로 설정해서 그림자가 더 잘 보이게 함 -> offset도 옮긴다 -> 그림자를 x축으로 이동 -> 10으로 바꿈 -> 그림자가 바깥쪽으로 이동 -> 태양의 위치를 10으로 바꾼다. -> blurRadius는 7로 바꿔줌 -> 투명도는 0.5로 바꿔줌. -> blurRadius는 더 크게 15로 -> 그림자 위쪽이 잘려있음 -> 리스트에 padding을 준다 -> ListView.separated로 와서 padding 옵션을 찾자 -> padding을 둘 다 넣는다 -> symmetric으로 -> 수평방향으로는 10, 수직방향으로는 20

파일 lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "어늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Column(
          children: [
            Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.3),
                  )
                ],
              ),
              child: Image.network(webtoon.thumb),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              webtoon.title,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 40),
    );
  }
}
