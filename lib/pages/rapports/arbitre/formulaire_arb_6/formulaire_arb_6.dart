import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/arbitre/arbitre_controller.dart';

class FormulaireArb6 extends StatelessWidget {
  //
  PageController controller;
  //
  ArbitreController2 arbitreController = Get.find();
  //
  RxInt equipeAmin = 0.obs;
  RxInt equipeBmin = 0.obs;
  //
  RxInt equipeAfin = 0.obs;
  RxInt equipeBfin = 0.obs;
  //
  RxMap scoreMitemps = {}.obs;
  RxMap scoreFin = {}.obs;
  //
  //
  List competitions = [
    "Linafoot",
    "Ecofin",
    "Autre",
  ];
  //
  RxInt competition = 0.obs;
  //
  RxString date = "".obs;
  RxString heure = "".obs;
  //
  FormulaireArb6(this.controller);

  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      children: [
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Officiers equipes A",
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
              // ListTile(
              //   onTap: () {
              //     //
              //     Get.to(Officier("Equipe A"));
              //     //
              //   },
              //   title: const Text("Ajouter"),
              //   trailing: const Icon(Icons.add),
              // ),
              Obx(
                () => Column(
                  children: List.generate(
                    arbitreController.officierEquipeA.length,
                    (i) {
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: const Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        title: Text(
                            "${arbitreController.officierEquipeA[i]['nom']}"),
                        subtitle: Text(
                            "${arbitreController.officierEquipeA[i]['fonction']}"),
                        // trailing: IconButton(
                        //   icon: const Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     arbitreController.officierEquipeA.removeAt(i);
                        //     //
                        //   },
                        // ),
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
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Officiers equipes B",
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
              // ListTile(
              //   onTap: () {
              //     //
              //     Get.to(Officier("Equipe B"));
              //     //
              //   },
              //   title: const Text("Ajouter"),
              //   trailing: const Icon(Icons.add),
              // ),
              Obx(
                () => Column(
                  children: List.generate(
                    arbitreController.officierEquipeB.length,
                    (i) {
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        title: Text(
                            "${arbitreController.officierEquipeB[i]['nom']}"),
                        subtitle: Text(
                            "${arbitreController.officierEquipeB[i]['fonction']}"),
                        // trailing: IconButton(
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     arbitreController.officierEquipeB.removeAt(i);
                        //     //
                        //   },
                        // ),
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
        //
      ],
    );
  }

  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
