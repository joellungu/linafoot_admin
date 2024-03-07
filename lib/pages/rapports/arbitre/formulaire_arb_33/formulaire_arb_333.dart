import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/arbitre/arbitre_controller.dart';

import 'remplacement.dart';

class FormulaireArb333 extends StatelessWidget {
  //
  PageController controller;
  //
  ArbitreController2 arbitreController = Get.find();
  //
  FormulaireArb333(this.controller);
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
                    arbitreController.joueurRemplacantB.length,
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
                                  "${arbitreController.joueurRemplacantB[i]['entrant']['nom']}"),
                              subtitle: Text(
                                  "${arbitreController.joueurRemplacantB[i]['sortant']['nom']}\nMin: ${arbitreController.joueurRemplacantA[i]['minute']}"),
                              // trailing: IconButton(
                              //   icon: Icon(
                              //     Icons.delete,
                              //     color: Colors.red,
                              //   ),
                              //   onPressed: () {
                              //     //
                              //     arbitreController.joueurRemplacantB
                              //         .removeAt(i);
                              //     //
                              //   },
                              // ),
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
                                  "${arbitreController.joueurRemplacantB[i]['sortant']['nom']}"),
                              subtitle: Text(
                                  "${arbitreController.joueurRemplacantB[i]['sortant']['equipe']}"),
                              // trailing: IconButton(
                              //   icon: Icon(
                              //     Icons.delete,
                              //     color: Colors.red,
                              //   ),
                              //   onPressed: () {
                              //     //
                              //     arbitreController.joueurRemplacantB
                              //         .removeAt(i);
                              //     //
                              //   },
                              // ),
                            ),
                            ListTile(
                              leading: Icon(Icons.timelapse),
                              title: Text("Minute:"),
                              subtitle: Text(
                                  "${arbitreController.joueurRemplacantB[i]['minute']}"),
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
          height: 20,
        ),
      ],
    );
  }

  //
  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
