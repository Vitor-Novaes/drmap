// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:drm/models/road_map.dart';
import 'package:drm/pages/road_maps.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RoadMaps(),
    );
  }
}
