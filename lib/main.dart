import 'dart:core';
import 'package:flutter/material.dart';
import 'package:less_weight/add_weight.dart';
import 'package:less_weight/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DashboardWeight(),
    );
  }
}
