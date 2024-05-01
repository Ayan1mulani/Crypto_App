import 'package:cli/crypto/marketdata.dart';
import 'package:cli/signUpPage/signuppage.dart';
import 'package:cli/signUpPage/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      uiHelper.customAlertBox(context, "Enter required");
    } else {
      try {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Marketdata()));
      } on FirebaseAuthException catch (ex) {
        return uiHelper.customAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFF181A20),
        appBar: AppBar(
          title: Text(
            "CRYPTO-X",
            style: TextStyle(color: Colors.white54),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
            ),
            uiHelper.CustomTextField(
                emailController, "email", Icons.mail, false),
            uiHelper.CustomTextField(
                passwordController, "password", Icons.lock, true),
            const SizedBox(
              height: 30,
            ),
            uiHelper.customButton(() {
              login(emailController.text.toString(),
                  passwordController.text.toString());
            }, "login"),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "New user? Create a new account",
                  style: TextStyle(color: Color(0xffEAECEF)),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signup_page()));
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Marketdata()));
                },
                child: Text(
                  "Explore the app ",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ))
          ],
        ));
  }
}
