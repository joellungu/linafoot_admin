import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot_admin/pages/rapports/officier/officier_controller.dart';

import '../formulaire_officier_3/remplacement.dart';

class FormulaireOffice4 extends StatelessWidget {
  //
  PageController controller;
  //
  int local;
  //
  var box = GetStorage();
  //
  Map match;
  //
  OfficierController2 officierController = Get.find();
  //
  FormulaireOffice4(this.controller, this.match, this.local);
  //
  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Remplacements equipes B",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  //
                  Get.to(Remplacement("Equipe B"));
                  //
                },
                title: const Text("Ajouter"),
                trailing: const Icon(Icons.add),
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    officierController.joueurRemplacantB.length,
                    (i) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              onTap: () {
                                //
                              },
                              leading: Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              title: Text(
                                  "${officierController.joueurRemplacantB[i]['entrant']['nom']}"),
                              subtitle: Text(
                                  "${officierController.joueurRemplacantB[i]['entrant']['numero']}"),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  officierController.joueurRemplacantB
                                      .removeAt(i);
                                  //
                                },
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                //
                              },
                              leading: Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              title: Text(
                                  "${officierController.joueurRemplacantB[i]['sortant']['nom']}"),
                              subtitle: Text(
                                  "${officierController.joueurRemplacantB[i]['sortant']['numero']}"),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  officierController.joueurRemplacantB
                                      .removeAt(i);
                                  //
                                },
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.timelapse),
                              title: Text("Minute:"),
                              subtitle: Text(
                                  "${officierController.joueurRemplacantB[i]['minute']}"),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        //
      ],
    );
  }

  //
  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
