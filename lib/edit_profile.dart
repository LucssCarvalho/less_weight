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
                            color: Colors.red,
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
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                        color: Colors.red,
                        child: Text('Editar'),
                        textColor: Colors.white,
                        onPressed: () {
                          setState(() {});
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
