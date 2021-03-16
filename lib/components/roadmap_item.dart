// import 'package:drm/models/roadmap.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui';

// class RoadmapItem extends StatelessWidget {
//   final Roadmap roadmap;

//   const RoadmapItem(this.roadmap);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//           AppBar(title: Text('Road Maps'), backgroundColor: Color(0xFF000000)),
//       body: GridView(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           mainAxisExtent: 200,
//           childAspectRatio: 3 / 2,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 20,
//           crossAxisCount: 1,
//         ),
//         children: <Widget>[
//           FutureBuilder(
//               future: service.getAllRoadMaps(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<List<Roadmap>> snapshot) {
//                 if (snapshot.hasData) {
//                   List<Roadmap> roadmaps = snapshot.data;

//                   roadmaps.map((road) {
//                     return RoadmapItem(road);
//                   }).toList();
//                 }

//                 return Center(child: CircularProgressIndicator());
//               }),
//         ],
//       ),
//     );
//   }
// }
