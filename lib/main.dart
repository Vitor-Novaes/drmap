// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:drm/pages/roadmap/list.dart';
import 'package:drm/pages/roadmap/form.dart';
import 'package:drm/pages/point/list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor: Color(0xFFFFFEE5)),
      routes: {
        '/': (context) => ListRoads(),
        '/roadmaps/new': (context) => FormRoadmap(),
        '/points': (context) => ListPoints(),
      },
    );
  }
}
