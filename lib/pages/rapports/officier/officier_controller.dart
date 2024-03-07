import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot_admin/utils/requete.dart';

class OfficierController2 extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  Rx<TextEditingController> nMatch =
      Rx<TextEditingController>(TextEditingController());
  //
  Rx<TextEditingController> jouea =
      Rx<TextEditingController>(TextEditingController());
  //
  RxMap stade = {}.obs;
  //
  RxInt competition = 0.obs;
  //
  RxMap equipe = {}.obs;
  //
  RxMap equipeA = {}.obs;
  //
  RxMap equipeB = {}.obs;
  //
  RxList arbitres = [].obs;
  RxList commissaires = [].obs;
  //
  RxMap lieu = {}.obs;
  //
  RxMap resultatMitemps = {}.obs;
  //
  RxMap resultatFinal = {}.obs;
  //
  RxMap arbitreCentral = {}.obs;
  //
  RxMap arbitreAssistant1 = {}.obs;
  //
  RxMap arbitreAssistant2 = {}.obs;
  RxMap arbitreProtocolaire = {}.obs;
  //
  RxMap arbitreAssistantEvaluation1 = {}.obs;
  //
  RxMap arbitreReserveEvaluation2 = {}.obs;
  //
  RxMap arbitreReserve = {}.obs;
  //
  RxList avertissementsJoueurs = [].obs;
  //
  RxMap scoreMitemps = {}.obs;
  //
  RxMap scoreFin = {}.obs;
  //
  RxString date = "".obs;
  //
  RxString heure = "".obs;
  //
  Rx<TextEditingController> nombreSpectateur =
      Rx<TextEditingController>(TextEditingController());
  //
  RxList officierEquipeA = [].obs;
  RxList officierEquipeB = [].obs;
  //
  RxMap commissaire = {}.obs;
  //
  RxList expulssionsJoueurs = [].obs;
  //
  RxList butsJoueurs = [].obs;
  //__________________________________________________
  RxMap joueurRemplacantEntrant = {}.obs;
  RxMap joueurRemplacantSortant = {}.obs;
  //__________________________________________________
  RxList avertissementsJoueursGeneralA = [].obs;
  //
  RxList joueurRemplacantA = [].obs;
  //
  RxList joueurRemplacantB = [].obs;
  //
  RxList expulssionsJoueursGeneralA = [].obs;
  //
  RxList butsJoueursGeneralA = [].obs;
  //__________________________________________________
  RxList avertissementsJoueursGeneralB = [].obs;
  //
  RxList expulssionsJoueursGeneralB = [].obs;
  //
  RxList butsJoueursGeneralB = [].obs;
  //__________________________________________________
  RxList evaluationArbitreAssistant = [].obs;
  //
  RxList evaluationArbitreReserve = [].obs;
  //
  //
  Future<void> envoyerRapport(Map r) async {
    //
    // Response response = await requete.postE("rapport", r);
    // //
    // if (response.isOk) {
    //   print("Arbitre: ${response.body}");
    //   //
    //   box.write("rapport${r['match']}", {});
    //   //
    //   Get.offAll(Accueil());
    //   //
    //   Get.snackbar("Succès", "Rapport envoyé");
    //   //
    //   //return response.body;
    // } else {
    //   //
    //   Get.snackbar("Erreur", "Rapport non envoyé, vérifier votre connexion",
    //       backgroundColor: Colors.red);
    //   print("Arbitre: ${response.body}");
    //   //return [];
    // }
  }
  //RxList butsJoueursGeneral = [].obs;
}
