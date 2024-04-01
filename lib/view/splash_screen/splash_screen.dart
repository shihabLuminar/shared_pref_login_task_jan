import 'package:flutter/material.dart';
import 'package:shared_pref_login_task_jan/view/home_screen/home_screen.dart';
import 'package:shared_pref_login_task_jan/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
// navigate to home page if already logged

      final isLogged = prefs.getBool("isLogged");

      if (isLogged == true) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      } else {
//  else navigate to  login screen
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("splash"),
      ),
    );
  }
}
