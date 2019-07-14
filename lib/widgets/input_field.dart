import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final IconData icon;
  final String hint;
  final bool obscure;

  InputField({this.icon, this.hint, this.obscure});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          icon: Icon(icon, color: Colors.black,),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey[600])
          ),
          contentPadding: EdgeInsets.only(
              left: 5,
              right: 30,
              bottom: 30,
              top: 30
          )
      ),
      style: TextStyle(color: Colors.black),
      obscureText: obscure,
    );
  }
}
