import 'package:agenda_virtual/data/produto_data.dart';
import 'package:agenda_virtual/models/addempresa_model.dart';
import 'package:agenda_virtual/models/addproduto_model.dart';
import 'package:agenda_virtual/screens/home_screen.dart';
import 'package:agenda_virtual/widgets/preco_total.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:scoped_model/scoped_model.dart';

class PrecoTotal extends StatelessWidget {
  final String type;
  final ProdutoData data;

  PrecoTotal(this.type, this.data);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: type == "list" ? Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "R\$ ${data.valor.toStringAsFixed(2)}",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ],


      ): Column(),
    );

  }
}