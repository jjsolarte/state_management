import 'package:flutter/material.dart';
import 'package:state_management/ui/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          accentColor: Colors.black,
          primaryColor: Colors.yellow,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.yellow,
          ),
          primaryIconTheme: IconThemeData(
              color: Colors.black
          )
      ),
      home: LoginScreen(),
    );
  }
}
