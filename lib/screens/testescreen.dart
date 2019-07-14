/*
import 'package:agenda_virtual/data/produto_data.dart';
import 'package:agenda_virtual/models/addproduto_model.dart';
import 'package:agenda_virtual/screens/addproduto_screen.dart';
import 'package:agenda_virtual/tiles/relatorioaberto_tile.dart';
import 'package:agenda_virtual/widgets/preco_total.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class EmpresaAbertoScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  List<ProdutoData> products = [];

  bool isLoading = false;

  EmpresaAbertoScreen(this.snapshot);

  bool _dialVisible = true;

  void finalizarPedido() {
    if (products.length == 0) return;

    isLoading = true;
    //notifyListeners();
  }

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
                .collection("PedidoAberto")
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(4.0),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    //return RelatorioAbertoTile(
                    //   "list",
                    //   ProdutoData.fromDocument(snapshot.data.documents[index]));
                    ProdutoData data = ProdutoData.fromDocument(
                        snapshot.data.documents[index]);
                    data.empresaa = this.snapshot.documentID;
                    return RelatorioAbertoTile("list", data);

                  },


                );


              }

            }
        ),
        floatingActionButton: SpeedDial(
          // both default to 16
          marginRight: 18,
          marginBottom: 20,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          visible: _dialVisible,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(Icons.beenhere),
                backgroundColor: Colors.red,
                label: 'Fechar Conta',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: (
                    ) => print('Fechar Conta')),
            SpeedDialChild(
              child: Icon(Icons.add_shopping_cart),
              backgroundColor: Colors.green,
              label: 'Adicionar Produto',
              labelStyle: TextStyle(fontSize: 18.0),
              //onTap: () => print('Adicionar Produto'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddProdutoScreen(this.snapshot)));
              },
            ),

          ],
        ),

        */
/*floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.beenhere),
          backgroundColor: Colors.blue,
        ),*//*


      ),

    );

  }
}
*/
