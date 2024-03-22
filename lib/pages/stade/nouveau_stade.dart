import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linafoot_admin/pages/equipes/equipe_controller.dart';
import 'package:linafoot_admin/pages/joueurs/joueur_controller.dart';
import 'package:linafoot_admin/pages/stade/stade_controller.dart';
import 'package:linafoot_admin/utils/Loader.dart';

class NouveauStade extends StatelessWidget {
  //
  //NouveauStade();
  /**
   * public String region;
    public String viller;
    public String nom;
    public int nombrePlacePourtoure;
    public int nombrePlaceTribuneLateralle;
    public int nombrePlaceTribuneDhonneur;
    public int nombrePlaceTribuneCentrale;
    public int vip;
    public int capaciteStade;
   */
  //
  JoueurController joueurController = Get.find();
  //
  StadeController stadeController = Get.find();
  //
  TextEditingController region = TextEditingController();
  TextEditingController viller = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController nombrePlacePourtoure = TextEditingController();
  TextEditingController nombrePlaceTribuneLateralle = TextEditingController();
  TextEditingController nombrePlaceTribuneDhonneur = TextEditingController();
  TextEditingController nombrePlaceTribuneCentrale = TextEditingController();
  TextEditingController vip = TextEditingController();
  TextEditingController capaciteStade = TextEditingController();

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
                  "Region",
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
                  controller: region,
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
                  "Ville",
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
                  controller: viller,
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
                  "Nombre Place Pourtoure",
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
                  controller: nombrePlacePourtoure,
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
                  "Nombre Place Tribune Lateralle",
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
                  controller: nombrePlaceTribuneLateralle,
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
                  "Nombre Place Tribune d'honneur",
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
                  controller: nombrePlaceTribuneDhonneur,
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
                  "Nombre Place Tribune Centrale",
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
                  controller: nombrePlaceTribuneCentrale,
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
                  "V.I.P",
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
                  controller: vip,
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
                  "Capacite Stade",
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
                  controller: capaciteStade,
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
                  Map st = {
                    "region": region.text,
                    "viller": viller.text,
                    "nom": nom.text,
                    "nombrePlacePourtoure": nombrePlacePourtoure.text,
                    "nombrePlaceTribuneLateralle":
                        nombrePlaceTribuneLateralle.text,
                    "nombrePlaceTribuneDhonneur":
                        nombrePlaceTribuneDhonneur.text,
                    "nombrePlaceTribuneCentrale":
                        nombrePlaceTribuneCentrale.text,
                    "capaciteStade": capaciteStade.text,
                    //"idEquipe": equipe['id'],
                  };
                  //
                  stadeController.saveStade(st);
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
}
