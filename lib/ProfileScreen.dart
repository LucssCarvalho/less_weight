import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:less_weight/add_weight.dart';
import 'package:less_weight/edit_profile.dart';
import 'package:path_provider/path_provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'sem nome cadastrado';
  double meta = 0.0;
  String url;

  List _profileList = [];

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        _profileList = json.decode(data);
      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seu perfil'),
        actions: <Widget>[
          MaterialButton(
            child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.red[800],
                borderRadius: BorderRadius.circular(40),
              ),
              alignment: Alignment.center,
              child: Text(
                'Add novo peso',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0))),
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    child: FormAddWeight(),
                  );
                },
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 250,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.red[300], Colors.red[900]],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 70.0,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    meta.toString(),
                                    style: TextStyle(fontSize: 45),
                                  ),
                                  Text(
                                    'Sem meta cadastrada',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          child: RaisedButton(
                            color: Colors.white,
                            child: Text(
                              'Editar Perfil',
                              style: TextStyle(),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0))),
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    margin: const EdgeInsets.only(top: 40.0),
                                    child: EditProfile(),
                                  );
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: GridView.count(
            //     crossAxisCount: 2,
            //     children: <Widget>[
            //       reward(Colors.orange[300], Icons.person_pin,
            //           'Conquistou meta semanal'),
            //       reward(Colors.brown[300], Icons.restore_from_trash,
            //           'Ficou uma semana sem comer lixo'),
            //       reward(
            //           Colors.blue, Icons.person_pin_circle, 'Perfil completo'),
            //       reward(Colors.cyan, Icons.calendar_today,
            //           'Completou um mes no app'),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  // Widget reward(Color color, IconData icon, String title) {
  //   return Padding(
  //     padding: const EdgeInsets.all(5.0),
  //     child: Card(
  //       child: Container(
  //         width: 120,
  //         child: Column(
  //           children: <Widget>[
  //             CircleAvatar(
  //               backgroundColor: color,
  //               radius: 45,
  //               child: Icon(
  //                 icon,
  //                 color: Colors.white,
  //                 size: 35,
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text(
  //                 title,
  //                 textAlign: TextAlign.center,
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
