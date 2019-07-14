import 'package:agenda_virtual/data/produto_data.dart';
import 'package:agenda_virtual/models/addproduto_model.dart';
import 'package:agenda_virtual/models/user_model.dart';
import 'package:agenda_virtual/screens/addproduto_screen.dart';
import 'package:agenda_virtual/tiles/relatorioaberto_tile.dart';
import 'package:agenda_virtual/widgets/preco_total.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:scoped_model/scoped_model.dart';

class EmpresaAbertoScreen extends StatefulWidget {
  final DocumentSnapshot snapshot;

  EmpresaAbertoScreen(this.snapshot);

  @override
  _EmpresaAbertoScreenState createState() => _EmpresaAbertoScreenState();
}

class _EmpresaAbertoScreenState extends State<EmpresaAbertoScreen> {

  UserModel user;
  List<ProdutoData> products = [];

  bool isLoading = false;


  bool _dialVisible = true;



  void finalizarPedido() {
    if (products.length == 0) return;

    isLoading = true;
    //notifyListeners();
  }

  double valorTotal = 0.0;


  @override
  Widget build(BuildContext context) {


    double teste(double valor){
      valorTotal += valor;
      print("${valorTotal}");
      return valorTotal;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text(widget.snapshot.data["descricao"]),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance
              .collection("empresa")
              .document(widget.snapshot.documentID)
              .collection("PedidoAberto")
              .getDocuments(),
          //future: Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("cart").getDocuments(),
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
                    ProdutoData data = ProdutoData.fromDocument(
                        snapshot.data.documents[index]);
                    data.empresaa = widget.snapshot.documentID;
                     // valorTotal += data.valor;
                    //print(data.valor);
                    //teste(data.valor);
                    //valorTotal += data.valor;
                    //valorTotal = valorTotal + data.valor;
                    //valorTotal = Valor1;
                    //valorTotal += valorTotal + Valor1;
                    return RelatorioAbertoTile("list", data, this.widget.snapshot);
                  });
            }
          }),
      /*persistentFooterButtons: <Widget>[
        Text("Valor Total R\$: ${valorTotal}"),
      ],*/

      /*floatingActionButton: SpeedDial(
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
              onTap: () {
                ProdutoData produtoData = ProdutoData();
                produtoData.id;
                produtoData.dataP;
                produtoData.item;
                produtoData.valor;
                AddProdutoModel.of(context).deleteDataProduto(produtoData);
              }),
          SpeedDialChild(
            child: Icon(Icons.add_shopping_cart),
            backgroundColor: Colors.green,
            label: 'Adicionar Produto',
            labelStyle: TextStyle(fontSize: 18.0),
            //onTap: () => print('Adicionar Produto'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddProdutoScreen(widget.snapshot)));
            },
          ),
        ],
      ),*/

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddProdutoScreen(widget.snapshot)));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blueGrey[600],
        ),
    );
  }
}

//
//class EmpresaAbertoScreen extends StatelessWidget {
//  final DocumentSnapshot snapshot;
//
//  List<ProdutoData> products = [];
//
//  bool isLoading = false;
//
//  EmpresaAbertoScreen(this.snapshot);
//
//  bool _dialVisible = true;
//  double valorTotal = 1;
//
//  void finalizarPedido() {
//    if (products.length == 0) return;
//
//    isLoading = true;
//    //notifyListeners();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    AddProdutoModel crudObj2 = new AddProdutoModel(snapshot);
//
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.blueGrey[600],
//        title: Text(snapshot.data["descricao"]),
//        centerTitle: true,
//      ),
//      body: FutureBuilder<QuerySnapshot>(
//          future: Firestore.instance
//              .collection("empresa")
//              .document(snapshot.documentID)
//              .collection("PedidoAberto")
//              .getDocuments(),
//          builder: (context, snapshot) {
//            if (!snapshot.hasData)
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            else {
//              return ListView.builder(
//                  physics: NeverScrollableScrollPhysics(),
//                  padding: EdgeInsets.all(4.0),
//                  itemCount: snapshot.data.documents.length,
//                  itemBuilder: (context, index) {
//                    ProdutoData data = ProdutoData.fromDocument(
//                        snapshot.data.documents[index]);
//
//                    data.empresaa = this.snapshot.documentID;
//                    // atualizaValorTotal(data.valor);
//                    //valorTotal = valorTotal + data.valor;
//                    //print(valorTotal.toString());
//                    //data.valorTotal
//                    return RelatorioAbertoTile("list", data);
//                  });
//            }
//          }),
//      persistentFooterButtons: <Widget>[
//    ProdutoData data = ProdutoData.fromDocument(
//        snapshot.data.documents[index]);
//        Text("${snapshot.data.toString()}"),
//      ],
//      floatingActionButton: SpeedDial(
//        // both default to 16
//        marginRight: 18,
//        marginBottom: 20,
//        animatedIcon: AnimatedIcons.menu_close,
//        animatedIconTheme: IconThemeData(size: 22.0),
//        // this is ignored if animatedIcon is non null
//        // child: Icon(Icons.add),
//        visible: _dialVisible,
//        curve: Curves.bounceIn,
//        overlayColor: Colors.black,
//        overlayOpacity: 0.5,
//        onOpen: () => print('OPENING DIAL'),
//        onClose: () => print('DIAL CLOSED'),
//        tooltip: 'Speed Dial',
//        heroTag: 'speed-dial-hero-tag',
//        backgroundColor: Colors.white,
//        foregroundColor: Colors.black,
//        elevation: 8.0,
//        shape: CircleBorder(),
//        children: [
//          SpeedDialChild(
//              child: Icon(Icons.beenhere),
//              backgroundColor: Colors.red,
//              label: 'Fechar Conta',
//              labelStyle: TextStyle(fontSize: 18.0),
//              onTap: () {
//                //AddProdutoModel.of(context).deleteDataProduto(data);
//              }),
//          SpeedDialChild(
//            child: Icon(Icons.add_shopping_cart),
//            backgroundColor: Colors.green,
//            label: 'Adicionar Produto',
//            labelStyle: TextStyle(fontSize: 18.0),
//            //onTap: () => print('Adicionar Produto'),
//            onTap: () {
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (context) => AddProdutoScreen(this.snapshot)));
//            },
//          ),
//        ],
//      ),
//
//      /*floatingActionButton: FloatingActionButton(
//          onPressed: () {},
//          child: Icon(Icons.beenhere),
//          backgroundColor: Colors.blue,
//        ),*/
//    );
//  }
//}
