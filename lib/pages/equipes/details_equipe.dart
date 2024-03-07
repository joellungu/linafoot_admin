import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/equipes/equipe_controller.dart';
import 'package:linafoot_admin/pages/joueurs/joueurs.dart';
import 'package:linafoot_admin/utils/Loader.dart';
import 'package:linafoot_admin/utils/requete.dart';
import 'package:linafoot_admin/utils/utils.dart';

class DetailsEquipe extends StatelessWidget {
  //
  Map equipe;
  //
  EquipeController equipeController = Get.find();
  //
  DetailsEquipe(this.equipe);
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(equipe['nom']),
        centerTitle: true,
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
