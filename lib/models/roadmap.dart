import 'dart:convert';

import 'package:flutter/widgets.dart';

Roadmap roadMapFromJson(String str) => Roadmap.fromJson(json.decode(str));

String roadMapToJson(Roadmap data) => json.encode(data.toJson());

class Roadmap {
  Roadmap({
    this.id,
    @required this.title,
    @required this.hex,
    @required this.thumb,
    this.pointsCounter,
    this.taskCounter,
  });

  int id;
  int hex;
  String title;
  String thumb;

  int pointsCounter;
  int taskCounter;

  factory Roadmap.fromJson(Map<String, dynamic> json) => Roadmap(
        title: json["title"] as String,
        id: json["id"] as int,
        hex: int.parse(json["hex"]),
        thumb: json["thumb"] as String,
        // pointsCounter: json["points_counter"],
        // taskCounter: json["task_counter"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "hex": hex,
        "thumb": thumb,
        // "points_counter": pointsCounter,
        // "task_counter": taskCounter,
      };
}
