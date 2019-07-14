import 'package:agenda_virtual/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return Stack(

      children: <Widget>[

        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.blueGrey[600],
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Inicio"),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              builder: (context, snapshot){
                  return SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.fastfood, size: 160,)
                        ],
                      ),
                    ),
                  );
              },
            )
          ],
        )
      ],

    );
  }
}
