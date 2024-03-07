import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/utils/requete.dart';

class CalendrierController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  Future<void> getAllEquipes() async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.getE("calendrier/All");
    //
    if (response.isOk) {
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      //
      change(response.body, status: RxStatus.success());
    } else {
      //
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      change([], status: RxStatus.empty());
    }
  }

  //
  //
  Future<void> saveEquipe(Map equipe) async {
    //
    Response response = await requete.postE("calendrier", equipe);
    //
    if (response.isOk) {
      //
      Get.back();
      getAllEquipes();
      Get.snackbar("Succès", "L'enregistrement a abouti",
          backgroundColor: Colors.green);
    } else {
      //
      Get.back();
      getAllEquipes();
      Get.snackbar("Oups erreur",
          "L'enregistrement n'a pas abouti code: ${response.statusCode}");
    }
  }

  //
  Future<void> updateEquipe(Map equipe) async {
    //
    Response response = await requete.putE("calendrier", equipe);
    //
    if (response.isOk) {
      //
      print("rep: ${response.body}");
      Get.back();
      getAllEquipes();
      Get.snackbar("Succès", "Mise à jour éffectué",
          backgroundColor: Colors.green);
    } else {
      //
      Get.back();
      getAllEquipes();
      Get.snackbar("Oups erreur",
          "Une erreur lors de la Mise à jour, code: ${response.statusCode}");
    }
  }
}
