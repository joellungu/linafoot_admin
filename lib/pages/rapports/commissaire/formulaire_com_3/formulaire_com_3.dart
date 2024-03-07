import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../commissaire_controller.dart';

class FormulaireCom3 extends StatelessWidget {
  //
  PageController controller;
  //
  RxInt attitudeJouerA = 1.obs;
  RxInt attitudeJouerB = 1.obs;
  //
  RxInt attitudePublic = 1.obs;
  RxInt etatTerrain = 1.obs;
  RxInt etatInstallation = 1.obs;
  //
  CommissaireController2 commissaireController = Get.find();
  //
  TextEditingController nombreSpectateur = TextEditingController();
  //
  List etats = [
    "Tension et Excitation",
    "Encouragement",
    "Nervosité",
    "Critique",
    "Célébration ou Déception",
    "Réactions envers l'adversaire",
  ];
  //
  List etatsTI = [
    "Pelouse Praticable",
    "Pelouse non Praticable",
    "Drainage Adéquat",
    "Drainage non Adéquat",
    "Marquages Clairs",
    "Marquages Ilisibles",
    "Fanions d'Angle",
    "Pas de fanions d'angle",
    "Filets de But solide et correct",
    "Filets de But troué et incorrect",
    "Surface Plane",
    "Surface dénivelé",
    "Bancs des Remplaçants",
    "Abscence de bancs des remplaçants",
    "Éclairage Suffisant",
    "Éclairage insuffisant",
    "Vestiaires Fonctionnels",
    "Vestiaires non fonctionnels",
    "Sièges pour les Spectateurs adequate",
    "Sièges pour les Spectateurs inexistant",
    "Tunnel Joueur sécurisé",
    "Tunnel Joueur non sécurisé",
    "Presence ambulance",
    "Ambulance abscente",
    "Zones Réservées aux Médias existante",
    "Zones Réservées aux Médias ineexistante",
    "Sécurité et Incendie maximale",
    "Sécurité et Incendie minimale",
    "Sécurité et Incendie inexistante",
    "Aspect Général"
  ];

  RxList etatsTerrainListe = [].obs;
  //
  RxList etatsInstallationListe = [].obs;
  //

  FormulaireCom3(this.controller);
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
            "Nombre de spectateurs",
            style: textStyle,
          ),
        ),
        TextField(
          controller: commissaireController.nombreSpectateur.value,
          textAlign: TextAlign.center,
          maxLines: 1,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Attitude Joueurs équipe A",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: Obx(
              () => DropdownButton(
                onChanged: (e) {
                  //
                  //commissaireController.attitudeJouerA.value = e as int;
                },
                value: commissaireController.attitudeJouerA.value,
                items: List.generate(
                  etats.length,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text("${etats[index]}"),
                  ),
                ),
              ),
            ),
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Attitude Joueurs équipe B",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: Obx(
              () => DropdownButton(
                onChanged: (e) {
                  //
                  //commissaireController.attitudeJouerB.value = e as int;
                },
                value: commissaireController.attitudeJouerB.value,
                items: List.generate(
                  etats.length,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text("${etats[index]}"),
                  ),
                ),
              ),
            ),
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Attitude public",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: Obx(
              () => DropdownButton(
                onChanged: (e) {
                  //
                  //commissaireController.attitudePublic.value = e as int;
                },
                value: commissaireController.attitudePublic.value,
                items: List.generate(
                  etats.length,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text("${etats[index]}"),
                  ),
                ),
              ),
            ),
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Etat terrain",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          //height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              DropdownButtonHideUnderline(
                child: Obx(
                  () => DropdownButton(
                    onChanged: (e) {
                      //
                      //commissaireController.etatTerrain.value = e as int;
                      //
                      //commissaireController.etatsTerrainListe.add(etatsTI[e]);
                    },
                    isExpanded: true,
                    value: commissaireController.etatTerrain.value,
                    items: List.generate(
                      etatsTI.length,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text("${etatsTI[index]}"),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    commissaireController.etatsTerrainListe.length,
                    (index) {
                      //
                      String e = commissaireController.etatsTerrainListe[index];
                      //
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/F7Sportscourt.svg',
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                          semanticsLabel: 'IcSharpLocationOn.svg',
                        ),
                        title: Text(e),
                        // trailing: IconButton(
                        //   onPressed: () {
                        //     //
                        //     commissaireController.etatsTerrainListe
                        //         .removeAt(index);
                        //   },
                        //   icon: const Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
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
            "Etat installation",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          //height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              DropdownButtonHideUnderline(
                child: Obx(
                  () => DropdownButton(
                    onChanged: (e) {
                      //
                      // commissaireController.etatInstallation.value = e as int;
                      // commissaireController.etatsInstallationListe
                      //     .add(etatsTI[e]);
                    },
                    isExpanded: true,
                    value: commissaireController.etatInstallation.value,
                    items: List.generate(
                      etatsTI.length,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text("${etatsTI[index]}"),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Column(
                  children: List.generate(
                    commissaireController.etatsInstallationListe.length,
                    (index) {
                      //
                      String e =
                          commissaireController.etatsInstallationListe[index];
                      //
                      return ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/F7Sportscourt.svg',
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                          semanticsLabel: 'IcSharpLocationOn.svg',
                        ),
                        title: Text(e),
                        // trailing: IconButton(
                        //   onPressed: () {
                        //     //
                        //     commissaireController.etatsInstallationListe
                        //         .removeAt(index);
                        //   },
                        //   icon: const Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        // ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        // const SizedBox(
        //   height: 20,
        // ),
        // //
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
        //           "Suivant 3/7",
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

  //
  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
