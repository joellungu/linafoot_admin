import 'package:flutter/material.dart';

class DetailsRapport extends StatelessWidget {
  Map rapport;
  DetailsRapport(this.rapport);
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("Details du match"),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
  //
}
