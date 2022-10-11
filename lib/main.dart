import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbl/MainScreens/DrawerScreens/initpage.dart';
import 'package:pbl/RegistrationPages/verification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Circular',
        primarySwatch: Colors.blue,
      ),
      home: MainRegistration(),
    );
  }
}
