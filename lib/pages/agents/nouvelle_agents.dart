import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/joueurs/joueur_controller.dart';
import 'package:linafoot_admin/pages/stade/stade_controller.dart';
import 'package:linafoot_admin/utils/Loader.dart';

import 'agents_controller.dart';

class NouveauAgent extends StatelessWidget {
  //
  AgentsController agentsController = Get.find();
  //
  TextEditingController nom = TextEditingController();
  TextEditingController postnom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController telephone = TextEditingController();

  //

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouveau Stade"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          width: 500,
          child: ListView(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Nom",
                  style: textStyle,
                ),
              ),
              SizedBox(
                height: 55,
                child: TextField(
                  controller: nom,
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
                  "Postnom",
                  style: textStyle,
                ),
              ),
              SizedBox(
                height: 55,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(
                //     color: Colors.grey.shade600,
                //   ),
                // ),
                child: TextField(
                  controller: postnom,
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
                  "Prenom",
                  style: textStyle,
                ),
              ),
              SizedBox(
                height: 55,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(
                //     color: Colors.grey.shade600,
                //   ),
                // ),
                child: TextField(
                  controller: prenom,
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
                  "Téléphone",
                  style: textStyle,
                ),
              ),
              SizedBox(
                height: 55,
                child: TextField(
                  controller: telephone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              //
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  //
                  Loader.loading();
                  /**
                  public String region;
    public String viller;
    public String stade;
    public int nombrePlacePourtoure;
    public int nombrePlaceTribuneLateralle;
    public int nombrePlaceTribuneDhonneur;
    public int nombrePlaceTribuneCentrale;
    public int vip;
    public int capaciteStade;
                   */
                  //
                  Map ag = {
                    "nom": nom.text,
                    "postnom": postnom.text,
                    "prenom": prenom.text,
                    "telephone": telephone.text,
                    "mdp": mdpGenerer(),
                  };
                  //
                  agentsController.saveAgent(ag);
                  //
                  //joueurController.saveJoueur(joueur, equipe['id']);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Enregistrer"),
                  height: 50,
                  width: double.maxFinite,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
  //
  String mdpGenerer() {
    //
    var r = Random();
    //
    String mdp = "";
    for (int t = 0; t < 9; t++) {
      mdp = "$mdp${r.nextInt(10)}";
    }
    return mdp;
  }
}
