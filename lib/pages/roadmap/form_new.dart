import 'package:drm/services/roadmap.dart';
import 'package:flutter/material.dart';
import 'package:drm/models/roadmap.dart';
import 'dart:ui';

class FormRoadmapSelection extends StatefulWidget {
  @override
  _FormRoadmapSelection createState() => _FormRoadmapSelection();
}

class _FormRoadmapSelection extends State<FormRoadmapSelection> {
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, dynamic>();
  String _currentSelectedValue = '';

  final RoadmapService service = RoadmapService();

  void _submit(context) {
    _form.currentState.save();
    service.createRoadmap(_formData);
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
        child: FutureBuilder(
          future: service.getRoadMapOptions(),
          builder: (context, AsyncSnapshot<List<Roadmap>> snapshot) {
            if (snapshot.hasData) {
              List<Roadmap> options = snapshot.data;
              print(options);

              return Container(
                child: Form(
                    key: _form,
                    child: ListView(
                      children: <Widget>[
                        FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 16.0),
                                  hintText: 'Please select a roadmap',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              isEmpty: _currentSelectedValue == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _currentSelectedValue,
                                  isDense: true,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _currentSelectedValue = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: options.map((option) {
                                    return DropdownMenuItem<String>(
                                      value: option.value,
                                      child: Text(option.label),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Description'),
                          onSaved: (value) => _formData['decoration'] = value,
                        ),
                      ],
                    )),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
