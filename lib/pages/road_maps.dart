import 'package:drm/models/road_map.dart';
import 'package:drm/http_service.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:convert';

class RoadMaps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Maps(),
    );
  }
}

class Maps extends StatefulWidget {
  @override
  _ListRoadMap createState() => _ListRoadMap();
}

class _ListRoadMap extends State<Maps> {
  final HttpService service = HttpService();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Road Maps'),
        ),
        body: FutureBuilder(
          future: service.getAllRoadMaps(),
          builder:
              (BuildContext context, AsyncSnapshot<List<RoadMap>> snapshot) {
            if (snapshot.hasData) {
              List<RoadMap> roadmaps = snapshot.data;

              return ListView(
                children: roadmaps
                    .map((RoadMap roadmap) => ListTile(
                          title: Text(roadmap.title),
                        ))
                    .toList(),
              );

              // return ListView.builder(
              //     padding: EdgeInsets.all(16.0),
              //     itemBuilder: (BuildContext context, int interator) {
              //       return Container(
              //         height: 80,
              //         color: Color(0xFFFFFFFF),
              //         child: Center(
              //           child: Text(roadmaps[interator].title),
              //         ),
              //       );
              //     });
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
