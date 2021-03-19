import 'package:drm/models/roadmap.dart';
import 'package:flutter/material.dart';

class ListPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final roadmap = ModalRoute.of(context).settings.arguments as Roadmap;

    return Scaffold(
      appBar: AppBar(
        title: Text('${roadmap.title} Path'),
        backgroundColor: Color(0xFF000000),
      ),
      body: Center(child: Text('YOUR PATH IS HERE ${roadmap.id}')),
    );
  }
}
