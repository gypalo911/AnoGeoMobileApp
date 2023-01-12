import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sample/views/loginPage.dart';
import 'example_app.dart';

void main() async {
  await dotenv.load();

  // runApp(const ExampleApp());
  runApp(const GeoIncognitoApp());
}

class GeoIncognitoApp extends StatefulWidget {
  final Auth0? auth0;
  const GeoIncognitoApp({this.auth0, final Key? key}) : super(key: key);

  @override
  State<GeoIncognitoApp> createState() => _GeoIncognitoAppState();
}

class _GeoIncognitoAppState extends State<GeoIncognitoApp> {
  UserProfile? _user;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
