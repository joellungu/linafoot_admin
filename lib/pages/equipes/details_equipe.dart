import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/equipes/equipe_controller.dart';
import 'package:linafoot_admin/pages/joueurs/joueur_controller.dart';
import 'package:linafoot_admin/pages/joueurs/joueurs.dart';
import 'package:linafoot_admin/utils/Loader.dart';
import 'package:linafoot_admin/utils/requete.dart';
import 'package:linafoot_admin/utils/utils.dart';

class DetailsEquipe extends StatelessWidget {
  //
  Map equipe;
  //
  JoueurController joueurController = Get.find();
  //
  EquipeController equipeController = Get.find();
  //
  DetailsEquipe(this.equipe) {
    //
    print("id: ${equipe['id']}");
  }
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(equipe['nom']),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: () async {
        //       //
        //       //
        //       //
        //       FilePickerResult? result = await FilePicker.platform.pickFiles(
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
        //         l.forEach((e) async {
        //           List x = e.split(";");
        //           // es.forEach((x) {
        //           //   //
        //           // });
        //           //
        //           /*public Long idEquipe;
        // public byte[] photo;
        // public boolean asPhoto;
        // public String nom;
        // public String postnom;
        // public String prenom;
        // public String dateNaissance;
        // public String licence;
        // public String numero; joueurequipe
        //                     */
        //           print(
        //               "es:::: ${equipe['id']} -- ${x[0]} -- ${x[2]} -- ${x[1]} -- -- ");
        //           Map j = {
        //             "idEquipe": equipe['id'],
        //             "nom": "${x[0]}",
        //             "postnom": "",
        //             "prenom": "",
        //             "dateNaissance": "",
        //             "licence": "${x[2]}",
        //             "numero": "${x[1]}",
        //           };
        //           String rep =
        //               await joueurController.saveJoueur2(j, equipe['id']);
        //           // print(rep);
        //           //lx.add(j);
        //           print("_");
        //           //rowsAsListOfValues.add(es);
        //           //
        //         });
        //         //saveall
        //         //equipeController.saveEquipe2(lx);
        //         //
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
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: ListView(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: NetworkImage(
                            "${Requete.url}/equipe/logo/${equipe['id']}"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      //
                      //
                      var text = TextEditingController();
                      //
                      Utils.modifierInfo(equipe, context, text, "nom", 1);
                      //
                    },
                    title: Text("Nom"),
                    subtitle: Text("${equipe['nom']}"),
                    trailing: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      //
                      //
                      var text = TextEditingController();
                      //
                      Utils.modifierInfo(equipe, context, text, "province", 1);
                      //
                    },
                    title: Text("Province"),
                    subtitle: Text("${equipe['province']}"),
                    trailing: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      //
                      //
                      var text = TextEditingController();
                      //
                      Utils.modifierInfo(
                          equipe, context, text, "dateCreation", 1);
                      //
                    },
                    title: Text("Date de création"),
                    subtitle: Text("${equipe['dateCreation']}"),
                    trailing: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      //
                      var text = TextEditingController();
                      //
                      Utils.modifierInfo(equipe, context, text, "division", 1);
                      //
                    },
                    title: Text("Division"),
                    subtitle: Text("${equipe['division']}"),
                    trailing: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Joueurs(equipe),
            ),
          ],
        ),
      ),
    );
  }

  //
}
