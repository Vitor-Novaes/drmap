import 'package:drm/services/roadmap.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'dart:ui';

class FormRoadmap extends StatelessWidget {
  final RoadmapService service = RoadmapService();

  void _submit(
    context,
  ) {
    // service.submitRoadmap()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chooice your next level'),
        backgroundColor: Color(0xFF000000),
        actions: <Widget>[
          IconButton(
            tooltip: 'Save roadmap',
            icon: const Icon(Icons.save),
            onPressed: () {
              print('saving...');
              _submit(
                context,
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              textInputAction: TextInputAction.next,
              validator: (String value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Hexdecimal color'),
              validator: (String value) {
                if (value == null || value.isEmpty) {
                  return 'Color is required';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ],
        )),
      ),
    );
  }
}
