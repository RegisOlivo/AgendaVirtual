import 'package:agenda_virtual/data/produto_data.dart';
import 'package:agenda_virtual/models/user_model.dart';
import 'package:agenda_virtual/screens/empresaaberto_screen.dart';
import 'package:agenda_virtual/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmpresaAbertoTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  EmpresaAbertoTile(this.snapshot);

  @override
  Widget build(BuildContext context) {

      return ListTile(
        leading: const Icon(Icons.domain),
        title: Text(snapshot.data["descricao"]),
        trailing: Text(snapshot.data["data"]),
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>EmpresaAbertoScreen(snapshot))
          );
        },
      );


  }
}