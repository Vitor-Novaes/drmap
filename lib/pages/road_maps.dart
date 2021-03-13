import 'package:drm/models/road_map.dart';
import 'package:drm/services/http_service.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

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
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 40.0),
          child: FutureBuilder(
            future: service.getAllRoadMaps(),
            builder:
                (BuildContext context, AsyncSnapshot<List<RoadMap>> snapshot) {
              if (snapshot.hasData) {
                List<RoadMap> roadmaps = snapshot.data;

                return Center(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: ListView.builder(
                        itemCount: roadmaps.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 200,
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            color: Color(roadmaps[index].hex),
                            child: Center(child: Text(roadmaps[index].title)),
                          );
                        },
                      )),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
