import 'package:flutter/material.dart';

import 'CatalogoScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Wellcome",
              style: Theme.of(context).textTheme.headline4.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField( decoration: InputDecoration(
                  hintText: "Mail"
              ),),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child:
              TextField( decoration: InputDecoration(
                  hintText: "Phone Number"
              ),),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(onPressed: (){
              final page = CatalogoScreen.init();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_)=> page),
              );
            }, child: Text("Continue"),),
            SizedBox(height: 50,),
            Text("Si ingresas tus datos, te enviaré mi CV.\n "),
            Text("Gracias ")
          ],
        ),
      ),
    );
  }
}