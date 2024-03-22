import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/joueurs/nouveau_joueur.dart';
import 'package:linafoot_admin/pages/stade/stade_controller.dart';
import 'package:linafoot_admin/utils/Loader.dart';
import 'package:linafoot_admin/utils/requete.dart';

import 'details_stade.dart';
import 'nouveau_stade.dart';

class Stade extends GetView<StadeController> {
  //
  Stade() {
    //
    Timer(const Duration(seconds: 1), () {
      //
      controller.getAllStades();
    });
  }

  //
  RxMap joueur_ = {}.obs;
  //

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
              //         actions: [
              //           IconButton(
              //             onPressed: () async {
              //               //
              //               //
              //               //
              //               FilePickerResult? result =
              //                   await FilePicker.platform.pickFiles(
              //                 dialogTitle: "Fichier CSV de la commande",
              //                 type: FileType.custom,
              //                 allowedExtensions: ["CSV", "csv"],
              //               );
              //               //
              //               if (result != null) {
              //                 //fl = result;
              //                 File file = File(result.files.single.path!);
              //                 // rowsAsListOfValues = await file
              //                 //     .openRead()
              //                 //     .transform(utf8.decoder)
              //                 //     .transform(CsvToListConverter())
              //                 //     .toList();
              //                 //
              //                 //filename.value = result.names[0]!;
              //                 //
              //                 //print('fields: $rowsAsListOfValues');
              //                 //
              //                 List<String> l = file.readAsLinesSync(); //.split("\n");
              //                 l.removeAt(0);
              //                 //
              //                 List lx = [];
              //                 //
              //                 l.forEach((e) async {
              //                   List x = e.split(";");
              //                   // es.forEach((x) {
              //                   //   //
              //                   // });
              //                   //
              //                   /*
              //     public String region;
              // public String viller;
              // public String nom;
              // public int nombrePlacePourtoure;
              // public int nombrePlaceTribuneLateralle;
              // public int nombrePlaceTribuneDhonneur;
              // public int nombrePlaceTribuneCentrale;
              // public int vip;
              // public int capaciteStade;
              //                         */
              //                   if (x.length > 8) {
              //                     print("es:::: -- -- $x -- -- ");
              //                     print(
              //                         "es:::: -- ${x[0]} -- ${x[1]} -- ${x[2]} -- ${x[3]} -- ${x[4]} -- ${x[5]} -- -- ");
              //                     Map j = {
              //                       "region": "${x[0]}",
              //                       "ville": "${x[1]}",
              //                       "nom": "${x[2]}",
              //                       "nombrePlacePourtoure": "${x[3]}",
              //                       "nombrePlaceTribuneLateralle": "${x[4]}",
              //                       "nombrePlaceTribuneDhonneur": "${x[5]}",
              //                       "nombrePlaceTribuneCentrale": "${x[6]}",
              //                       "vip": "${x[7]}",
              //                       "capaciteStade": "${x[8]}",
              //                     };
              //                     String rep = await controller.saveStade2(j);
              //                     print(rep);
              //                     //lx.add(j);
              //                     print("_");
              //                     //rowsAsListOfValues.add(es);
              //                     //
              //                   }
              //                 });
              //                 //saveall
              //                 //equipeController.saveEquipe2(lx);
              //                 //
              //                 //rowsAsListOfValues.value = const CsvToListConverter().convert(data);
              //                 //
              //                 // print("dataa: ${l.length}");
              //                 // print("data: ${rowsAsListOfValues.length}");
              //                 // //
              //                 // final input = File(fichier).openRead();
              //               } else {
              //                 // User canceled the picker
              //               }
              //             },
              //             icon: Icon(Icons.add),
              //           ),
              //         ],
              ),
          body: controller.obx(
            (state) {
              RxList joueurs = RxList(state as List);
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
                        children: List.generate(joueurs.length, (index) {
                          //
                          Map stade = joueurs[index];
                          print(stade);
                          //
                          if ("${stade['nom']}".contains(mot.value)) {
                            //
                            return ListTile(
                              onTap: () {
                                //
                                joueur_.value = stade;
                                Get.to(DetailsStade(stade));
                                //Get.to(DetailsEquipe(equipe));
                                //
                              },
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  // image: DecorationImage(
                                  //   image: NetworkImage(
                                  //       "${Requete.url}/joueur/profile/${stade['id']}"),
                                  //   fit: BoxFit.contain,
                                  // ),
                                ),
                                child: SvgPicture.asset(
                                  "assets/F7Sportscourt.svg",
                                  colorFilter: const ColorFilter.mode(
                                      Colors.blue, BlendMode.srcIn),
                                  semanticsLabel: stade["nom"],
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              title: Text("${stade['nom']}"),
                              subtitle: Text("${stade['region']}"),
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
              return const Center(
                child: Text(
                    "Une erreur c'est produite lors du chargement des informations"),
              );
            },
            onLoading: Loader.loadingW(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //
              Get.to(NouveauStade());
              //
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
