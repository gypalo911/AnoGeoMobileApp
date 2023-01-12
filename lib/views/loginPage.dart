import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginPage extends StatefulWidget {
  Function(UserProfile?) callback;
  LoginPage({required this.callback, final Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Auth0 auth0;
  UserProfile? _user;

  @override
  void initState() {
    super.initState();
    auth0 = Auth0(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);
  }

  Future<void> login() async {
    var credentials = await auth0
        .webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
        .login();

    setState(() {
      debugPrint(credentials.accessToken);
      _user = credentials.user;
      widget.callback(_user);
    });
  }

  Future<void> logout() async {
    await auth0
        .webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
        .logout();

    setState(() {
      _user = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff56EC80), Color(0xff377D4B)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Column(
          children: [
            Image(
              image: AssetImage("images/loginImage.png"),
              width: 301,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 10,
                left: 44,
                right: 44,
              ),
              child: Text(
                "Login securely to AnoGeo",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Rubik',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 44,
              ), //apply padding to all four sides
              child: Text(
                "Some text to convince user to login into the system",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontFamily: 'Rubik',
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Login with Auth0',
                  style: TextStyle(fontSize: 24, color: Color(0xff42A55D)),
                  textAlign: TextAlign.center,
                ),
                onPressed: login,
              ),
            ),
            Spacer(),
          ],
        )),
      ),
    );
  }
}
