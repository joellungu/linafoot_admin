import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/arbitre/arbitre_controller.dart';

class Officier extends StatelessWidget {
  String equipe;
  Officier(this.equipe);
  //
  TextEditingController nom = TextEditingController();
  TextEditingController fonction = TextEditingController();
  //
  ArbitreController2 arbitreController = Get.find();

  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("Officier $equipe"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Nom",
                style: textStyle,
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade600,
                ),
              ),
              child: TextField(
                controller: nom,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Fonction °",
                style: textStyle,
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade600,
                ),
              ),
              child: TextField(
                controller: fonction,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                //
                if (equipe == "Equipe A") {
                  arbitreController.officierEquipeA.add({
                    "nom": nom.text,
                    "fonction": fonction.text,
                  });
                } else {
                  arbitreController.officierEquipeB.add({
                    "nom": nom.text,
                    "fonction": fonction.text,
                  });
                }
                Get.back();
                //
              },
              child: const Text("Ajouter officier"),
            ),
          ],
        ),
      ),
    );
  }

  //
  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
