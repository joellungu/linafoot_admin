import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/arbitres/arbitre_controller.dart';
import 'package:linafoot_admin/pages/commissaires/commissaire_controller.dart';
import 'package:linafoot_admin/pages/equipes/equipe_controller.dart';
import 'package:linafoot_admin/pages/joueurs/joueur_controller.dart';

import 'Loader.dart';

class Utils {
  //
  static modifierInfo(Map e, BuildContext context, TextEditingController text,
      String nom, int control) async {
    //
    EquipeController equipeController = Get.find();
    JoueurController joueurController = Get.find();
    CommissaireController commissaireController = Get.find();
    ArbitreController arbitreController = Get.find();
    //
    text.text = e[nom];
    final formKey = GlobalKey<FormState>();
    //
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text(nom.capitalize!),
          contentPadding: const EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 250,
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: nom),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez saisir $nom";
                        }
                      },
                    ),
                    InkWell(
                      onTap: () async {
                        Loader.loading();
                        //
                        e[nom] = text.text;
                        if (control == 1) {
                          equipeController.updateEquipe(e);
                        } else if (control == 2) {
                          joueurController.updateEquipe(e, e['id']);
                        } else if (control == 3) {
                          commissaireController.updateEquipe(e);
                        } else {
                          arbitreController.updateEquipe(e);
                        }
                        //
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 2,
                        ),
                        child: Text(
                          "Enregistrer",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade900,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
