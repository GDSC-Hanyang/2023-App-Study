5주차 WIL 김지송

# Chapter 5

## #5.0 - User Interface

`Column` 이나 `Row` 안에 포함되어 있는 위젯은 **자신의 크기만큼만** 공간을 차지한다.

**`Flexible`** 는 UI를 비율에 기반하여 더 유연하게 만들 수 있게 해준다.
`flex` 파라미터에 원하는 비율을 넣을 수 있다.

```dart
Column(
    children: [
        Flexible(
            flex: 1,
            child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.red,
                    ),
                ),
        ),
        Flexible(
            flex: 2,
            child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.green,
                    ),
                ),
        ),
        Flexible(
            flex: 1,
            child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                    ),
                ),
        ),
    ]
)
```

**`Expand`** 는 남은 화면을 꽉 채우게 되는 위젯이다.

* children 에 **`Flexible`** 이 여러 개라면 **`Flexible`** 이 아닌 widget에게 먼저 공간을 할당하고 나머지 **`Flexible`** 위젯에게 남은 공간을 분할한다.

## #5.1 Timer 

**`late`** modifier - 해당 property를 당장 초기화하지 않아도 된다는 것을 뜻한다.
-> 나중에 초기화해줄 것을 "약속"
-> "약속"이기 때문에 사용하기 전에 반드시 초기화되어야 한다. 그렇지 않으면 런타임 예외가 발생한다.

**`Timer`**
**`Timer`** 는 Dart의 Standard Library 에 있는 라이브러리
-> Timer.periodic(주기(Duration), 실행할 함수 {})
```dart
timer = Timer.periodic(
    const Duration(seconds: 1),
    onTick, //괄호는 지금 함수를 실행하는 것을 의미하기 때문에, 괄호를 뺀다! Timer가 Duration 마다 괄호를 넣어 실행할 것!
);

void onTick(Timer timer) { //Timer를 parameter로 받아주어야 한다
    setState(() {}); 
}
```

## #5.2 Pause Play

`isRunning` 이라는 bool 변수를 만들어서 위젯에 bool 값에 따른 기능을 추가한다.

`isRunning` 에 따라 `onStartPressed()` 와 `onPausePressed()` 를 번갈아 실행한다.

```dart
IconButton(
    onPressed: isRunning ? onPausePressed : onStartPressed,
    icon: Icon(isRunning
        ? Icons.pause_circle_outline
        : Icons.play_circle_outline),
)

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
```

## #5.3 Date Format

`static const`

`const` -> 상수 값을 선언하는데 사용되는 키워드. 한 번 정의되면 변경할 수 없다.
`static` -> 클래스 레벨에서 멤버를 선언할 때 사용되는 키워드. 클래스 내에서 모든 인스턴스에서 공유되는 속성 또는 동작을 정의할 때 사용

형 변환! `Format`

`Duration` 클래스
```dart 
Duration Duration({
  int days = 0,
  int hours = 0,
  int minutes = 0,
  int seconds = 0,
  int milliseconds = 0,
  int microseconds = 0,
})
```

duration의 형태 '0:00:00.000000'

`split` 문자열을 주어진 구분자(또는 정규 표현식)를 기반으로 분할

ex) 
```dart
    String.split("."); //. 을 기준으로 분할
    // 23:00.0000 -> [23:00, 0000]
```
`substring` 문자열을 일부분만 추출

ex) 
```dart
    String.subString(2,7); // 2번 위치부터 7번 위치까지
    // 0:23:56.0000 -> 23:56
```
<br>

```dart
String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.subString(2,7)
}
```

---

## #6.1 AppBar

AppBar를 생성하는 방법

```dart
Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
    elevation: 2,
    foregroundColor: Colors.green, //글자색
    backgroundColor: Colors.white, //배경색
    title: const Text(
        "오늘의 웹툰",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
        ),
    ),
    ),
)
```

## 6.2 Data Fetching

URL에 요청을 보내기 위해서는 http 패키지를 설치해야한다.

(pub.dev에서 http로 찾아서 설치하기) 

pubspec.yaml => 프로젝트의 설정을 담당하는  파일

`get()` -> http 패키지의 함수, 특정 URL에 요청을 보낸다.

Future 은 미래의 받을 값의 타입을 알려준다.

### **비동기 프로그래밍**

```dart
void getTodaysToons() {
    final url = Uri.parse('$baseUrl/$today');
    http.get(url);
}
```
`getTodaysToons()` 를 호출했을 때, Dart는 코드가 바로 처리되는 걸 원하지 않는다.
<br>
Dart는 `http.get(url);`가 제대로 완료될 때까지 기다리길 원한다.
<br>
API 요청이 처리돼서 응답을 반환할 때까지 기다리는 것!!

그럼 API 요청을 기다리게 하려면 어떻게 해야할까? => `await` 키워드
<br>
* `await` 키워드를 쓰려면 `async` 함수 내에서만 써야한다!! 

```dart
void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    await http.get(url);
}
```

`get()` 의 반환값은 `Future<Response>`
<br>
완료가 되었을 때, Response를 반환할거라고 알려주는 것!

## 6.3 fromJson

서버로부터 받아온 JSON 형태의 데이터를 Dart와 Flutter에서 쓸 수 있는 데이터 형식인 클래스로 바꿔줘야 한다.

```dart
class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
```

## 6.5 waitForWebToons

데이터가 없는 상태에서 화면이 뜨면, 로딩화면을 보여주고, 데이터를 받은 후에 데이터를 보여준다.

```dart
void waitForWebToons() async {
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {});
}
```

## 6.6 FutureBuilder

State를 안쓰는게 더 좋아! 또 State를 전혀 안 쓰는 좋은 Widget 과 Framework가 많다!

`FutureBuilder` -> Builder는 UI를 그려주는 함수
<br>
자신이 기다릴 Future와 Builder 함수를 전달받는다.

SnapShot을 살펴보면 Future가 데이터를 받았는지, 오류가 났는지 알 수 있다.
<br>
snapshot.hasData / snapshot.hasError
<br>
데이터를 가지고 있는지 확인 / 에러를 가지고 있는지 확인


```dart
body: FutureBuilder(
future: webtoons,
    builder: (context, snapshot) {
        if (snapshot.hasData) {
            return const Text("There is datta!");
        },
        return const Text('Loading...');
    }
),
```

데이터가 있으면 *There is data!* 를 출력하고 없다면, *Loading...* 을 출력한다

## 6.7 ListView

많은 양의 데이터를 연속적으로 보여주고 싶을 때 `ListView`를 사용한다
<br>
ListView는 children을 가질 수 있다.

ListView는 비효울적이다! -> 최적화가 되지 않았다!<br>한 번에 모든 아이템을 로드하기 때문!!

해결법
<br>
`ListView.builder()` -> 더 최적화된 ListView

```dart
ListView.separated(
      scrollDirection: Axis.horizontal, //스크롤 방향
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemCount: snapshot.data!.length, //아이템의 개수
      itemBuilder: (context, index) { //index -> 만들어야 하는 아이템의 위치
        var webtoon = snapshot.data![index];
        return Webtoon(
            title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
      }, //아이템을 만드는 역할
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ), //아이템들 사이 구분
    );
```

## 6.8 Webtoon Card

Column에게 ListView의 높이를 알려줘야 한다.

`Image.network(url)` -> url 을 통한 이미지를 보여주는 위젯