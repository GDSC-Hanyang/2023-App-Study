import 'package:flutter/material.dart';
import 'package:toon_world/model/webtoon_model.dart';
import 'package:toon_world/services/api_services.dart';
import 'package:toon_world/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2, // bar의 음영
        backgroundColor: Colors.white,
        foregroundColor: Colors.green, // bar에서 text, icon의 디폴트 색
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons, // FutureBuilder에서 따로 await할 필요 없음
        builder: (context, snapshot) {
          //context는 상위 위젯트리의 정보, snapshot은 future의 결과값으로 future의 상태에 접근할 수 있는 parameter
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return const Text('Loading....');
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      // 여러 항목을 나열할 때 쓰는 widget,
      //.seperated, .builder는 더 최적화됨 모든 item을 한 번에 build하지 않음
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        // futurebuilder의 builder와 비슷한 동작, item을 build할 때 호출
        //index로 접근, 화면에 나오는 것이 index
        //api에 있는 정보를 list로 저장
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ), // index 사이 사이 특정 위젯을 넣음
    );
  }
}
