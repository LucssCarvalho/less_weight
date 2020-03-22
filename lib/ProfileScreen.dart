import 'package:flutter/material.dart';
import 'package:less_weight/add_weight.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    );
  }
}
