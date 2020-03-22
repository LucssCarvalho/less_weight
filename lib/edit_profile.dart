import 'dart:convert';
import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

enum Status { veryBad, bad, normal, happy, veryHappy }

class _EditProfileState extends State<EditProfile> {
  final _nameController = TextEditingController();
  final _goalController = TextEditingController();
  List _profileList = [];

  Status _character = Status.normal;

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        _profileList = json.decode(data);
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Editar perfil',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Expanded(
              child: Form(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Seu nome",
                          labelStyle: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _goalController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Sua meta",
                          labelStyle: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                        color: Colors.green,
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
    if (_nameController.text.isEmpty) return;
    setState(() {
      Map<String, dynamic> newTodo = Map();
      newTodo["weight"] = _nameController.text;
      _nameController.text = "";
      newTodo["goal"] = _goalController.text;
      newTodo["data"] = formatDate(
          DateTime.now(), [dd, '/', mm, '/', yyyy, ' | ', HH, ':', nn]);

      _saveData();
      Navigator.pop(context);
    });
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_profileList);
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
