import 'package:agenda_virtual/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddEmpresaModel extends Model{


  /*FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser firebaseUser;
  Map<String, dynamic> empresaData = Map();
  bool isLoading = false;

  void signUp({ Map<String, dynamic> empresaData, VoidCallback onSuccess, VoidCallback onFail}){
    print("primeiro");
    isLoading = true;
    notifyListeners();

    print(empresaData["descricao"]);

    _auth.(email: empresaData["descricao"]).then((empresa) async {
      print("then");
      firebaseUser = empresa;

      await _saveEmpresaData(empresaData);

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e){
      print("erro");
      onFail();
      isLoading = false;
      notifyListeners();
    });

  }

  Future<Null> _saveEmpresaData(Map<String, dynamic> userData) async {
    this.empresaData = userData;
    await Firestore.instance.collection("empresa").document(firebaseUser.uid).setData(empresaData);
  }*/

  /*static Future<String> createEmpresa() async {

    var empresa = <String, dynamic>{
      'descricao' : '',
      //'created' : _getDateNow(),
    };

    DatabaseReference reference = FirebaseDatabase.instance.reference().child("empresa").push();

    reference.set(empresa);

    return reference.key;
  }

  static Future<void> saveDescricao(String empresaKey, String descricao) async {

    return FirebaseDatabase.instance.reference().child("empresa").child(empresaKey).child("descricao").set(descricao);

  }*/

  /*String _getDateNow(){
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }*/

  static AddEmpresaModel of(BuildContext context) => ScopedModel.of<AddEmpresaModel>(context);

  Future<void> addData(empresa) async {
      await Firestore.instance.collection('empresa').add(empresa).catchError((e) {
        print(e);
      });
  }

  getData() async {
    return await Firestore.instance.collection('empresa').getDocuments();
  }

}