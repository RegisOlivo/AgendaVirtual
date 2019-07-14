import 'package:agenda_virtual/data/produto_data.dart';
import 'package:agenda_virtual/tiles/relatoriofechado_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmpresaFechadoScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  EmpresaFechadoScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[600],
          title: Text(snapshot.data["descricao"]),
          centerTitle: true,
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection("empresa")
                .document(snapshot.documentID)
                .collection("Relatorio")
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(4.0),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        //return RelatorioFechadoTile(
                          //  "list",
                            //ProdutoData.fromDocument(
                              //  snapshot.data.documents[index]));
                        ProdutoData data = ProdutoData.fromDocument(
                            snapshot.data.documents[index]);
                        data.empresaa = this.snapshot.documentID;
                        return RelatorioFechadoTile("list", data);
                      },

                );
            }
        ),
        /*floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),*/
      ),
    );
  }
}
