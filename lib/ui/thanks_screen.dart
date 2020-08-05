import 'package:flutter/material.dart';
import 'CatalogoScreen.dart';

class ThanksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.flare,
                  size: 100,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Gracias por su compra",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => CatalogoScreen.init())),// CatalogoScreen())),
                  child: Text("Seguir Comprando"),
                )
              ],
            )));
  }
}