import 'package:flutter/material.dart';
import 'package:shared_pref_login_task_jan/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
// navigate to home page if already logged

                prefs.setBool("isLogged", false);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("home"),
      ),
    );
  }
}
