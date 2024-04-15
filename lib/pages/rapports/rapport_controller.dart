import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot_admin/pages/arbitres/arbitre_controller.dart';
import 'package:linafoot_admin/pages/rapports/arbitre/arbitre.dart';
import 'package:linafoot_admin/pages/rapports/officier/officier.dart';
import 'package:linafoot_admin/pages/rapports/officier/officier_controller.dart';
import 'package:linafoot_admin/utils/requete.dart';
import 'arbitre/arbitre_controller.dart';
import 'commissaire/commissaire.dart';
import 'commissaire/commissaire_controller.dart';
import 'details_rapport.dart';

class RapportController extends GetxController with StateMixin<List> {
  //
  CommissaireController2 commissaireController = Get.find();
  ArbitreController2 arbitreController = Get.find();
  OfficierController2 officierController = Get.find();
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
  var box = GetStorage();
  //
  RxMap commissaire = {}.obs;
  RxMap arbitreCentrale = {}.obs;
  RxMap arbitreAssitant1 = {}.obs;
  RxMap arbitreAssitant2 = {}.obs;
  RxMap arbitreProtocolaire = {}.obs;
  //
  //
  Future<List> getAllJourneeDeLaSaison(
      String idCalendrier, String categorie) async {
    //
    //change([], status: RxStatus.loading());
    //
    Response response =
        await requete.getE("match/All/journee/$idCalendrier/$categorie");
    //
    if (response.isOk) {
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

  Future<List> getAllMatchsDeLaJournee2(
      String idCalendrier, String categorie, String journee) async {
    //
    //change([], status: RxStatus.loading());
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
      // print("response: ${response.statusCode}");
      // print("response: ${response.body}");
      // change([], status: RxStatus.empty());
      return [];
    }
  }

  //
  Future<void> getAllMatchsDeLaJournee(
      int id, String idCalendrier, String categorie, String journee) async {
    //
    change([], status: RxStatus.loading());
    //
    Response response = await requete
        .getE("match/All/journee/$idCalendrier/$categorie/$journee");
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
  Future<void> updateMatch(Map equipe) async {
    //
    Response response = await requete.putE("match", equipe);
    //
    if (response.isOk) {
      //
      print("rep: ${response.body}");
      Get.back();
      getAllJourneeDeLaSaison(
          "${equipe['idCalendrier']}", "${equipe['categorie']}");
      Get.snackbar("Succès", "Mise à jour éffectué",
          backgroundColor: Colors.green);
    } else {
      //
      Get.back();
      //getAllJourneeDeLaSaison(id);
      Get.snackbar("Oups erreur",
          "Une erreur lors de la Mise à jour, code: ${response.statusCode}");
    }
  }

  //
  Future<void> saveMatch(Map equipe) async {
    //
    print("equipe: $equipe");
    //
    Response response = await requete.postE("match", equipe);
    //
    if (response.isOk) {
      //
      Get.back();
      getAllJourneeDeLaSaison(
          "${equipe['idCalendrier']}", "${equipe['categorie']}");
      Get.snackbar("Succès", "L'enregistrement a abouti",
          backgroundColor: Colors.green);
    } else {
      //
      Get.back();
      //getAllJourneeDeLaSaison(id);
      Get.snackbar("Oups erreur",
          "L'enregistrement n'a pas abouti code: ${response.statusCode}");
    }
  }

  //
  Future<Map> getOneArbitre(String id) async {
    //
    //
    Response response = await requete.getE("arbitre/one?id=$id");
    //
    if (response.isOk) {
      //
      return response.body;
    } else {
      //
      return {};
    }
  }

  //
  Future<Map> getOneCommissaire(String id) async {
    //
    //
    Response response = await requete.getE("commissaire/one?id=$id");
    //
    if (response.isOk) {
      //
      return response.body;
    } else {
      //
      return {};
    }
  }

  //
  Future<Map> getOneEquipe(String id) async {
    //
    //
    Response response = await requete.getE("equipe/one?id=$id");
    //
    if (response.isOk) {
      //
      return response.body;
    } else {
      //
      return {};
    }
  }

  //
  Future<void> getRapport(
      String idCalendrier, String typeRapport, int cat) async {
    //
    print("idCalendrier=$idCalendrier");
    //change([], status: RxStatus.loading());
    //
    Response response = await requete.getE(
        "rapport/rapport?idCalendrier=$idCalendrier&typeRapport=$typeRapport");
    //
    if (response.isOk) {
      print("response mt: ${response.statusCode}");
      print("response mt: ${response.bodyString}");
      // change(response.body, status: RxStatus.success());
      //return response.body;
      Get.back();
      Get.snackbar("Oups", "Aucun rapport trouvé.");
      box.write("rapport", response.body);
      //
      Map match = response.body;
      //
      if (cat == 1) {
        //
        getInfos(match);
        setMatchCommissaire(match['rapport']);
        Get.to(
          CommissaireFormulaire(match, 1),
        );
      } else if (cat == 2) {
        //
        getInfos(match);
        setMatchArbitre(match['rapport']);
        Get.to(HarbitreRapport(match, 2));
      } else {
        //
        getInfosOf(match);
        setMatchOfficier(match['rapport']);
        Get.to(OfficierRapport(match, 3));
      }
      //Get.to(DetailsRapport(response.body));
      //
    } else {
      //
      print("response mt: ${response.statusCode}");
      print("response mt: ${response.body}");
      //
      Get.back();
      Get.snackbar("Oups", "Aucun rapport trouvé.");
      // change([], status: RxStatus.empty());
      //return [];
    }
  }

  //
  //
  setMatchCommissaire(Map match) {
    //match['rapport'] = {

    commissaireController.heure.value = match['heure'];
    commissaireController.date.value = match['date'];
    commissaireController.stade.value = match['stade'];
    commissaireController.equipeA.value = match['equipeA'];
    commissaireController.equipeB.value = match['equipeB'];
    commissaireController.resultatMitemps.value = match['resultatMitemps'];
    commissaireController.resultatFinal.value = match['resultatFinal'];
    commissaireController.arbitreCentral.value = match['arbitreCentral'];
    commissaireController.arbitreAssistant1.value = match['arbitreAssistant1'];
    commissaireController.arbitreAssistant2.value = match['arbitreAssistant2'];
    commissaireController.arbitreProtocolaire.value =
        match['arbitreProtocolaire'];
    //
    commissaireController.scoreMitemps.value = match['scoreMitemps'] ?? {};
    commissaireController.scoreFin.value = match['scoreFin'] ?? {};
    //
    commissaireController.avertissementsJoueursGeneralA.value =
        match['avertissementsJoueursGeneralA'];
    commissaireController.expulssionsJoueursGeneralA.value =
        match['expulssionsJoueursGeneralA'];
    commissaireController.butsJoueursGeneralA.value =
        match['butsJoueursGeneralA'];
    //
    commissaireController.avertissementsJoueursGeneralB.value =
        match['avertissementsJoueursGeneralB'];
    commissaireController.expulssionsJoueursGeneralB.value =
        match['expulssionsJoueursGeneralB'];
    commissaireController.butsJoueursGeneralB.value =
        match['butsJoueursGeneralB'];
    //
    commissaireController.nombreSpectateur.value.text =
        match['nombreSpectateur'];
    commissaireController.attitudeJouerA.value = match['attitudeJouerA'];
    commissaireController.attitudeJouerB.value = match['attitudeJouerB'];
    commissaireController.attitudePublic.value = match['attitudePublic'];
    commissaireController.etatsTerrainListe.value = match['etatsTerrainListe'];
    commissaireController.etatsInstallationListe.value =
        match['etatsInstallationListe'];
    commissaireController.incident.value.text = match['incident'];
    commissaireController.organisationGenerale.value =
        match['organisationGenerale'];
    commissaireController.serviceControle.value = match['serviceControle'];
    commissaireController.servicePolice.value = match['servicePolice'];
    commissaireController.serviceSanitaire.value = match['serviceSanitaire'];
    commissaireController.organisation.value = match['organisation'];
    commissaireController.personnalite.value = match['personnalite'];
    commissaireController.conditionPhysique.value = match['conditionPhysique'];
    commissaireController.capacite.value = match['capacite'];
    commissaireController.execution.value = match['execution'];
    commissaireController.discipline.value = match['discipline'];
    commissaireController.difficulte.value = match['difficulte'] ?? "";

    commissaireController.evaluationArbitreAssistant.value =
        match['evaluationArbitreAssistant'];

    commissaireController.evaluationArbitreReserve.value =
        match['evaluationArbitreReserve'];
    commissaireController.commentaire.value.text = match['commentaire'] ?? "";
    //};
  }

  setMatchArbitre(Map match) {
    //

    arbitreController.heure.value = match['heure'];
    arbitreController.date.value = match['date'];
    arbitreController.stade.value = match['stade'];
    arbitreController.equipeA.value = match['equipeA'];
    arbitreController.equipeB.value = match['equipeB'];
    arbitreController.resultatMitemps.value = match['resultatMitemps'];
    arbitreController.resultatFinal.value = match['resultatFinal'];
    arbitreController.arbitreCentral.value = match['arbitreCentral'];
    arbitreController.arbitreAssistant1.value = match['arbitreAssistant1'];
    arbitreController.arbitreAssistant2.value = match['arbitreAssistant2'];
    arbitreController.arbitreProtocolaire.value = match['arbitreProtocolaire'];
    //__________________________________________
    arbitreController.arbitreProtocolaire.value = match['arbitreProtocolaire'];
    //
    arbitreController.comportementEquipeA.value = match['comportementEquipeA'];
    //
    arbitreController.comportementPubliqueEquipeA.value =
        match['comportementPubliqueEquipeA'];
    //
    arbitreController.comportementPubliqueEquipeB.value =
        match['comportementPubliqueEquipeB'];
    //
    arbitreController.etatInstallation.value = match['etatInstallation'];
    //
    arbitreController.etatsInstallationListe.value =
        match['etatsInstallationListe'];
    //
    arbitreController.etatTerrain.value = match['etatTerrain'];
    //
    arbitreController.etatsTerrainListe.value = match['etatsTerrainListe'];
    //
    //__________________________________________
    arbitreController.joueurEqupeA.value = match['joueurEqupeA'];
    //
    arbitreController.joueurEquipeRemplacantA.value =
        match['joueurEquipeRemplacantA'];
    //
    arbitreController.joueurRemplacantA.value = match['joueurRemplacantA'];
    //
    arbitreController.joueurRemplacantB.value = match['joueurRemplacantB'];
    //
    arbitreController.joueurEqupeB.value = match['joueurEqupeB'];
    //
    arbitreController.joueurEquipeRemplacantB.value =
        match['joueurEquipeRemplacantB'];
    //
    //__________________________________________
    arbitreController.scoreMitemps.value = match['scoreMitemps'];
    arbitreController.scoreFin.value = match['scoreFin'];
    //
    arbitreController.avertissementsJoueursGeneralA.value =
        match['avertissementsJoueursGeneralA'];
    arbitreController.expulssionsJoueursGeneralA.value =
        match['expulssionsJoueursGeneralA'];
    arbitreController.butsJoueursGeneralA.value =
        match['butsJoueursGeneralA'] ?? [];
    //
    arbitreController.avertissementsJoueursGeneralB.value =
        match['avertissementsJoueursGeneralB'] ?? [];
    arbitreController.expulssionsJoueursGeneralB.value =
        match['expulssionsJoueursGeneralB'];
    //
    arbitreController.butsJoueursGeneralB.value = match['butsJoueursGeneralB'];
    //__________________________________________
    //arbitreController.officierEquipeA
    arbitreController.officierEquipeA.value = match['officierEquipeA'];
    //
    arbitreController.officierEquipeB.value = match['officierEquipeB'];
    //___________________________________________
    arbitreController.observationEventuelle.value.text =
        match['observationEventuelle'];
    //
    arbitreController.observation.value.text = match['observation'];
    //
    arbitreController.reserves.value.text = match['reserves'];
    //
    arbitreController.incident.value.text = match['incident'];
    //
    arbitreController.nombreSpectateur.value.text = match['nombreSpectateur'];
    //
    arbitreController.jouea.value.text = match['jouea'];
    //
    arbitreController.nMatch.value.text = match['nmatch'] ?? "";
    //comportementEquipeA
    //indexComportementEquipeA
    //
    //comportementEquipeB
    //indexComportementEquipeB
    //
    //
    //
  }

  //
  Future<bool> getInfos(Map match) async {
    //
    commissaireController.commissaire.value =
        await getOneCommissaire("${match['commissaire']}");
    //
    commissaireController.arbitreCentral.value =
        await getOneArbitre("${match['arbitreCentrale']}");
    //*
    commissaireController.arbitreAssistant1.value =
        await getOneArbitre("${match['arbitreAssitant1']}");
    //*
    commissaireController.arbitreAssistant2.value =
        await getOneArbitre("${match['arbitreAssitant2']}");
    //*
    commissaireController.arbitreProtocolaire.value =
        await getOneArbitre("${match['arbitreProtocolaire']}");
    //
    //*
    commissaireController.equipeA.value =
        await getOneEquipe("${match['idEquipeA']}");
    //*
    commissaireController.equipeB.value =
        await getOneEquipe("${match['idEquipeB']}");
    //
    // RapportController.arbitres.value = await getAllArbitre();
    // //
    // RapportController.commissaires.value =
    //     await getAllCommissaire();
    // //
    // RapportController.equipes.value = await getAllEquipes();
    // //_________________
    // RapportController.joueurEquipeA.value =
    //     await profilController.getAllJoueurEquipe("${match['idEquipeA']}");
    // //*
    // RapportController.joueurEquipeB.value =
    //     await getAllJoueurEquipe("${match['idEquipeB']}");

    Get.back();
    return true;
  }

  //
  setMatchOfficier(Map match) {
    //

    officierController.heure.value = match['heure'];
    officierController.date.value = match['date'];
    officierController.stade.value = match['stade'];
    officierController.equipeA.value = match['equipeA'];
    officierController.equipeB.value = match['equipeB'];
    officierController.resultatMitemps.value = match['resultatMitemps'];
    officierController.resultatFinal.value = match['resultatFinal'];
    officierController.arbitreCentral.value = match['arbitreCentral'];
    officierController.arbitreAssistant1.value = match['arbitreAssistant1'];
    officierController.arbitreAssistant2.value = match['arbitreAssistant2'];
    officierController.arbitreProtocolaire.value = match['arbitreProtocolaire'];
    //__________________________________________
    officierController.arbitreProtocolaire.value = match['arbitreProtocolaire'];
    //
    //officierController.comportementEquipeA.value = match['comportementEquipeA'];
    //
    officierController.joueurRemplacantA.value = match['joueurRemplacantA'];
    //
    officierController.joueurRemplacantB.value = match['joueurRemplacantB'];
    //__________________________________________
    officierController.avertissementsJoueursGeneralA.value =
        match['avertissementsJoueursGeneralA'];
    //
    officierController.expulssionsJoueursGeneralA.value =
        match['expulssionsJoueursGeneralA'];
    //
    officierController.butsJoueursGeneralA.value = match['butsJoueursGeneralA'];
    //
    officierController.avertissementsJoueursGeneralB.value =
        match['avertissementsJoueursGeneralB'];
    //
    officierController.expulssionsJoueursGeneralB.value =
        match['expulssionsJoueursGeneralB'];
    //
    officierController.butsJoueursGeneralB.value = match['butsJoueursGeneralB'];
    //
    //__________________________________________
    officierController.scoreMitemps.value = match['scoreMitemps'];
    officierController.scoreFin.value = match['scoreFin'];
    //
    officierController.avertissementsJoueursGeneralA.value =
        match['avertissementsJoueursGeneralA'];
    officierController.expulssionsJoueursGeneralA.value =
        match['expulssionsJoueursGeneralA'];
    officierController.butsJoueursGeneralA.value = match['butsJoueursGeneralA'];
    //
    officierController.avertissementsJoueursGeneralB.value =
        match['avertissementsJoueursGeneralB'];
    officierController.expulssionsJoueursGeneralB.value =
        match['expulssionsJoueursGeneralB'];
    //
    officierController.butsJoueursGeneralB.value = match['butsJoueursGeneralB'];
    //__________________________________________
    //arbitreController.officierEquipeA
    officierController.officierEquipeA.value = match['officierEquipeA'];
    //
    officierController.officierEquipeB.value = match['officierEquipeB'];
    //___________________________________________
    //arbitreController.observationEventuelle.value.text =
    //  match['observationEventuelle'];
    //
    officierController.nombreSpectateur.value.text =
        match['nombreSpectateur'] ?? '';
    //
    officierController.jouea.value.text = match['jouea'] ?? '';
    //
    officierController.nMatch.value.text = match['nmatch'] ?? '';
  }

  //
  Future<bool> getInfosOf(Map match) async {
    //
    officierController.commissaire.value =
        await getOneCommissaire("${match['commissaire']}");
    //
    officierController.arbitreCentral.value =
        await getOneArbitre("${match['arbitreCentrale']}");
    //*
    officierController.arbitreAssistant1.value =
        await getOneArbitre("${match['arbitreAssitant1']}");
    //*

    officierController.arbitreAssistant2.value =
        await getOneArbitre("${match['arbitreAssitant2']}");
    //*
    officierController.arbitreProtocolaire.value =
        await getOneArbitre("${match['arbitreProtocolaire']}");
    //
    //officierController.nMatch.value.text = "${match['nmatch']}";
    //*
    officierController.equipeA.value =
        await getOneEquipe("${match['idEquipeA']}");
    //*
    officierController.equipeB.value =
        await getOneEquipe("${match['idEquipeB']}");
    //
    officierController.nombreSpectateur.value.text =
        match['nombreSpectateur'] ?? '';
    //
    officierController.jouea.value.text = match['jouea'] ?? '';
    //
    officierController.nMatch.value.text = match['nMatch'] ?? '';
    // officierController.arbitres.value = await profilController.getAllArbitre();
    // //
    // officierController.commissaires.value =
    //     await profilController.getAllCommissaire();
    // //
    // RapportController.equipes.value = await profilController.getAllEquipes();
    // //_________________
    // RapportController.joueurEquipeA.value =
    //     await profilController.getAllJoueurEquipe("${match['idEquipeA']}");
    // //*
    // RapportController.joueurEquipeB.value =
    //     await profilController.getAllJoueurEquipe("${match['idEquipeB']}");
    Get.back();
    return true;
  }

  // Future<bool> getInfosAr(Map match) async {
  //   //
  //   arbitreController.commissaire.value =
  //       await profilController.getOneCommissaire("${match['commissaire']}");
  //   //
  //   arbitreController.arbitreCentral.value =
  //       await profilController.getOneArbitre("${match['arbitreCentrale']}");
  //   //*
  //   arbitreController.arbitreAssistant1.value =
  //       await profilController.getOneArbitre("${match['arbitreAssitant1']}");
  //   //*
  //   arbitreController.arbitreAssistant2.value =
  //       await profilController.getOneArbitre("${match['arbitreAssitant2']}");
  //   //*
  //   arbitreController.arbitreProtocolaire.value =
  //       await profilController.getOneArbitre("${match['arbitreProtocolaire']}");
  //   //
  //   //*
  //   arbitreController.equipeA.value =
  //       await profilController.getOneEquipe("${match['idEquipeA']}");
  //   //*
  //   arbitreController.equipeB.value =
  //       await profilController.getOneEquipe("${match['idEquipeB']}");
  //   //
  //   RapportController.arbitres.value = await profilController.getAllArbitre();
  //   //
  //   RapportController.commissaires.value =
  //       await profilController.getAllCommissaire();
  //   //
  //   RapportController.equipes.value = await profilController.getAllEquipes();
  //   //_________________
  //   RapportController.joueurEquipeA.value =
  //       await profilController.getAllJoueurEquipe("${match['idEquipeA']}");
  //   //*
  //   RapportController.joueurEquipeB.value =
  //       await profilController.getAllJoueurEquipe("${match['idEquipeB']}");
  //   Get.back();
  //   return true;
  // }
  // //
}
