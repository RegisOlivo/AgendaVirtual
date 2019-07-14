import 'package:agenda_virtual/data/produto_data.dart';
import 'package:flutter/material.dart';

class RelatorioFechadoTile extends StatelessWidget {
  final String type;
  final ProdutoData data;

  RelatorioFechadoTile(this.type, this.data);


  @override
  Widget build(BuildContext context) {
    return InkWell(

        child: type == "list"
            ? Row(
          children: <Widget>[
            Flexible(
              child: Icon(Icons.add, color: Colors.black,),
            ),
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
                    Text(
                      "R\$ ${data.valor.toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        )
            : Column());
  }
}
