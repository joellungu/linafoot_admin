import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/equipes/equipe_controller.dart';
import 'package:linafoot_admin/utils/Loader.dart';
import 'package:linafoot_admin/utils/requete.dart';

import 'details_equipe.dart';
import 'nouvelle_equipe.dart';

class Equipes extends GetView<EquipeController> {
  //
  Equipes() {
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
              //                 l.forEach((e) {
              //                   List x = e.split(",");
              //                   // es.forEach((x) {
              //                   //   //
              //                   // });
              //                   //
              //                   /*
              //           public String nom;
              // public String abrev;
              // public String province;
              // public byte[] logo;
              // public String dateCreation;
              // public String division;
              //           */
              //                   print(
              //                       "es: ${x[1]} -- ${x[2]} -- ${x[3]} -- ${x[4]} -- ${x[5]} = ${double.parse("${x[5] == '' || x[5] == null ? '1.0' : x[5]}".replaceAll(",", "."))} : -- ${x[6]} -- ${x[7]} -- ");
              //                   Map p = {
              //                     "nom": "${x[1]}",
              //                     "code": "${x[2]}",
              //                     "prixUSD": double.parse(
              //                         "${x[5] == '' || x[5] == null ? 0 : x[5]}"
              //                             .replaceAll(",", ".")),
              //                     "prixCDF": double.parse(
              //                         "${x[6] == '' || x[6] == null ? 0 : x[6]}"
              //                             .replaceAll(",", ".")),
              //                     //"quantite":"${x[1]}",
              //                     "taille": "${x[3]}",
              //                   };
              //                   lx.add(p);
              //                   //
              //                   print("_");
              //                   //rowsAsListOfValues.add(es);
              //                   //
              //                 });
              //                 //
              //                 //controller.saveEquipe2(lx);
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
              //               //
              //             },
              //             icon: Icon(Icons.add),
              //           ),
              //         ],
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
                          //
                          if ("${equipe['nom']}".contains(mot.value)) {
                            //
                            return ListTile(
                              onTap: () {
                                //
                                Get.to(DetailsEquipe(equipe));
                                //
                              },
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${Requete.url}/equipe/logo/${equipe['id']}"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              title: Text("${equipe['nom']}"),
                              subtitle: Text("${equipe['province']}"),
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
              Get.to(NouvelleEquipe());
              //
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
