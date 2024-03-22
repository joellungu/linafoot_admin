import 'package:get/get.dart';
import 'package:linafoot_admin/utils/requete.dart';

class JourneeController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  Future<List> getAllMatchsDeLaJournee2(
      String idCalendrier, String categorie, String journee) async {
    //
    Response response =
        await requete.getE("match/All/match/$idCalendrier/$categorie/$journee");
    //
    if (response.isOk) {
      // print("response: ${response.statusCode}");
      // print("response: ${response.body}");
      // change(response.body, status: RxStatus.success());
      return response.body;
    } else {
      //
      // print("response: ${response.statusCode}");
      // print("response: ${response.body}");
      // change([], status: RxStatus.empty());
      return [];
    }
  }

  //
  Future<void> getAllMatchsDeLaJournee(
      String idCalendrier, String categorie, String journee) async {
    //
    change([], status: RxStatus.loading());
    //
    Response response =
        await requete.getE("match/All/match/$idCalendrier/$categorie/$journee");
    //
    if (response.isOk) {
      print("response jr: ${response.statusCode}");
      print("response jr: ${response.body}");
      //
      change(response.body, status: RxStatus.success());
    } else {
      //
      print("response jr: ${response.statusCode}");
      print("response jr: ${response.body}");
      change([], status: RxStatus.empty());
    }
  }

  //
  Future<void> supprimerMatch(
      String idCalendrier, String categorie, String journee, String id) async {
    //
    Response response = await requete.deleteE("match?id=$id");
    //
    if (response.isOk) {
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      Get.back();
      getAllMatchsDeLaJournee(idCalendrier, categorie, journee);
    } else {
      //
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      Get.back();
      Get.snackbar("Oups", "Nous n'avons pa pu supprimer ce match");
      //getAllMatchsDeLaJournee(idCalendrier, categorie, journee);
    }
  }

  //
  Future<Map> getAffiche(String idMatch) async {
    //
    //
    Response response = await requete.getE("affiche/one?idMatch=$idMatch");
    //
    if (response.isOk) {
      print("response: aff ${response.statusCode}");
      print("response: aff ${response.body}");
      // change(response.body, status: RxStatus.success());
      return response.body ?? {};
    } else {
      //
      print("response: aff e ${response.statusCode}");
      print("response: aff e ${response.body}");
      // change([], status: RxStatus.empty());
      return {};
    }
  }

  //
  Future<void> updateAffiche(Map affiche, String idCalendrier, String categorie,
      String journee) async {
    //
    //
    Response response = await requete.putE("match/afficher", affiche);
    //
    if (response.isOk) {
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      // change(response.body, status: RxStatus.success());
      //return response.body;
      getAllMatchsDeLaJournee(idCalendrier, categorie, journee);
    } else {
      //
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      // change([], status: RxStatus.empty());
    }
  }

  //
  Future<Map> deleteAffiche(String idMatch) async {
    //
    //
    Response response = await requete.delete("affiche?idMatch=$idMatch");
    //
    if (response.isOk) {
      // print("response: ${response.statusCode}");
      // print("response: ${response.body}");
      // change(response.body, status: RxStatus.success());
      return response.body;
    } else {
      //
      // print("response: ${response.statusCode}");
      // print("response: ${response.body}");
      // change([], status: RxStatus.empty());
      return {};
    }
  }
}
