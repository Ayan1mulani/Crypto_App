import 'package:cli/crypto/marketdata.dart';
import 'package:cli/signUpPage/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signup_page extends StatefulWidget {
  const signup_page({super.key});

  @override
  State<signup_page> createState() => _signup_pageState();
}

class _signup_pageState extends State<signup_page> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUp(String email, String password) async {
    if (email == "" && password == "") {
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
        title: Text("sign up page"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          uiHelper.CustomTextField(emailController, "email", Icons.mail, false),
          uiHelper.CustomTextField(
              passwordController, "password", Icons.password, true),
          SizedBox(height: 10.0),
          uiHelper.customButton(() {
            SignUp(emailController.text.toString(),
                passwordController.text.toString());
          }, "Regester")
        ],
      ),
    );
  }
}
