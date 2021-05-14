import 'package:drm/models/roadmap.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class ListPoints extends StatefulWidget {
  @override
  _ListPointsState createState() => _ListPointsState();
}

class _ListPointsState extends State<ListPoints> {
  List _points = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/points.json');
    final data = await json.decode(response);
    setState(() {
      _points = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    final roadmap = ModalRoute.of(context).settings.arguments as Roadmap;
    readJson();

    return Scaffold(
      appBar: AppBar(
        title: Text('${roadmap.title}'),
        backgroundColor: Color(0xFF000000),
        actions: <Widget>[
          IconButton(
            tooltip: 'Load mock',
            icon: const Icon(Icons.local_activity),
            onPressed: () {
              readJson();
            },
          )
        ],
      ),
      body: Column(
        children: [
          _points.length > 0
              ? Expanded(
                  child: ListView.builder(
                    itemCount: _points.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          leading: Text(_points[index]["id"]),
                          title: Text(_points[index]["name"]),
                          subtitle: Text(_points[index]["description"]),
                        ),
                      );
                    },
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
