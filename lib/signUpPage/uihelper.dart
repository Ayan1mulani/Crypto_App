import 'package:flutter/material.dart';

class uiHelper {
  static CustomTextField(TextEditingController controller, String text,
      IconData icon, bool toHide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Color(0xff848E9C)),
          suffixIcon: Icon(icon),
          iconColor: Colors.yellow,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow),
              borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }

  static customButton(
    VoidCallback voidCallback,
    String text,
  ) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xffFCD535)),
        onPressed: () {
          voidCallback();
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
    );
  }

  static customAlertBox(
    BuildContext context,
    String text,
  ) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("okay"))
            ],
          );
        });
  }
}

const style2 = TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold);
