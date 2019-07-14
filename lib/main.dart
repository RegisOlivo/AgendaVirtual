import 'package:agenda_virtual/models/addproduto_model.dart';
import 'package:agenda_virtual/screens/home_screen.dart';
import 'package:agenda_virtual/screens/login_screen.dart';
import 'package:agenda_virtual/screens/signup_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/user_model.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  DocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModel<AddProdutoModel>(
          model: AddProdutoModel(snapshot),
          child: MaterialApp(
              title: 'Flutter Mercado',
              theme: ThemeData(
                  primarySwatch: Colors.blue,
                  primaryColor: Color.fromARGB(255, 4, 125, 141)
              ),
              debugShowCheckedModeBanner: false,
              home: HomeScreen()
          ),
      )
    );
  }
}