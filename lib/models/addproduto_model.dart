import 'package:agenda_virtual/data/produto_data.dart';
import 'package:agenda_virtual/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AddProdutoModel extends Model{

  final DocumentSnapshot snapshot;

  List<ProdutoData> products = [];

  AddProdutoModel(this.snapshot);

  static AddProdutoModel of(BuildContext context) => ScopedModel.of<AddProdutoModel>(context);

  Future<void> addDataProduto(produto) async {

    await Firestore.instance.collection('empresa').document(snapshot.documentID)
        .collection("PedidoAberto").add(produto).catchError((e) {
      print(e);
    });
  }

  getDataProduto() async {
    return await Firestore.instance.collection('empresa').document(snapshot.documentID).collection("PedidoAberto").getDocuments();
  }

  void deleteDataProduto(ProdutoData produtoData) async{

     await Firestore.instance.collection('empresa').document(snapshot.documentID)
         .collection("PedidoAberto").document(produtoData.id).delete().catchError((e) {
       print(e);
     });


     products.remove(produtoData);
     notifyListeners();
  }

  double getProdutovalor(){
    double valor = 0.0;
    for(ProdutoData c in products){
      valor += c.valor;
    }
    return valor;
  }


}