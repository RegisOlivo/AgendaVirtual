import 'package:agenda_virtual/tiles/empresafechado_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmpresaFechadoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("empresa").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          var dividedTiles = ListTile.divideTiles(

              tiles: snapshot.data.documents.map((doc) {
                return EmpresaFechadoTile(doc);
              }).toList(),
              color: Colors.grey[800])
              .toList();

          return ListView(

            children: dividedTiles,

          );
        }
      },
    );
  }
}
