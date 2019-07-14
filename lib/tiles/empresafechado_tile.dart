import 'package:agenda_virtual/screens/empresafechado_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmpresaFechadoTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  EmpresaFechadoTile(this.snapshot);

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: const Icon(Icons.domain),
      title: Text(snapshot.data["descricao"]),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>EmpresaFechadoScreen(snapshot))
        );
      },
    );
  }
}
