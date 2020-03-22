import 'package:flutter/material.dart';
import 'package:less_weight/add_weight.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name;
  String url;

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
                color: Colors.green[800],
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
      body: Column(
        children: <Widget>[
          banner(context),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                reward(Colors.orange[300], Icons.person_pin,
                    'Conquistou meta semanal'),
                reward(Colors.brown[300], Icons.restore_from_trash,
                    'Ficou uma semana sem comer lixo'),
                reward(Colors.blue, Icons.person_pin_circle, 'Perfil completo'),
                reward(Colors.cyan, Icons.calendar_today,
                    'Completou um mes no app'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget reward(Color color, IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Container(
          width: 120,
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: color,
                radius: 45,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget grid() {
  //   return GridView(gridDelegate: null)
  // }

  Widget banner(context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.center,
          height: 280,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.green, Colors.cyan[800]],
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
                    width: 190.0,
                    height: 190.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(url == null
                            ? 'https://static.thenounproject.com/png/17241-200.png'
                            : url),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: name == null
                      ? RaisedButton(
                          color: Colors.white,
                          child: Text('Criar perfil'),
                          onPressed: () {},
                        )
                      : Text(
                          name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              decoration: TextDecoration.none),
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
