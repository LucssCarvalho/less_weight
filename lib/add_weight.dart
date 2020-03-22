import 'dart:convert';
import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FormAddWeight extends StatefulWidget {
  @override
  _FormAddWeightState createState() => _FormAddWeightState();
}

enum Status { veryBad, bad, normal, happy, veryHappy }

class _FormAddWeightState extends State<FormAddWeight> {
  final _weightController = TextEditingController();
  List _weightList = [];

  Status _character = Status.normal;

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        _weightList = json.decode(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white),
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 300,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Form(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Seu peso atual",
                          labelStyle: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Seu humor com seu peso atual',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '😭',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    Radio(
                                      value: Status.veryBad,
                                      groupValue: _character,
                                      onChanged: (Status value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '😟',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    Radio(
                                      value: Status.bad,
                                      groupValue: _character,
                                      onChanged: (Status value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '😐',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    Radio(
                                      value: Status.normal,
                                      groupValue: _character,
                                      onChanged: (Status value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '🙂',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    Radio(
                                      value: Status.happy,
                                      groupValue: _character,
                                      onChanged: (Status value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '😃',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    Radio(
                                      value: Status.veryHappy,
                                      groupValue: _character,
                                      onChanged: (Status value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                        color: Colors.red,
                        child: Text('ADD'),
                        textColor: Colors.white,
                        onPressed: _addTodo),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addTodo() {
    if (_weightController.text.isEmpty) return;
    setState(() {
      Map<String, dynamic> newTodo = Map();
      newTodo["weight"] = _weightController.text;
      _weightController.text = "";
      newTodo["status"] = _character.toString();
      newTodo["data"] = formatDate(
          DateTime.now(), [dd, '/', mm, '/', yyyy, ' | ', HH, ':', nn]);

      _weightList.add(newTodo);
      _saveData();
      Navigator.pop(context);
    });
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_weightList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
