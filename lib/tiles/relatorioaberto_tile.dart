import 'package:agenda_virtual/data/produto_data.dart';
import 'package:agenda_virtual/models/addempresa_model.dart';
import 'package:agenda_virtual/models/addproduto_model.dart';
import 'package:agenda_virtual/screens/home_screen.dart';
import 'package:agenda_virtual/screens/produto_screen.dart';
import 'package:agenda_virtual/widgets/preco_total.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:scoped_model/scoped_model.dart';

class RelatorioAbertoTile extends StatelessWidget {
  final String type;
  final ProdutoData data;
  final DocumentSnapshot snapshot;

  RelatorioAbertoTile(this.type, this.data, this.snapshot);

  @override
  Widget build(BuildContext context) {
    double ValorTotal;
    ValorTotal = data.valor * data.quantidade;
    return Card(
      child: type == "list"
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          data.item,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Divider(),
                        Text(
                          "Quantidade: ${data.quantidade.toString()}",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Divider(),
                        Text(
                          "Valor Unitário: R\$ ${data.valor.toStringAsFixed(2)}",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "Total: R\$ ${ValorTotal.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          : Column(),
    );
  }
}
