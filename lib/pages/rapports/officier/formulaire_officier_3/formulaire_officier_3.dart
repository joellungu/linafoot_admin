import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/officier/officier_controller.dart';

import 'remplacement.dart';

class FormulaireOffice3 extends StatelessWidget {
  //
  PageController controller;
  //
  OfficierController2 officierController = Get.find();
  //
  FormulaireOffice3(this.controller);
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
            "Remplacements equipes A",
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
                  Get.to(Remplacement("Equipe A"));
                  //
                },
                title: const Text("Ajouter"),
                trailing: const Icon(Icons.add),
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    officierController.joueurRemplacantA.length,
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
                                  "${officierController.joueurRemplacantA[i]['entrant']['nom']}"),
                              subtitle: Text(
                                  "${officierController.joueurRemplacantA[i]['entrant']['numero']}"),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  officierController.joueurRemplacantA
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
                                  "${officierController.joueurRemplacantA[i]['sortant']['nom']}"),
                              subtitle: Text(
                                  "${officierController.joueurRemplacantA[i]['sortant']['numero']}"),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  officierController.joueurRemplacantA
                                      .removeAt(i);
                                  //
                                },
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.timelapse),
                              title: Text("Minute:"),
                              subtitle: Text(
                                  "${officierController.joueurRemplacantA[i]['minute']}"),
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
