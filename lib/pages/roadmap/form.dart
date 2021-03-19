import 'package:drm/models/roadmap.dart';
import 'package:drm/services/roadmap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'dart:ui';

class FormRoadmap extends StatefulWidget {
  @override
  _FormRoadmap createState() => _FormRoadmap();
}

class _FormRoadmap extends State<FormRoadmap> {
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, dynamic>();

  final RoadmapService service = RoadmapService();
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void _submit(context) {
    _form.currentState.save();
    service.createRoadmap(_formData);
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  showPicker(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("Pick it"),
      onPressed: () {
        setState(() => currentColor = pickerColor);
        Navigator.of(context).pop();
      },
    );

    AlertDialog picker = AlertDialog(
      title: const Text('Picker a color'),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: pickerColor,
          onColorChanged: changeColor,
          showLabel: true,
          pickerAreaHeightPercent: 0.5,
        ),
      ),
      actions: [okButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return picker;
      },
    );
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
            key: _form,
            child: ListView(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    showPicker(context);
                  },
                  child: Center(child: Text('Picker color')),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  textInputAction: TextInputAction.next,
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value,
                ),
                // TextFormField(
                //   decoration: InputDecoration(labelText: 'Hexdecimal color'),
                //   validator: (String value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Color is required';
                //     }
                //     return null;
                //   },
                // ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  onSaved: (value) => _formData['decoration'] = value,
                ),
              ],
            )),
      ),
    );
  }
}
