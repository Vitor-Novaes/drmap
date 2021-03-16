import 'package:flutter/material.dart';
import 'package:drm/models/roadmap.dart';

class ListPoints extends StatelessWidget {
  final Roadmap roadmap;

  const ListPoints(this.roadmap);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${roadmap.title} Path'),
        backgroundColor: Color(0xFF000000),
      ),
      body: Center(child: Text('YOUR PATH IS HERE')),
    );
  }
}
