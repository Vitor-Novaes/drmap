import 'package:drm/models/roadmap.dart';
import 'package:drm/services/roadmap.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ListRoads extends StatelessWidget {
  final RoadmapService service = RoadmapService();

  void _newRoadMap(BuildContext context) {
    Navigator.of(context).pushNamed('/roadmaps/new');
  }

  void _goToPoints(BuildContext context, Roadmap roadmap) {
    Navigator.of(context).pushNamed(
      '/points',
      arguments: roadmap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Road Maps'),
          backgroundColor: Color(0xFF000000),
          actions: <Widget>[
            IconButton(
              tooltip: 'Create a new plan road map',
              icon: const Icon(Icons.add),
              onPressed: () {
                print('pressed new roadmap');
                _newRoadMap(context);
              },
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 40.0),
          child: FutureBuilder(
            future: service.getAllRoadMaps(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Roadmap>> snapshot) {
              if (snapshot.hasData) {
                List<Roadmap> roadmaps = snapshot.data;

                return Center(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: ListView.builder(
                        itemCount: roadmaps.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () => _goToPoints(context, roadmaps[index]),
                            splashColor: Color(roadmaps[index].hex),
                            child: Container(
                              height: 200,
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              color: Color(roadmaps[index].hex),
                              child: Center(child: Text(roadmaps[index].title)),
                            ),
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
