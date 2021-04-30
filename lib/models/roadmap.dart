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
  });

  Roadmap.options({
    @required this.label,
    @required this.value,
  });

  int id;
  int hex;
  String title;
  String thumb;
  int pointsCounter;
  int taskCounter;

  String label;
  String value;

  factory Roadmap.fromJson(Map<String, dynamic> json) => Roadmap(
        title: json["title"] as String,
        id: json["id"] as int,
        hex: int.parse(json["hex"]),
        thumb: json["thumb"] as String,
      );

  factory Roadmap.fromOptions(Map<String, dynamic> json) => Roadmap.options(
      label: json["title"] as String, value: json["id"] as String);

  Map<String, dynamic> toJson() => {
        "body": {
          "title": title,
          "hex": hex as String,
          "thumb": thumb,
        }
      };
}
