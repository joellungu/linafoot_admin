import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../commissaire_controller.dart';

class FormulaireCom2 extends StatelessWidget {
  //
  PageController controller;
  //
  CommissaireController2 commissaireController = Get.find();
  //
  FormulaireCom2(this.controller);

  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      children: [
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Avertissements joueurs equipe A",
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
              Obx(
                () => Column(
                  children: List.generate(
                    commissaireController.avertissementsJoueursGeneralA.length,
                    (index) {
                      Map infos = commissaireController
                          .avertissementsJoueursGeneralA[index];
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/carte.svg',
                          width: 30,
                          height: 30,
                          semanticsLabel: 'carte.svg',
                          color: Colors.yellow.shade700,
                        ),
                        title: Text("${commissaireController.equipeA['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        //   trailing: IconButton(
                        //     icon: const Icon(
                        //       Icons.delete,
                        //       color: Colors.red,
                        //     ),
                        //     onPressed: () {
                        //       //
                        //       commissaireController.avertissementsJoueursGeneralA
                        //           .removeAt(index);
                        //     },
                        //   ),
                      );
                    },
                  ),
                ),
              )
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
            "Expulsions joueurs equipe A",
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
              Obx(
                () => Column(
                  children: List.generate(
                    commissaireController.expulssionsJoueursGeneralA.length,
                    (index) {
                      Map infos = commissaireController
                          .expulssionsJoueursGeneralA[index];
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/carte.svg',
                          width: 30,
                          height: 30,
                          semanticsLabel: 'carte.svg',
                          color: Colors.red.shade700,
                        ),
                        title: Text("${commissaireController.equipeA['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        // trailing: IconButton(
                        //   icon: const Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     commissaireController.expulssionsJoueursGeneralA
                        //         .removeAt(index);
                        //   },
                        // ),
                      );
                    },
                  ),
                ),
              )
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
            "Buts joueurs equipe A",
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
              Obx(
                () => Column(
                  children: List.generate(
                    commissaireController.butsJoueursGeneralA.length,
                    (index) {
                      Map infos =
                          commissaireController.butsJoueursGeneralA[index];
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/IcBaselineSportsSoccer.svg',
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                          semanticsLabel: 'IcBaselineSportsSoccer.svg',
                        ),
                        title: Text("${commissaireController.equipeA['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        // trailing: IconButton(
                        //   icon: const Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     commissaireController.butsJoueursGeneralA
                        //         .removeAt(index);
                        //     //
                        //   },
                        // ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        // Align(
        //   alignment: Alignment.topLeft,
        //   child: Text(
        //     "Arbitre protocolaire",
        //     style: textStyle,
        //   ),
        // ),
        // Container(
        //   //height: 70,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(
        //       color: Colors.grey.shade600,
        //     ),
        //   ),
        //   child: Column(
        //     children: [
        //       ListTile(
        //         onTap: () {
        //           //
        //         },
        //         title: const Text("Ajouter"),
        //         trailing: const Icon(Icons.add),
        //       ),
        //       ListTile(
        //         onTap: () {
        //           //
        //         },
        //         leading: SvgPicture.asset(
        //           'assets/IcTwotoneSports.svg',
        //           width: 25,
        //           height: 25,
        //           semanticsLabel: 'IcTwotoneSports.svg',
        //         ),
        //         title: const Text("TELESI KIBOMA PATRICK"),
        //         subtitle: const Text("A3"),
        //         trailing: const Icon(
        //           Icons.delete,
        //           color: Colors.red,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // //
        const SizedBox(
          height: 20,
        ),
        Divider(
          color: Colors.red,
        ),
        const SizedBox(
          height: 10,
        ),
        //______________________________________________________________________
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Avertissements joueurs equipe B",
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
              Obx(
                () => Column(
                  children: List.generate(
                    commissaireController.avertissementsJoueursGeneralB.length,
                    (index) {
                      Map infos = commissaireController
                          .avertissementsJoueursGeneralB[index];
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/carte.svg',
                          width: 30,
                          height: 30,
                          semanticsLabel: 'carte.svg',
                          color: Colors.yellow.shade700,
                        ),
                        title: Text("${commissaireController.equipeB['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        // trailing: IconButton(
                        //   icon: const Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     commissaireController.avertissementsJoueursGeneralB
                        //         .removeAt(index);
                        //   },
                        // ),
                      );
                    },
                  ),
                ),
              )
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
            "Expulsions joueurs equipe B",
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
              Obx(
                () => Column(
                  children: List.generate(
                    commissaireController.expulssionsJoueursGeneralB.length,
                    (index) {
                      Map infos = commissaireController
                          .expulssionsJoueursGeneralB[index];
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/carte.svg',
                          width: 30,
                          height: 30,
                          semanticsLabel: 'carte.svg',
                          color: Colors.red.shade700,
                        ),
                        title: Text("${commissaireController.equipeB['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        // trailing: IconButton(
                        //   icon: const Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     commissaireController.expulssionsJoueursGeneralB
                        //         .removeAt(index);
                        //   },
                        // ),
                      );
                    },
                  ),
                ),
              )
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
            "Buts joueurs equipe B",
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
              Obx(
                () => Column(
                  children: List.generate(
                    commissaireController.butsJoueursGeneralB.length,
                    (index) {
                      Map infos =
                          commissaireController.butsJoueursGeneralB[index];
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/IcBaselineSportsSoccer.svg',
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                          semanticsLabel: 'IcBaselineSportsSoccer.svg',
                        ),
                        title: Text("${commissaireController.equipeB['nom']}"),
                        subtitle: Text("${infos['joueur']['nom']}"),
                        // trailing: IconButton(
                        //   icon: const Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     commissaireController.butsJoueursGeneralB
                        //         .removeAt(index);
                        //     //
                        //   },
                        // ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        // const SizedBox(
        //   height: 20,
        // ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     InkWell(
        //       onTap: () {
        //         //
        //         controller.previousPage(
        //             duration: const Duration(milliseconds: 300),
        //             curve: Curves.ease);
        //         //
        //       },
        //       child: Container(
        //         decoration: const BoxDecoration(
        //           color: Colors.blue,
        //           borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(30),
        //             bottomLeft: Radius.circular(30),
        //           ),
        //         ),
        //         alignment: Alignment.center,
        //         height: 50,
        //         width: 100,
        //         child: const Text(
        //           "Retour",
        //           style: TextStyle(
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //     InkWell(
        //       onTap: () {
        //         //
        //         controller.nextPage(
        //             duration: const Duration(milliseconds: 300),
        //             curve: Curves.ease);
        //         //
        //       },
        //       child: Container(
        //         decoration: const BoxDecoration(
        //           color: Colors.blue,
        //           borderRadius: BorderRadius.only(
        //             topRight: Radius.circular(30),
        //             bottomRight: Radius.circular(30),
        //           ),
        //         ),
        //         alignment: Alignment.center,
        //         height: 50,
        //         width: 100,
        //         child: const Text(
        //           "Suivant 2/7",
        //           style: TextStyle(
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),

        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
