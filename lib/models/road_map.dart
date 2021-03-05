import 'dart:convert';

import 'package:flutter/widgets.dart';

RoadMap roadMapFromJson(String str) => RoadMap.fromJson(json.decode(str));

String roadMapToJson(RoadMap data) => json.encode(data.toJson());

class RoadMap {
  RoadMap({
    @required this.id,
    @required this.title,
    @required this.hex,
    this.pointsCounter,
    this.taskCounter,
    this.thumb,
  });

  int id;
  int pointsCounter;
  int taskCounter;
  String title;
  String hex;
  String thumb;

  factory RoadMap.fromJson(Map<String, dynamic> json) => RoadMap(
        title: json["title"] as String,
        id: json["id"] as int,
        hex: json["hex"] as String,
        // pointsCounter: json["points_counter"],
        // taskCounter: json["task_counter"],
        // thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "points_counter": pointsCounter,
        "task_counter": taskCounter,
        "hex": hex,
        "thumb": thumb,
      };
}
