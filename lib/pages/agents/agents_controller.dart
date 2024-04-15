import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/utils/requete.dart';

class AgentsController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  Future<void> getAllAgents() async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete.getE("agent/all");
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
    Response response = await requete.getE("agent/all");
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
  Future<int> getCalendrier() async {
    //
    Response response = await requete.getE("calendrier/actuel");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      // change(response.body, status: RxStatus.success());
      return response.body;
    } else {
      //
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      // change([], status: RxStatus.empty());
      return 0;
    }
  }

  //
  Future<void> saveAgent(Map equipe) async {
    //
    Response response = await requete.postE("agent", equipe);
    //
    if (response.isOk) {
      //
      Get.back();
      getAllAgents();
      Get.snackbar("Succès", "L'enregistrement a abouti",
          backgroundColor: Colors.green);
    } else {
      //
      Get.back();
      getAllAgents();
      Get.snackbar("Oups erreur",
          "L'enregistrement n'a pas abouti code: ${response.statusCode}");
    }
  }

  //
  Future<String> saveStade2(Map equipe) async {
    //
    Response response = await requete.postE("agent", equipe);
    //
    if (response.isOk) {
      //
      Get.back();
      getAllAgents();
      // Get.snackbar("Succès", "L'enregistrement a abouti",
      //     backgroundColor: Colors.green);
      return "Cool";
    } else {
      //
      Get.back();
      getAllAgents();
      // Get.snackbar("Oups erreur",
      //     "L'enregistrement n'a pas abouti code: ${response.statusCode}");
      return "Pas cool";
    }
  }

  //
  Future<List> getAllJourneeDeLaSaison2(String idCalendrier) async {
    //
    Response response = await requete.getE("match/all/$idCalendrier");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("response mt: ${response.statusCode}");
      print("response mt: ${response.body}");
      // change(response.body, status: RxStatus.success());
      return response.body;
    } else {
      //
      print("response mt: ${response.statusCode}");
      print("response mt: ${response.body}");
      // change([], status: RxStatus.empty());
      return [];
    }
  }

  //
  Future<List> getAllBilletVendus(String idMatch, String idAgent) async {
    //
    Response response = await requete
        .getE("billet/billetvendus?idMatch=$idMatch&idAgent=$idAgent");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("response mt: ${response.statusCode}");
      print("response mt: ${response.body}");
      // change(response.body, status: RxStatus.success());
      return response.body;
    } else {
      //
      print("response mt: ${response.statusCode}");
      print("response mt: ${response.body}");
      // change([], status: RxStatus.empty());
      return [];
    }
  }
}
