import 'package:agenda_virtual/models/user_model.dart';
import 'package:agenda_virtual/screens/login_screen.dart';
import 'package:agenda_virtual/tiles/empresaaberto_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmpresaAbertoTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("empresa").getDocuments(),
        //future: Firestore.instance.collection("users").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
    return Center(
    child: CircularProgressIndicator(),
    );
    }else if(!UserModel.of(context).isLoggedIn()){
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.remove_shopping_cart,
                  size: 80.0,
                  color: Colors.blueGrey[600],),
                SizedBox(height: 16.0,),
                Text("Faça o Login para o acesso!",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0,),
                RaisedButton(child: Text("Logar", style: TextStyle(fontSize: 18.0),),
                  textColor: Colors.white,
                  color: Colors.blueGrey[600],
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>LoginScreen())
                    );
                  },
                )
              ],
            ),
          );
        } else {
          var dividedTiles = ListTile.divideTiles(
              tiles: snapshot.data.documents.map((doc) {
                return EmpresaAbertoTile(doc);
              }).toList(),
              color: Colors.grey[800])
              .toList();

          return ListView(

            children: dividedTiles,
          );
        }
      },


    );


  }
}
