import 'package:cloud_firestore/cloud_firestore.dart';


class ProdutoData{

  String empresaa;
  String id;

  String item;
  double valor;
  double valorTotal;
  int quantidade;

  ProdutoData produtoData;
  ProdutoData();

  ProdutoData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    item = snapshot.data["item"];
    quantidade = snapshot.data["quantidade"];
    valor = snapshot.data["valor"];
  }

  Map<String, dynamic> ToMap(){
    return{
      "item": item,
      "quantidade" : quantidade,
      "valor": valor,
    };
  }

}