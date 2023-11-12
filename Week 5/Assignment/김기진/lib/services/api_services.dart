import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toon_world/model/webtoon_detail_model.dart';
import 'package:toon_world/model/webtoon_episode_model.dart';
import 'package:toon_world/model/webtoon_model.dart'; // namespace 지정

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    // await를 실행하기 위해 함수를 asynchronous function으로 사용, await를 사용했기 때문에 return type이 future이어야 함
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today'); // json 자료를 변환?
    final response = await http.get(url);
// url에 특정 데이터를 요청함 // await로 get method가 끝날 때 까지 코드 진행 x// http에 있는 get이라는 method 사용
    if (response.statusCode == 200) {
      // statusCode는 http response에 정해짐
      final List<dynamic> webtoons = //body에 있는 내용을 list로 나눔
          jsonDecode(response.body); // body에는 서버에서 보낸 데이터가 저장됨
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon)); // 빈번히 사용하는 부분
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatesetEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
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
}
