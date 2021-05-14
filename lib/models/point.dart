import 'dart:convert';
import 'package:flutter/widgets.dart';

Point pointFromJson(String str) => Point.fromJson(json.decode(str));

String pointToJson(Point data) => json.encode(data.toJson());

class Point {
  int id;
  String title;
  DateTime completedDate;
  DateTime createdAt;
  bool markAsDone;
  int roadmapId;
  // TEMP MOCK
  int percentage;

  Point(
      {this.id,
      @required this.title,
      @required this.completedDate,
      this.markAsDone,
      this.roadmapId,
      this.createdAt,
      this.percentage});

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        title: json['title'] as String,
        id: json['id'] as int,
        completedDate: json['completedDate'] as DateTime,
        markAsDone: json['markAsDone'] as bool,
        roadmapId: json['roadmapId'] as int,
        createdAt: json['createdAt'] as DateTime,
        percentage: json['percentage'] as int,
      );

  Map<String, dynamic> toJson() => {
        "body": {
          "title": title,
          "id": id,
          "completedDate": completedDate,
          "markAsDone": markAsDone,
          "roadmapId": roadmapId,
          "createdAt": createdAt,
        }
      };
}
