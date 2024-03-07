import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/arbitre/arbitre_controller.dart';

class FormulaireArb4 extends StatelessWidget {
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
  FormulaireArb4(this.controller);

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
            "Joueur équipe B 11",
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
              //     Recherche.affiche(ListJoueurs("autre B", 2), context);
              //     //
              //   },
              //   title: const Text("Ajouter"),
              //   trailing: const Icon(Icons.add),
              // ),
              Obx(
                () => Column(
                  children: List.generate(arbitreController.joueurEqupeB.length,
                      (index) {
                    return ListTile(
                      onTap: () {
                        //
                      },
                      leading: SvgPicture.asset(
                        'assets/MakiSoccer11.svg',
                        width: 25,
                        height: 25,
                        color: Colors.blue,
                        semanticsLabel: 'IcTwotoneSports.svg',
                      ),
                      title: Text(
                          "${arbitreController.joueurEqupeB[index]['nom']}"),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Numero: ",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                              "${arbitreController.joueurEqupeB[index]['numero']}")
                        ],
                      ),
                      // trailing: IconButton(
                      //   icon: Icon(
                      //     Icons.delete,
                      //     color: Colors.red,
                      //   ),
                      //   onPressed: () {
                      //     //
                      //     arbitreController.joueurEqupeB.removeAt(index);
                      //     //
                      //   },
                      // ),
                    );
                  }),
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
            "Remplacants",
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
              //     Recherche.affiche(ListJoueurs("autre B r", 2), context);
              //     //
              //   },
              //   title: const Text("Ajouter"),
              //   trailing: const Icon(Icons.add),
              // ),
              Obx(
                () => Column(
                  children: List.generate(
                      arbitreController.joueurEquipeRemplacantB.length,
                      (index) {
                    return ListTile(
                      onTap: () {
                        //
                      },
                      leading: SvgPicture.asset(
                        'assets/MakiSoccer11.svg',
                        width: 25,
                        height: 25,
                        color: Colors.blue,
                        semanticsLabel: 'IcTwotoneSports.svg',
                      ),
                      title: Text(
                          "${arbitreController.joueurEquipeRemplacantB[index]['nom']}"),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Numero: ",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                              "${arbitreController.joueurEquipeRemplacantB[index]['numero']}")
                        ],
                      ),
                      // trailing: IconButton(
                      //   icon: Icon(
                      //     Icons.delete,
                      //     color: Colors.red,
                      //   ),
                      //   onPressed: () {
                      //     //
                      //     arbitreController.joueurEquipeRemplacantB
                      //         .removeAt(index);
                      //     //
                      //   },
                      // ),
                    );
                  }),
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
