import 'package:flutter/material.dart';

class ProdutoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return Column(
      children: <Widget>[
        TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              hintText: "Pesquisar",
              hintStyle: TextStyle(color: Colors.white),
              icon: Icon(Icons.search, color: Colors.white,),
              border: InputBorder.none
          ),
        )
      ],
    );
  }
}