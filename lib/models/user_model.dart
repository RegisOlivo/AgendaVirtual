
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class UserModel extends Model {

  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();
  Map<String, dynamic> _tmp = Map();

  bool isLoading = false;

  static UserModel of(BuildContext context) => ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }

  void _tmpMap() {
    debugPrint("### _tmpMap  ###");
    _tmp["name"] = null;

    userData = _tmp;
  }

  void signUp({@required Map<String, dynamic> userData, @required String passpass, @required VoidCallback onSuccess, @required VoidCallback onFail}){
    print("primeiro");
    isLoading = true;
    notifyListeners();

    print(userData["email"]);
    print(passpass);

    _auth.createUserWithEmailAndPassword(email: userData["email"], password: passpass).then((user) async {
      print("then");
      firebaseUser = user;

      await _saveUserData(userData);

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

  void signIn({@required String email, @required String passpass, @required VoidCallback onSuccess, @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    _auth.signInWithEmailAndPassword(email: email, password: passpass).then(
        (user) async{
          firebaseUser = user;

          await _loadCurrentUser();

          onSuccess();
          isLoading = false;
          notifyListeners();
        }).catchError((e){
          onFail();
          isLoading = false;
          notifyListeners();
    });
  }

  void signOut() async {
    await _auth.signOut();

    userData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  void recoverPass(){

  }

  bool isLoggedIn(){
    return firebaseUser != null;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
  }

  Future<Null> _loadCurrentUser() async{
    if(firebaseUser == null)
      firebaseUser = await _auth.currentUser();
    if(firebaseUser == null){
      _tmpMap();
    }
    if(firebaseUser != null){
      if(userData["name"] == null){
        DocumentSnapshot docUser =
        await Firestore.instance.collection("users").document(firebaseUser.uid).get();
        userData = docUser.data;
      }
    }
    notifyListeners();
  }
}