import 'dart:convert';

import 'package:drm/models/roadmap.dart';
import 'package:http/http.dart' as http;

class RoadmapService {
  final String uri = "8bp38ux9fi.execute-api.us-east-1.amazonaws.com";

  Future<List<Roadmap>> getAllRoadMaps() async {
    try {
      final response = await http.get(Uri.https(uri, 'development/roadmap'));

      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        var test = json.decode(response.body);
        var map = Map<String, dynamic>.from(test);

        List<Roadmap> roadmaps =
            (map['body'] as List).map((i) => Roadmap.fromJson(i)).toList();
        print(roadmaps);

        return roadmaps;
      } else {
        print('Cant get roadmaps error');
        throw 'Cant get roadmaps';
      }
    } catch (e) {
      print("finished with exceptions $e");
      return [Roadmap(id: 1, title: 'Vazio', hex: 0xFFFFF)];
    }
  }
}
