import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '60,5',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Meta',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  radius: 70,
                ),
              ),
              Expanded(
                  child: ListView(
                children: <Widget>[],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
