import 'package:agenda_virtual/models/addproduto_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:agenda_virtual/widgets/input_field.dart';





class AddProdutoScreen extends StatefulWidget {
  final DocumentSnapshot snapshot;

  AddProdutoScreen(this.snapshot);


  @override
  _AddProdutoScreenState createState() => _AddProdutoScreenState();
}

class _AddProdutoScreenState extends State<AddProdutoScreen> {


  String nomeProduto;
  double valorProduto;
  int quantidade;

  @override
  Widget build(BuildContext context) {
    AddProdutoModel crudObj2 = new AddProdutoModel(widget.snapshot);
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text("Produto"),
        centerTitle: true,
      ),

      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.fastfood,
                    color: Colors.blueGrey[600],
                    size: 160,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Nome do Produto'),
                    onChanged: (value) {
                      this.nomeProduto = value;
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(hintText: 'Quantidade'),
                    onChanged: (value) {
                      this.quantidade = int.parse(value);
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(hintText: "Valor do Produto"),
                    onChanged: (value) {
                      this.valorProduto = double.parse(value);
                    },
                  ),

                  SizedBox(height: 20,),
                  SizedBox(
                    height: 50,
                    child: RaisedButton(
                      color: Colors.blueGrey[600],
                      child: Text("Adicionar"),
                      onPressed: (){
                        Navigator.of(context).pop();
                        crudObj2.addDataProduto({
                          'item': this.nomeProduto,
                          'quantidade' : this.quantidade,
                          'valor': this.valorProduto
                        }).then((result) {
                        }).catchError((e) {
                          print(e);
                        });
                      },
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


