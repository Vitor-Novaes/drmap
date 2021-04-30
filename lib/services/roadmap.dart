import 'dart:convert';
import 'dart:io';

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
      return [Roadmap(id: 1, title: 'Vazio', hex: 0xFFFFFFF)];
    }
  }

  Future<List<Roadmap>> getRoadMapOptions() async {
    try {
      final response = await http.get(Uri.https(uri, 'development/roadmap'));

      if (response.statusCode == 200) {
        var test = json.decode(response.body);
        var map = Map<String, dynamic>.from(test);

        List<Roadmap> roadmaps =
            (map['body'] as List).map((i) => Roadmap.fromOptions(i)).toList();
        print(roadmaps.map((road) => road.label));

        return roadmaps;
      } else {
        print('Cant get roadmaps error');
        throw 'Cant get roadmaps';
      }
    } catch (e) {}
  }

  Future<void> createRoadmap(payload) async {
    final roadmap = Roadmap(
      title: payload['name'],
      hex: payload['hex'],
      thumb: 'url',
    );
    final String req = roadMapToJson(roadmap);
    print(req);
    try {
      final response = await http.post(
        Uri.https(uri, 'development/roadmap'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: req,
      );
      print(response);
      var test = json.decode(response.body);
      print(test);
    } catch (e) {
      print('Error on create $e');
      throw e;
    }
  }
}
