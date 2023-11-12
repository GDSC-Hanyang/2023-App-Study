import 'package:flutter/material.dart';
import 'package:toon_world/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 동작 감지 위젯
      onTap: () {
        // (){} 이건 그냥 1회용 method
        Navigator.push(
          // screen을 바꾸는 역할
          // route인데 statelessWidget을 애니메이션 효과로 감싸 스크린처럼 보이도록 함 사실은 statelessWidget을 바꾼 것 뿐
          // route를 push
          context,
          MaterialPageRoute(
            // statelessWidget을 route로 감싸 다른 스크린처럼 보이게 하는 class
            builder: (context) => DetailScreen(
              //DetailScreen을 렌더
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true, // 애니메이션이 아래에서 올라옴, 돌아가는 버튼 모양도 다름
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge, // 자식의 부모영역 침범 제어
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15, // 그림자 크기
                    offset: const Offset(10, 10), // 그림자 위치
                    color:
                        Colors.black.withOpacity(0.3), // 그림자 색, opacity는 불투명도
                  ),
                ],
              ),
              child: Image.network(
                thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                  // 따로 User-Agent 값을 추가하지 않으면 기본값으로 `Dart/<version> (dart:io)` 가 들어갑니다.
                  // (https://api.flutter.dev/flutter/dart-io/HttpClient/userAgent.html)
                  // https://gist.github.com/preinpost/941efd33dff90d9f8c7a208da40c18a9 참고
                },
              ),
            ),
          ), // Image.network는 url에 있는 이미지
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
