import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:less_weight/helper/iconList.dart';

class DashboardWeight extends StatefulWidget {
  DashboardWeight({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardWeightState createState() => _DashboardWeightState();
}

class _DashboardWeightState extends State<DashboardWeight> {
  List _weightList = [];

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        _weightList = json.decode(data);
      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de peso'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    itemCount: _weightList.length,
                    itemBuilder: buildItem),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(
            _weightList[index]["weight"],
            style: TextStyle(fontSize: 22),
          ),
          subtitle: Text(_weightList[index]["data"].toString()),
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Text(
              emojiList[_weightList[index]["status"]],
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        setState(
          () {
            _weightList.removeAt(index);

            _saveData();

            Scaffold.of(context).removeCurrentSnackBar();
          },
        );
      },
    );
  }
}
