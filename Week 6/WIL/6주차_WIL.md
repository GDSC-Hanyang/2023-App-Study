# Chapter 6

## 6.9 - Detail Screen

`GestureDetector`
<br>
`onTap` -> 버튼을 탭했을 때 발생하는 이벤트
<br>
`onTapDown` -> 손가락을 붙였을 때 발생하는 이벤트
<br>
`onTapUp` -> 손가락을 뗐을 때 발생하는 이벤트

Screen 은 단순한 위젯이다<br>
그러면 Screen을 어떻게 바꿀까?

`Navigator` -> (`route`,`context`)<br>
`route` 는 StatelessWidget을 애니메이션 효과로 감싸서 스크린처럼 보이게 하는 것

```dart
Navigator.push(context, MaterialPageRoute(
    builder: (context) => DetailScreen(
        title: title,
        thumb: thumb,
        id: id)
        )
    );
```
## 6.10 - Hero
`Hero` Widget은 화면을 전환할 때 애니메이션을 제공해준다.

`Hero` Widget의 사용방법<br>
-> `Hero` Widget을 각각의 화면에 지정하고, 각각의 위젯에 같은 태그를 주면 된다.

```dart
Hero(
    tag: id,
    child: Container(
        width: 200,
        clipBehavior: Clip.hardEdge,
        child: Image.network(
        thumb,
        headers: const {
            "User-Agent":
                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
        },
        ),
    ),
    ),
```

## 6.12 - ApiService

```dart
static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
    String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];

    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);

    if (response.statusCode == 200) {
        final episodes = jsonDecode(response.body);
        for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
        }
        return episodesInstances;
    }
    throw Error();
}
```
<!--
## 6.13 - Futures
`_DetailScreenState` 의 `widget` 은 `DetailScreen`과 다른 class 기 때문에 찾지 못한다!!
<br>
State의 Build Method 가 StatefulWidget의 data를 받아오는 방법
<br> **`data명` -> `widget.data명`**


## 6.14 - Detail Info

`FutureBuilder` 를 사용하여 Future 값을 가지고 info를 구현하자

`padding` ->  border 안쪽과 아이템 사이의 여백 부분

## 6.15 - Episodes
 
-->
## 6.16 - Url Launcher

url_launcher -> Uri를 파싱하여 해당하는 링크로 보내준다.
<br>
sms, http 등 다양한 것을 실행할 수 있다.

```dart
onButtonTap() async {
    final url = Uri.parse("");
    await launchUrl(url);
}
```
## 6.17 - Favorites

shared_preferences -> 앱 내에서 간단한 키-값 쌍의 데이터를 지속적으로 저장하고 검색하기 위한 패키지
<br>

 SharedPreferences.getInstance() 메서드를 사용하여 SharedPreferences 인스턴스를 얻고, 그 후에 getString()과 같은 메서드를 사용하여 값을 읽을 수 있는다.

`prefs.setStringList('likedToons', []);` <br>
-> 'likedToons' 라는 key에 StringList를 저장한다
<br>

`likedToons = prefs.getStringList('likedToons');`
<br>
-> 'likedToons' 라는 key에 저장된 값을 가져온다

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