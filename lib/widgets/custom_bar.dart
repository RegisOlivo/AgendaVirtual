import 'package:agenda_virtual/models/user_model.dart';
import 'package:agenda_virtual/screens/addempresa_screen.dart';
import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white,),
      onPressed: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>AddEmpresaScreen())
        );
      },
      backgroundColor: Colors.blueGrey[600],
    );
  }
}
