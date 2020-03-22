import 'dart:core';
import 'package:flutter/material.dart';
import 'package:less_weight/dashboard.dart';

import 'ProfileScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Tabbar(),
    );
  }
}

class Tabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.dashboard,
                      size: 25,
                    ),
                    Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
            Tab(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 25,
                    ),
                    Text(
                      'Perfil',
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
          ],
          indicatorWeight: 2,
          labelStyle: TextStyle(fontSize: 10),
          unselectedLabelColor: Colors.grey[800],
          labelColor: Colors.redAccent[700],
          indicatorColor: Colors.transparent,
        ),
        body: TabBarView(children: [DashboardWeight(), ProfileScreen()]),
      ),
    );
  }
}
