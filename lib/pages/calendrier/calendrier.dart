import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/utils/Loader.dart';
import 'package:linafoot_admin/utils/requete.dart';

import 'calendrier_controller.dart';
import 'details_calendrier.dart';
import 'matchs/match_controller.dart';
import 'nouveau_calendrier.dart';

class Calendrier extends GetView<CalendrierController> {
  //
  MatchController matchController = Get.find();
  //
  Calendrier() {
    //
    controller.getAllEquipes();
  }

  //
  /*
  RxList equipes = [
    {
      "nom": "Tout puissant Mazembe Englebert",
      "province": "Lubumbashi",
      "categorie": ""
    },
    {"nom": "FC Saint-Éloi Lupopo", "province": "Lubumbashi", "categorie": ""},
    {"nom": "FC Lubumbashi sport", "province": "Lubumbashi", "categorie": ""},
    {"nom": "CS Don Bosco", "province": "Lubumbashi", "categorie": ""},
    {
      "nom": "As Maniema Union de Kindu",
      "province": "Maniema",
      "categorie": ""
    },
    {
      "nom": "As Dauphin noir de Goma",
      "province": "Nord Kiva",
      "categorie": ""
    },
    {"nom": "As Vita club", "province": "Kinshasa", "categorie": ""},
    // {
    //   "nom": "Dc Motema Pembe de Kinshasa",
    //   "province": "Kinshasa",
    //   "categorie": ""
    // },
    {"nom": "LES AIGLES DU CONGO", "province": "Kinshasa", "categorie": ""},
    //{"nom": "FC LUBUMBASHI SPORT", "province": "Mbuji-Mayi", "categorie": ""},
  ].obs;
  */
  //
  RxString mot = "".obs;

  @override
  Widget build(BuildContext context) {
    //
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        width: 500,
        child: Scaffold(
          appBar: AppBar(
              // actions: [
              //   IconButton(
              //     onPressed: () async {
              //       //
              //       //
              //       //
              //       FilePickerResult? result =
              //           await FilePicker.platform.pickFiles(
              //         dialogTitle: "Fichier CSV de la commande",
              //         type: FileType.custom,
              //         allowedExtensions: ["CSV", "csv"],
              //       );
              //       //
              //       if (result != null) {
              //         //fl = result;
              //         File file = File(result.files.single.path!);
              //         // rowsAsListOfValues = await file
              //         //     .openRead()
              //         //     .transform(utf8.decoder)
              //         //     .transform(CsvToListConverter())
              //         //     .toList();
              //         //
              //         //filename.value = result.names[0]!;
              //         //
              //         //print('fields: $rowsAsListOfValues');
              //         //
              //         List<String> l = file.readAsLinesSync(); //.split("\n");
              //         l.removeAt(0);
              //         //
              //         List lx = [];
              //         //
              //         l.forEach((ee) {
              //           List x = ee.split(";");
              //           // es.forEach((x) {
              //           //   //
              //           // });
              //           //
              //           /*public Long idEquipe;
              //   public byte[] photo;
              //   public boolean asPhoto;
              //   public String nom;
              //   public String postnom;
              //   public String prenom;
              //   public String dateNaissance;
              //   public String licence;
              //   public String numero; joueurequipe
              //                       */
              //           print('es:::: -- $x --');
              //           print(
              //               "es:::: -- ${x[0]} -- ${x[1]} -- ${x[2]} -- ${x[3]} -- ${x[4]} -- ${x[5]} -- ${x[6]} -- ${x[7]} -- ${x[8]} --journee: ${x[9]} -- ");
              //           List d = "${x[5]}".split("/");
              //           Map e = {
              //             "idCalendrier": 1,
              //             "idEquipeA": "${x[0]}",
              //             "nomEquipeA": "${x[1]}",
              //             "idEquipeB": "${x[3]}",
              //             "nomEquipeB": "${x[4]}",
              //             "stade": "${x[7]}",
              //             "terrainNeutre": "",
              //             "quiRecoit": "",
              //             "saison": "",
              //             "categorie": "playoff",
              //             "journee": "${x[9]}",
              //             "date": "${d[0]}-${d[1]}-${d[2]}",
              //             "heure": "${x[6]}",
              //             "commissaire": matchController.commissaire['id'],
              //             //"mdpCommissaire": mdpGenerer(),
              //             "arbitreCentrale":
              //                 matchController.arbitreCentrale['id'],
              //             //"mdpArbitreCentrale": mdpGenerer(),
              //             "arbitreAssitant1":
              //                 matchController.arbitreAssitant1['id'],
              //             "arbitreAssitant2":
              //                 matchController.arbitreAssitant2['id'],
              //             //""
              //             "arbitreProtocolaire":
              //                 matchController.arbitreProtocolaire['id'],
              //             //"mdpOfficier": mdpGenerer(),
              //             //"nombreDePlaces": place.value,
              //             "nombreDePlacesPourtour": "${x[10]}",
              //             "nombreDePlacesTribuneCentrale": "${x[16]}",
              //             "nombreDePlacesTribuneHonneur": "${x[14]}",
              //             "nombreDePlacesTribuneLateralle": "${x[12]}",
              //             "vip": "${x[18]}",
              //             //
              //             "prixPourtour": "${x[11]}",
              //             "prixTribuneCentrale": "${x[17]}",
              //             "prixTribuneHonneur": "${x[15]}",
              //             "prixTribuneLateralle": "${x[13]}",
              //             "prixVIP": "${x[19]}"
              //           };
              //           //
              //           //load(e);
              //           //Future.delayed(const Duration(seconds: 1), () {});
              //           lx.add(e);
              //           print("_");
              //           //rowsAsListOfValues.add(es);
              //           //
              //         });
              //         //saveall
              //         //equipeController.saveEquipe2(lx);
              //         //
              //         String rep = await matchController.saveMatch3(lx);
              //         print(rep);
              //         //rowsAsListOfValues.value = const CsvToListConverter().convert(data);
              //         //
              //         // print("dataa: ${l.length}");
              //         // print("data: ${rowsAsListOfValues.length}");
              //         // //
              //         // final input = File(fichier).openRead();
              //       } else {
              //         // User canceled the picker
              //       }
              //     },
              //     icon: Icon(Icons.add),
              //   ),
              // ],
              ),
          body: controller.obx(
            (state) {
              RxList equipes = RxList(state as List);
              return Column(
                children: [
                  Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      onChanged: (t) {
                        //
                        mot.value = t;
                        //
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Obx(
                      () => ListView(
                        children: List.generate(equipes.length, (index) {
                          //
                          Map equipe = equipes[index];
                          print(equipe);
                          //
                          if ("${equipe['label']}".contains(mot.value) ||
                              "${equipe['saison']}".contains(mot.value)) {
                            //
                            return ListTile(
                              onTap: () {
                                //
                                Get.to(DetailsCalendrier(equipe));
                                //
                              },
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: ExactAssetImage(
                                        "assets/mylinafoot.jpg"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              title: Text("${equipe['label']}"),
                              subtitle: Text("${equipe['saison']}"),
                            );
                          } else {
                            return Container();
                          }
                        }),
                      ),
                    ),
                  ),
                ],
              );
            },
            onEmpty: Container(),
            onError: (error) {
              return Center(
                child: Text(
                    "Une erreur c'est produite lors du chargement des informations"),
              );
            },
            onLoading: Loader.loadingW(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //
              Get.to(NouveauCalendrier());
              //
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  load(Map e) async {
    String rep = await matchController.saveMatch2(e);
    print(rep);
  }
}
