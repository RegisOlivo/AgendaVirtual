import 'package:agenda_virtual/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      key: _scaffoldKey,
        backgroundColor: Colors.grey[400],
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoading)
              return Center(child: CircularProgressIndicator(),);
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: "Nome Completo",
                        icon: Icon(Icons.person_outline)
                    ),
                    validator: (text){
                      if(text.isEmpty) return "Nome Inválido!";
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        icon: Icon(Icons.person_outline)
                    ),
                    validator: (text){
                      if(text.isEmpty || !text.contains("@")) return "Email Inválido!";
                    },
                  ),
                  TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(
                        hintText: "Senha",
                        icon: Icon(Icons.lock_outline)
                    ),
                    obscureText: true,
                    validator: (text){
                      if(text.isEmpty || text.length < 6) return "Senha Inválida!";
                    },
                  ),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                        hintText: "Enderoço",
                        icon: Icon(Icons.person_outline)
                    ),
                    validator: (text){
                      if(text.isEmpty) return "Endereço Inválido!";
                    },
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 50,
                    child: RaisedButton(
                      color: Colors.blueGrey[600],
                      child: Text("Cadastrar"),
                      textColor: Colors.white,
                      onPressed: (){
                        //Navigator.of(context).push(
                        //    MaterialPageRoute(builder: (context)=>HomeScreen())
                        // );
                        if(_formKey.currentState.validate()){

                          Map<String, dynamic> userData = {
                            "name": _nameController.text,
                            "email": _emailController.text,
                            "address": _addressController.text
                          };

                          model.signUp(
                              userData: userData,
                              passpass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            );
          },
        )
    );
  }

  void _onSuccess(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Usuário criado com sucesso!"),
          backgroundColor: Theme.of(context).primaryColor,
          duration: Duration(seconds: 2),
        )
    );
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.of(context).pop();
    }
    );
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao criar usuário!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );
  }
}