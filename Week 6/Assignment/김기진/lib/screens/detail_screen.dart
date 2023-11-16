import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toon_world/model/webtoon_detail_model.dart';
import 'package:toon_world/model/webtoon_episode_model.dart';
import 'package:toon_world/services/api_services.dart';
import 'package:toon_world/widgets/episode_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
  late Future<WebtoonDetailModel> webtoon; // constructor에서는 widget을 참고할 수 없음
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    // 기기 저장소의 엑세스를 얻음
    prefs = await SharedPreferences.getInstance();
    final likedToons =
        prefs.getStringList('likedToons'); // 저장소에서 String List인 likedToons를 받아옴
    // 저장소가 있으면 웹툰 ID가 있는지 확인
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        // 여기서 setState를 써야 true임이 전달되는게 화면에 출력됨
        setState(() {
          isLiked = true;
        });
      }
    } else {
      // 저장소에 없으면 저장소에 빈 likedToons 이름의 StringList 추가
      await prefs.setStringList('likedToons', []);
    }
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatesetEpisodesById(widget.id);
    initPrefs();
  }

  onHeartTap() async {
    final likedToons =
        prefs.getStringList('likedToons'); // 저장소에서 String List인 likedToons를 받아옴
    if (likedToons != null) {
      // 리스트에 id가 있는 경우
      if (isLiked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      // likedToons를 저장소에 저장
      await prefs.setStringList('likedToons', likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2, // bar의 음영
        backgroundColor: Colors.white,
        foregroundColor: Colors.green, // bar에서 text, icon의 디폴트 색
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_outline,
            ),
          ),
        ],
        title: Text(
          widget.title, // widget은 위에 있는 DetailScreen(부모)을 지칭
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // overflow 방지 및
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge, // 자식의 부모영역 침범 제어
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15, // 그림자 크기
                            offset: const Offset(10, 10), // 그림자 위치
                            color: Colors.black
                                .withOpacity(0.3), // 그림자 색, opacity는 불투명도
                          ),
                        ],
                      ),
                      child: Image.network(
                        widget.thumb,
                        headers: const {
                          "User-Agent":
                              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text('...');
                },
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      // episodes의 길이가 10인걸 알고 있으므로 listview 대신 column 사용
                      children: [
                        //collection for
                        for (var episode in snapshot.data!)
                          // widget.id 는 DetailScreen의 local 변수 id를 의미
                          Episode(
                            episode: episode,
                            webtoonId: widget.id,
                          ),
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
