import 'package:agenda_virtual/data/produto_data.dart';
import 'package:agenda_virtual/models/addproduto_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ProdutoScreen extends StatefulWidget {
  final ProdutoData data;
  final DocumentSnapshot snapshot;
  ProdutoScreen(this.data, this.snapshot);

  @override
  _ProdutoScreenState createState() => _ProdutoScreenState(data, snapshot);
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  List<ProdutoData> products = [];
  final DocumentSnapshot snapshot;
  final ProdutoData data;
  _ProdutoScreenState(this.data, this.snapshot);

  @override
  Widget build(BuildContext context) {
    AddProdutoModel crudObj2 = new AddProdutoModel(widget.snapshot);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text(data.item),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Nome do produto: ${data.item}",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold
                  ),
                  maxLines: 3,
                ),
                Divider(),
                Text(
                  "Quantidade: ${data.quantidade.toString()}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Divider(),
                Text(
                  "Valor unitário: R\$ ${data.valor.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Divider(),
                /*IconButton(
                  icon: Icon(Icons.delete_forever),
                  color: Colors.red,
                  iconSize: 60.0,
                  onPressed: (){
                    AddProdutoModel.of(context).deleteDataProduto(data);
                   // crudObj2.deleteDataProduto(data);
                  },
                ),*/
              ],
            ),
          )
        ],
      ),

    );
  }
}
