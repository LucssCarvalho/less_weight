import 'package:flutter/material.dart';

class AddWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text(
              'Dashboard',
              style: TextStyle(color: Colors.black),
            ),
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Add peso",
              style: TextStyle(color: Colors.black),
            ),
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}