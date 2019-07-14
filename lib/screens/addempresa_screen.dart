import 'dart:async';
import 'package:agenda_virtual/models/addempresa_model.dart';
import 'package:agenda_virtual/models/user_model.dart';
import 'package:agenda_virtual/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AddEmpresaScreen extends StatefulWidget {
  @override
  _AddEmpresaScreenState createState() => _AddEmpresaScreenState();
}

class _AddEmpresaScreenState extends State<AddEmpresaScreen> {
  String nomeEmpresa;

  AddEmpresaModel crudObj = new AddEmpresaModel();
  DateTime _dateTime = new DateTime.now();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: _dateTime, firstDate: new DateTime(2019), lastDate: new DateTime(2021));
  if(picked != null && picked != _dateTime){
    setState(() {
      _dateTime = picked;
    });
    }
  }

  final _nameempresaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    _nameempresaController.clear();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[600],
          title: Text("Nova Empresa"),
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
                    Icons.business,
                    color: Colors.blueGrey[600],
                    size: 160,
                  ),
                  SizedBox(
                    child: Text('Data selecionada: ${_dateTime.toString()}' ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 40,
                    child: RaisedButton(
                    color: Colors.blueGrey[600],
                    textColor: Colors.white,

                    child: Text('Selecione a data'),
                    onPressed: (){selectDate(context);},
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Nome da Empresa'),
                    onChanged: (value) {
                      this.nomeEmpresa = value;
                    },
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 40,
                    child: RaisedButton(
                      color: Colors.blueGrey[600],
                      child: Text("Cadastrar"),
                      onPressed: (){
                        Navigator.of(context).pop();
                        crudObj.addData({
                          'data' : this._dateTime.toString(),
                          'descricao': this.nomeEmpresa
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
