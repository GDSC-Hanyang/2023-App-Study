# 6주차

# 웹툰 앱 완성

### GestureDetector 위젯

→ 다양한 gesture를 감지해준다 

→ 탭하면, 해당 웹툰의 상세페이지로 넘어가야 하므로, onTap을 사용한다!

탭을 했을 때, 화면에 다른 스크린이 보이는것처럼 해줘야함

→ Navigator를 이용한다!

route는 stateless위젯을 애니메이션 효과로 감싸서, 마치 스크린처럼 보이도록 해준다

```dart
onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(title: title, thumb: thumb, id: id),
          ),
        );
      },
```

navigator로 새 route를 push하고 있음

→ 이 때 oute는 materialpageroute인것

→ 이 route가 stateless위젯인 detailscreen을 렌더한다

→ 홈스크린을 떠날것이므로, 위에 있는 네비게이션바 등을 그대로 유지하려면 그부분을 scaffold로 똑같이 그려줘야함 

```dart
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;
  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                        color: Colors.black.withOpacity(0.5),
                      )
                    ]),
                child: Image.network(thumb),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

### Hero widget

사진을 클릭했을 때, 그냥 새로운 스크린이 뜨는게 아니라, 포스터가 화면 가운데로 움직여 확장되는것처럼 보이도록 도와줄 수 있는 위젯

이렇게 스크린전환할 때 애니메이션설정에 사용된다

→ 각각의 위젯을 hero로 만들고 (2개) 두개에 같은 tag를 적용하면 된다

→ container만 Hero 위젯으로 감싸주면 된다!


```dart
// webtoon_widget.dart
...
child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              ......
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
...

// detail_screen.dart
...
Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: id,
                child: Container(
                  ...
                ),
              ),
            ],
          ),
....
```

### future

→ detail과 episode를 가져오기 위해서는 파라미터로 id를 받아야 한다.

→ 기존에 했던 방법을 그대로 사용할 수없음!

→ stateful위젯으로 변경해서 사용

```dart
class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatesEpisodesById(widget.id);
  }
```

이렇게 해주면 된다!

### Url Launchar

버튼을 클릭하면 브라우저로 이동하도록 해준다

설치 후, 어떤 링크를 열건지 설정해줄 필요가 있음

- 안드로이드
    설명대로 붙여넣기를 하는데, sms나 tel링크가 아닌 https를 열것이므로 https라고 수정
  <img width="737" alt="%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2023-11-08_21 06 32" src="https://github.com/GDSC-Hanyang/2023-App-Study/assets/88480816/f4017970-bfdb-47e9-8c74-334ff15ac78f">

    
- ios
    역시 sms나 tel이 아닌 https로 수정
  
    <img width="520" alt="%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2023-11-08_20 52 15" src="https://github.com/GDSC-Hanyang/2023-App-Study/assets/88480816/4d4194ff-062e-4dad-b8f3-15c629a34cbd">


⇒ stop후 다시 디버깅 해줄것

```dart
onButtonTap() async {
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
  }
```

이렇게 url만 모양맞춰서 넣어주면 알아서 넘어간다!

### shared_preferences

핸드폰 저장소에 데이터를 담을 수 있음

sharedpreferences.getinstance()로 저장할곳 만들기

→ 자료형별로 set, get으로 write, read해준다!

```dart
Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedToons', []);
    }
  }
```

막 웹툰의 디테일로 들어갔을 때 실행되는 부분

→ LikedToons라는 string 리스트를 만들건데, 추가된게 없으면 당연히 빈 리스트일것!

Null일 때 빈 리스트로 set하도록 해줘야함!

→ null이 아니라는말은, 이미 좋아하는 웹툰을 리스트에 추가해줬다는말

즉 지금 들어간 웹툰이 내가 좋아하는 웹툰 리스트에 있는지 확인해줘야함

(들어있으면 하트를 채워줘야하므로)
