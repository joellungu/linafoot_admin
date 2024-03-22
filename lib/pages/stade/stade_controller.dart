import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/utils/requete.dart';

class StadeController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  Future<void> getAllStades() async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.getE("stade/all");
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
  Future<List> getAllStades2() async {
    //
    Response response = await requete.getE("stade/all");
    //
    if (response.isOk) {
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      //
      return response.body;
    } else {
      //
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      return [];
    }
  }

  //
  Future<void> saveStade(Map equipe) async {
    //
    Response response = await requete.postE("stade", equipe);
    //
    if (response.isOk) {
      //
      Get.back();
      getAllStades();
      Get.snackbar("Succès", "L'enregistrement a abouti",
          backgroundColor: Colors.green);
    } else {
      //
      Get.back();
      getAllStades();
      Get.snackbar("Oups erreur",
          "L'enregistrement n'a pas abouti code: ${response.statusCode}");
    }
  }

  Future<void> updateStade(Map equipe) async {
    //
    Response response = await requete.putE("stade", equipe);
    //
    if (response.isOk) {
      //
      Get.back();
      getAllStades();
      Get.snackbar("Succès", "L'enregistrement a abouti",
          backgroundColor: Colors.green);
    } else {
      //
      Get.back();
      getAllStades();
      Get.snackbar("Oups erreur",
          "L'enregistrement n'a pas abouti code: ${response.statusCode}");
    }
  }

  //
  Future<String> saveStade2(Map equipe) async {
    //
    Response response = await requete.postE("stade", equipe);
    //
    if (response.isOk) {
      //
      Get.back();
      getAllStades();
      // Get.snackbar("Succès", "L'enregistrement a abouti",
      //     backgroundColor: Colors.green);
      return "Cool";
    } else {
      //
      Get.back();
      getAllStades();
      // Get.snackbar("Oups erreur",
      //     "L'enregistrement n'a pas abouti code: ${response.statusCode}");
      return "Pas cool";
    }
  }
}
