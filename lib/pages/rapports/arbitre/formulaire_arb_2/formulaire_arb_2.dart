import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../arbitre_controller.dart';

class FormulaireArb2 extends StatelessWidget {
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
  TextEditingController nombreSpectateur = TextEditingController();
  //
  ArbitreController2 arbitreController = Get.find();
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
  List meteos = [
    "En solaillé",
    "Nuageux",
    "Pluie",
    "Rosée",
  ];
  //
  RxInt meteo = 1.obs;
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

  FormulaireArb2(this.controller);
  //
  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      children: [
        const SizedBox(
          height: 10,
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Condition meteorologique",
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
                  // meteo.value = e as int;
                  // arbitreController.meteo.value = meteos[meteo.value];
                  // //
                },
                value: meteo.value,
                items: List.generate(
                  meteos.length,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text("${meteos[index]}"),
                  ),
                ),
              ),
            ),
          ),
        ),
        //
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Comportement equipe A",
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
                  // attitudeJouerA.value = e as int;
                  // //
                  // arbitreController.comportementEquipeA.value =
                  //     etats[attitudePublic.value];
                  // arbitreController.indexComportementEquipeA.value =
                  //     attitudePublic.value;
                },
                value: attitudeJouerA.value,
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
            "Comportement equipe B",
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
                  // attitudeJouerB.value = e as int;
                  // //
                  // arbitreController.comportementEquipeB.value =
                  //     etats[attitudePublic.value];
                  // arbitreController.indexComportementEquipeB.value =
                  //     attitudePublic.value;
                },
                value: attitudeJouerB.value,
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
            "Comportement public A",
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
                  // attitudePublic.value = e as int;
                  // //
                  // arbitreController.comportementPubliqueEquipeA.value =
                  //     etats[attitudePublic.value];
                  // arbitreController.indexComportementPubliqueEquipeB.value =
                  //     attitudePublic.value;
                },
                value: attitudePublic.value,
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
            "Comportement public B",
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
                  // attitudePublic.value = e as int;
                  // //
                  // arbitreController.comportementPubliqueEquipeB.value =
                  //     etats[attitudePublic.value];
                  // arbitreController.indexComportementPubliqueEquipeB.value =
                  //     attitudePublic.value;
                },
                value: attitudePublic.value,
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
                      // etatTerrain.value = e as int;
                      // //
                      // arbitreController.etatsTerrainListe.add(etatsTI[e]);
                    },
                    isExpanded: true,
                    value: etatTerrain.value,
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
                    arbitreController.etatsTerrainListe.length,
                    (index) {
                      //
                      String e = arbitreController.etatsTerrainListe[index];
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
                        //     arbitreController.etatsTerrainListe.removeAt(index);
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
                      // etatInstallation.value = e as int;
                      // arbitreController.etatsInstallationListe.add(etatsTI[e]);
                    },
                    isExpanded: true,
                    value: etatInstallation.value,
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
                    arbitreController.etatsInstallationListe.length,
                    (index) {
                      //
                      String e =
                          arbitreController.etatsInstallationListe[index];
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
                        //     arbitreController.etatsInstallationListe
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
