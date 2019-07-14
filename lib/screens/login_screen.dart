import 'package:agenda_virtual/models/user_model.dart';
import 'package:agenda_virtual/screens/home_screen.dart';
import 'package:agenda_virtual/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:agenda_virtual/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    //final _formKey = GlobalKey<FormState>();

    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: Colors.grey[400],
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoading)
              return Center(child: CircularProgressIndicator(),);
            return Form(
              key: _formKey,
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(
                          Icons.local_dining,
                          color: Colors.blueGrey[600],
                          size: 160,
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              hintText: "E-mail"
                          ),
                          keyboardType: TextInputType.emailAddress,

                        ),
                        TextFormField(
                          controller: _passController,
                          decoration: InputDecoration(
                              hintText: "Senha"
                          ),
                          obscureText: true,
                          validator: (text){
                            if(text.isEmpty || text.length < 6) return "Senha inválida!";
                          },
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 50,
                          child: RaisedButton(
                            color: Colors.blueGrey[600],
                            child: Text("Entrar"),
                            onPressed: (){
                              if(_formKey.currentState.validate()){
                              }
                              model.signIn(
                                  email: _emailController.text,
                                  passpass: _passController.text,
                                  onSuccess: _onSuccess,
                                  onFail: _onFail
                              );


                            },
                            textColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 50,
                          child: RaisedButton(
                            color: Colors.blueGrey[600],
                            child: Text("Criar Conta"),
                            onPressed: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>SignUpScreen())
                              );

                            },
                            textColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),

            );
          },
        )
    );
  }

  void _onSuccess(){
    Navigator.of(context).pop();
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao entrar!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );
  }
}


