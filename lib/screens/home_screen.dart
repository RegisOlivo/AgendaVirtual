import 'package:agenda_virtual/models/user_model.dart';
import 'package:agenda_virtual/tabs/empresaaberto_tab.dart';
import 'package:agenda_virtual/tabs/empresafechado_tab.dart';
import 'package:agenda_virtual/tabs/home_tab.dart';
import 'package:agenda_virtual/widgets/custom_bar.dart';
import 'package:agenda_virtual/widgets/custom_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  final _bottonController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      //controller: _bottonController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.grey[400],
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          /*floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
          ),*/

          /* bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.blueAccent,
                primaryColor: Colors.white,
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(caption: TextStyle(color: Colors.white))),
            child: BottomNavigationBar(
              onTap: (p) {

              },
              //type: BottomNavigationBarType.shifting,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_shopping_cart,
                        color: Color.fromARGB(255, 255, 255, 225)),
                    title: Text("Adicionar")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle,
                        color: Color.fromARGB(255, 255, 255, 225)),
                    title: Text("Salvar")),
              ],
            ),
          ),*/
        ),
        Scaffold(
          backgroundColor: Colors.grey[400],
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[600],
            title: Text("Escolha o Estabelecimento"),
            centerTitle: true,
          ),
          body: EmpresaAbertoTab(),
          drawer: CustomDrawer(_pageController),

          /*floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
          ),*/
          floatingActionButton: CustomBar(),
        ),

        /*Scaffold(
          backgroundColor: Colors.grey[400],
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[600],
            title: Text("Estabelecimentos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: EmpresaFechadoTab(),
          */ /*floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
          ),*/ /*
        ),*/

        /*Container(
          color: Colors.red,
        )*/
      ],
    );
  }
}
