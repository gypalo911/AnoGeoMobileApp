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
    return CupertinoApp(
      home: _user != null
          ? HomePage()
          : Scaffold(
              body: LoginPage(callback: callback),
            ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.blue),
      body: Center(
        child: Text("User present"),
      ),
    );
  }
}
