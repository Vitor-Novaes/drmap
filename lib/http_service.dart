import 'dart:convert';

import 'package:drm/models/road_map.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String uri =
      "https://8bp38ux9fi.execute-api.us-east-1.amazonaws.com/development";

  Future<List<RoadMap>> getAllRoadMaps() async {
    final response = await http.get(Uri.https(uri, '/roadmap'));
    print(response);
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<RoadMap> roadmaps =
          body.map((dynamic item) => RoadMap.fromJson(item)).toList();

      return roadmaps;
    } else {
      throw 'Cant get roadmaps';
    }
  }
}
