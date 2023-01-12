import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sample/views/loginPage.dart';

import 'views/homePage.dart';

void main() async {
  await dotenv.load();

  // runApp(const ExampleApp());
  runApp(const GeoIncognitoApp());
}

class GeoIncognitoApp extends StatefulWidget {
  const GeoIncognitoApp({final Key? key}) : super(key: key);

  @override
  State<GeoIncognitoApp> createState() => _GeoIncognitoAppState();
}

class _GeoIncognitoAppState extends State<GeoIncognitoApp> {
  UserProfile? _user;

  callback(newUser) {
    setState(() {
      _user = newUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _user != null
          ? HomePage()
          : Scaffold(
              body: LoginPage(callback: callback),
            ),
    );
  }
}
