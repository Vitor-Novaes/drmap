import 'dart:convert';

import 'package:flutter/widgets.dart';

Roadmap roadMapFromJson(String str) => Roadmap.fromJson(json.decode(str));

String roadMapToJson(Roadmap data) => json.encode(data.toJson());

class Roadmap {
  Roadmap({
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
  int hex;
  String title;
  String thumb;

  factory Roadmap.fromJson(Map<String, dynamic> json) => Roadmap(
        title: json["title"] as String,
        id: json["id"] as int,
        hex: int.parse(json["hex"]),
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
