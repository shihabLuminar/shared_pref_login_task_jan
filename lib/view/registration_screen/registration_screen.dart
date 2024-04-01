import 'package:flutter/material.dart';
import 'package:shared_pref_login_task_jan/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var usernameController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Register now"),
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
// Obtain shared preferences.
                  print("hey");

                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  if (usernameController.text.isNotEmpty &&
                      passController.text.isNotEmpty) {
                    print("hey");

                    await prefs.setString("userName", usernameController.text);
                    await prefs.setString("pass", passController.text);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  } else {
                    print("hello");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("enter poroper values")));
                  }
                },
                child: Text("Register")),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  // navigate to login screen
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: Text("Already  have account , Login now"))
          ],
        ),
      ),
    );
  }
}
