import 'package:flutter/material.dart';
import 'package:shared_pref_login_task_jan/view/home_screen/home_screen.dart';
import 'package:shared_pref_login_task_jan/view/registration_screen/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usernameController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Loing now"),
            SizedBox(height: 20),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  if (usernameController.text.isNotEmpty &&
                      passController.text.isNotEmpty) {
                    final savedUserNmae = prefs.getString("userName");
                    final savedPass = prefs.getString("pass");

                    if (savedPass == passController.text &&
                        savedUserNmae == usernameController.text) {
                      prefs.setBool("isLogged", true);
                      // navigate to register screen
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Login Failed")));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("enter poroper values")));
                  }
                },
                child: Text("Log In")),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  // navigate to register screen
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationScreen(),
                      ));
                },
                child: Text("Dont have account , register now"))
          ],
        ),
      ),
    );
  }
}
