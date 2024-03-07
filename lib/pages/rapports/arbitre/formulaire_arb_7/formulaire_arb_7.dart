import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot_admin/pages/rapports/arbitre/arbitre_controller.dart';
import 'package:linafoot_admin/utils/Loader.dart';

class FormulaireArb7 extends StatelessWidget {
  //
  int local;
  //
  var box = GetStorage();
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
  Map match;
  //
  RxString date = "".obs;
  RxString heure = "".obs;
  //
  FormulaireArb7(this.controller, this.match, this.local);

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
            "Observation eventuelles",
            style: textStyle,
          ),
        ),
        Container(
          //height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: TextField(
            maxLines: 10,
            controller: arbitreController.observationEventuelle.value,
            decoration: InputDecoration(
              hintText:
                  "Mentionner si le match a commencé à l'heure, dans la cas contraire, indiquer le nombre de minutes de retard et la cause.",
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
            "Incidents",
            style: textStyle,
          ),
        ),
        Container(
          //height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: TextField(
            maxLines: 10,
            controller: arbitreController.incident.value,
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
            "Observation",
            style: textStyle,
          ),
        ),
        Container(
          //height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: TextField(
            maxLines: 10,
            controller: arbitreController.observation.value,
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
            "Reserves",
            style: textStyle,
          ),
        ),
        Container(
          //height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: TextField(
            maxLines: 10,
            controller: arbitreController.reserves.value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        // const SizedBox(
        //   height: 10,
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
        //         Get.dialog(
        //           Center(
        //             child: Card(
        //               elevation: 1,
        //               child: SizedBox(
        //                 height: 100,
        //                 width: 200,
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     const Align(
        //                       alignment: Alignment.center,
        //                       child: Text(
        //                         "Enregistrer le rapport de ce match en local ?",
        //                         textAlign: TextAlign.center,
        //                       ),
        //                     ),
        //                     const SizedBox(
        //                       height: 5,
        //                     ),
        //                     ElevatedButton(
        //                       onPressed: () {
        //                         //
        //                         Get.back();
        //                         Loader.loading();
        //                         //
        //                         if (local == 2) {
        //                           //Pour le commissaire...
        //                           //match['idMatch'] = match['id'];
        //                           //match['typeRapport'] = 1;
        //                           //
        //                           Map rap = {
        //                             "idMatch": match['match'],
        //                             "typeRapport": 1,
        //                             "date": match['date'],
        //                             "commissaire": match['commissaire'],
        //                             "heure": match['heure'],
        //                             "categorie": match['categorie'],
        //                             "terrainNeutre": false,
        //                             "arbitreAssitant1":
        //                                 match['arbitreAssitant1'],
        //                             "match": match['match'],
        //                             "journee": match['journee'],
        //                             "arbitreAssitant2":
        //                                 match['arbitreAssitant2'],
        //                             "stade": match['stade'],
        //                             "arbitreCentrale": match['arbitreCentrale'],
        //                             "arbitreProtocolaire":
        //                                 match['arbitreProtocolaire'],
        //                             "saison": "",
        //                             "idCalendrier": match['idCalendrier'],
        //                             "quiRecoit": match['quiRecoit'],
        //                             "idEquipeB": match['idEquipeB'],
        //                             "officierRapporteur":
        //                                 match['officierRapporteur'],
        //                             "idEquipeA": match['idEquipeA'],
        //                             "nomEquipeA": match['nomEquipeA'],
        //                             "nombreDePlaces": match['nombreDePlaces'],
        //                             "nomEquipeB": match['nomEquipeB'],
        //                             "jouer": true,
        //                             "rapport": {
        //                               "heure": arbitreController.heure.value,
        //                               "date": arbitreController.date.value,
        //                               "stade": arbitreController.stade.value,
        //                               "equipeA":
        //                                   arbitreController.equipeA.value,
        //                               "equipeB":
        //                                   arbitreController.equipeB.value,
        //                               "resultatMitemps": arbitreController
        //                                   .resultatMitemps.value,
        //                               "resultatFinal":
        //                                   arbitreController.resultatFinal.value,
        //                               "arbitreCentral": arbitreController
        //                                   .arbitreCentral.value,
        //                               "arbitreAssistant1": arbitreController
        //                                   .arbitreAssistant1.value,
        //                               "arbitreAssistant2": arbitreController
        //                                   .arbitreAssistant2.value,
        //                               "arbitreProtocolaire": arbitreController
        //                                   .arbitreProtocolaire.value,
        //                               //__________________________________________
        //                               "meteo": arbitreController
        //                                   .arbitreProtocolaire.value,
        //                               //
        //                               "comportementEquipeA": arbitreController
        //                                   .comportementEquipeA.value,
        //                               //
        //                               "comportementPubliqueEquipeA":
        //                                   arbitreController
        //                                       .comportementPubliqueEquipeA
        //                                       .value,
        //                               //
        //                               "comportementPubliqueEquipeB":
        //                                   arbitreController
        //                                       .comportementPubliqueEquipeB
        //                                       .value,
        //                               //
        //                               "etatInstallation": arbitreController
        //                                   .etatInstallation.value,
        //                               //
        //                               "etatsInstallationListe":
        //                                   arbitreController
        //                                       .etatsInstallationListe.value,
        //                               //
        //                               "etatTerrain":
        //                                   arbitreController.etatTerrain.value,
        //                               //
        //                               "etatsTerrainListe": arbitreController
        //                                   .etatsTerrainListe.value,
        //                               //
        //                               //__________________________________________
        //                               "joueurEqupeA":
        //                                   arbitreController.joueurEqupeA.value,
        //                               //
        //                               "joueurEquipeRemplacantA":
        //                                   arbitreController
        //                                       .joueurEquipeRemplacantA.value,
        //                               //
        //                               "joueurRemplacantA": arbitreController
        //                                   .joueurRemplacantA.value,
        //                               //
        //                               "joueurRemplacantB": arbitreController
        //                                   .joueurRemplacantB.value,
        //                               //
        //                               "joueurEqupeB":
        //                                   arbitreController.joueurEqupeB.value,
        //                               //
        //                               "joueurEquipeRemplacantB":
        //                                   arbitreController
        //                                       .joueurEquipeRemplacantB.value,
        //                               //
        //                               //__________________________________________
        //                               "scoreMitemps":
        //                                   arbitreController.scoreMitemps,
        //                               "scoreFin": arbitreController.scoreFin,
        //                               //
        //                               "avertissementsJoueursGeneralA":
        //                                   arbitreController
        //                                       .avertissementsJoueursGeneralA
        //                                       .value,
        //                               "expulssionsJoueursGeneralA":
        //                                   arbitreController
        //                                       .expulssionsJoueursGeneralA.value,
        //                               "butsJoueursGeneralA": arbitreController
        //                                   .butsJoueursGeneralA.value,
        //                               //
        //                               "avertissementsJoueursGeneralB":
        //                                   arbitreController
        //                                       .avertissementsJoueursGeneralB
        //                                       .value,
        //                               "expulssionsJoueursGeneralB":
        //                                   arbitreController
        //                                       .expulssionsJoueursGeneralB.value,
        //                               //
        //                               "butsJoueursGeneralB": arbitreController
        //                                   .butsJoueursGeneralB.value,
        //                               //__________________________________________
        //                               //arbitreController.officierEquipeA
        //                               "officierEquipeA": arbitreController
        //                                   .officierEquipeA.value,
        //                               //
        //                               "officierEquipeB": arbitreController
        //                                   .officierEquipeB.value,
        //                               //__________________________________________
        //                               //
        //                               "observationEventuelle": arbitreController
        //                                   .observationEventuelle.value.text,
        //                               //
        //                               "observation": arbitreController
        //                                   .observation.value.text,
        //                               //
        //                               "reserves":
        //                                   arbitreController.reserves.value.text,
        //                               //
        //                               "incident":
        //                                   arbitreController.incident.value.text,
        //                             }
        //                           };
        //                           //
        //                           //
        //                           arbitreController.envoyerRapport(rap);
        //                         } else {
        //                           //
        //                           match['rapport'] = {
        //                             "heure": arbitreController.heure.value,
        //                             "date": arbitreController.date.value,
        //                             "stade": arbitreController.stade.value,
        //                             "equipeA": arbitreController.equipeA.value,
        //                             "equipeB": arbitreController.equipeB.value,
        //                             "resultatMitemps":
        //                                 arbitreController.resultatMitemps.value,
        //                             "resultatFinal":
        //                                 arbitreController.resultatFinal.value,
        //                             "arbitreCentral":
        //                                 arbitreController.arbitreCentral.value,
        //                             "arbitreAssistant1": arbitreController
        //                                 .arbitreAssistant1.value,
        //                             "arbitreAssistant2": arbitreController
        //                                 .arbitreAssistant2.value,
        //                             "arbitreProtocolaire": arbitreController
        //                                 .arbitreProtocolaire.value,
        //                             //__________________________________________
        //                             "meteo": arbitreController
        //                                 .arbitreProtocolaire.value,
        //                             //
        //                             "comportementEquipeA": arbitreController
        //                                 .comportementEquipeA.value,
        //                             //
        //                             "comportementPubliqueEquipeA":
        //                                 arbitreController
        //                                     .comportementPubliqueEquipeA.value,
        //                             //
        //                             "comportementPubliqueEquipeB":
        //                                 arbitreController
        //                                     .comportementPubliqueEquipeB.value,
        //                             //
        //                             "etatInstallation": arbitreController
        //                                 .etatInstallation.value,
        //                             //
        //                             "etatsInstallationListe": arbitreController
        //                                 .etatsInstallationListe.value,
        //                             //
        //                             "etatTerrain":
        //                                 arbitreController.etatTerrain.value,
        //                             //
        //                             "etatsTerrainListe": arbitreController
        //                                 .etatsTerrainListe.value,
        //                             //
        //                             //__________________________________________
        //                             "joueurEqupeA":
        //                                 arbitreController.joueurEqupeA.value,
        //                             //
        //                             "joueurEquipeRemplacantA": arbitreController
        //                                 .joueurEquipeRemplacantA.value,
        //                             //
        //                             "joueurRemplacantA": arbitreController
        //                                 .joueurRemplacantA.value,
        //                             //
        //                             "joueurRemplacantB": arbitreController
        //                                 .joueurRemplacantB.value,
        //                             //
        //                             "joueurEqupeB":
        //                                 arbitreController.joueurEqupeB.value,
        //                             //
        //                             "joueurEquipeRemplacantB": arbitreController
        //                                 .joueurEquipeRemplacantB.value,
        //                             //
        //                             //__________________________________________
        //                             "scoreMitemps":
        //                                 arbitreController.scoreMitemps,
        //                             "scoreFin": arbitreController.scoreFin,
        //                             //
        //                             "avertissementsJoueursGeneralA":
        //                                 arbitreController
        //                                     .avertissementsJoueursGeneralA
        //                                     .value,
        //                             "expulssionsJoueursGeneralA":
        //                                 arbitreController
        //                                     .expulssionsJoueursGeneralA.value,
        //                             "butsJoueursGeneralA": arbitreController
        //                                 .butsJoueursGeneralA.value,
        //                             //
        //                             "avertissementsJoueursGeneralB":
        //                                 arbitreController
        //                                     .avertissementsJoueursGeneralB
        //                                     .value,
        //                             "expulssionsJoueursGeneralB":
        //                                 arbitreController
        //                                     .expulssionsJoueursGeneralB.value,
        //                             //
        //                             "butsJoueursGeneralB": arbitreController
        //                                 .butsJoueursGeneralB.value,
        //                             //__________________________________________
        //                             //arbitreController.officierEquipeA
        //                             "officierEquipeA":
        //                                 arbitreController.officierEquipeA.value,
        //                             //
        //                             "officierEquipeB":
        //                                 arbitreController.officierEquipeB.value,
        //                             //__________________________________________
        //                             //
        //                             "observationEventuelle": arbitreController
        //                                 .observationEventuelle.value.text,
        //                             //
        //                             "observation": arbitreController
        //                                 .observation.value.text,
        //                             //
        //                             "reserves":
        //                                 arbitreController.reserves.value.text,
        //                             //
        //                             "incident":
        //                                 arbitreController.incident.value.text,
        //                           };
        //                           //
        //                           match['jouer'] = true;
        //                           //
        //                           box.write("rapport${match['match']}", match);
        //                           //
        //                           Get.offAll(Accueil());
        //                           Get.snackbar(
        //                             "Rapport",
        //                             "Votre rapport a été enregistré en local",
        //                             backgroundColor: Colors.green,
        //                             colorText: Colors.white,
        //                           );
        //                           Get.back();
        //                         }
        //                         //
        //                       },
        //                       child: local == 2
        //                           ? const Text("Enoyer le rapport")
        //                           : const Text("Enregistrer"),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //         );
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
        //         child: local == 2
        //             ? const Text(
        //                 "Envoyer",
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                 ),
        //               )
        //             : const Text(
        //                 "Enregistrer",
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                 ),
        //               ),
        //       ),
        //     ),
        //   ],
        // ),

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
