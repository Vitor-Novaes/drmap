import 'dart:convert';

import 'package:drm/models/road_map.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String uri = "8bp38ux9fi.execute-api.us-east-1.amazonaws.com";

  Future<List<RoadMap>> getAllRoadMaps() async {
    try {
      final response = await http.get(Uri.https(uri, 'development/roadmap'));
      print(response);
      print('print json decode');
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        var test = json.decode(response.body);
        var map = Map<String, dynamic>.from(test);
        print(map['body']);

        print(map['body'].map((dynamic item) => item));
        // List<RoadMap> roadmaps =
        var list = map['body'].map((dynamic item) => RoadMap.fromJson(item));
        print("lista: $list");
        print(list.cast<List<RoadMap>>());

        return list.cast<List<RoadMap>>();
      } else {
        print('Cant get roadmaps error');
        throw 'Cant get roadmaps';
      }
    } catch (e) {
      print("finished with exceptions $e");
      return [RoadMap(id: 1, title: 'Vazio', hex: '#fff')];
    } finally {
      print("finished with exceptions");
    }
  }
}
