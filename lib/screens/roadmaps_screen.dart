import 'package:flutter/material.dart';

import 'package:drm/components/roadmap_item.dart';

class RoadMapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 1,
        ),
        children: <Widget>[],
      ),
    );
  }
}
