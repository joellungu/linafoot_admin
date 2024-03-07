import 'dart:io' as io;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/commissaire/commissaire_controller.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';

class RapportCommissaireImpression {
  static imprimer(Uint8List img1, Uint8List img2) async {
    //
    List etats = [
      "Tension et Excitation",
      "Encouragement",
      "Nervosité",
      "Critique",
      "Célébration ou Déception",
      "Réactions envers l'adversaire",
    ];
    //
    List etats2 = [
      "Très mauvais",
      "Mauvais",
      "Insuffisant",
      "Moyen",
      "Bien",
      "Très bien",
      "Excellent"
    ];
    //
    List personnalites = [
      "Décidé",
      "Indécis",
      "anxieux",
      "Influençable face au public"
    ];
    //
    CommissaireController2 commissaireController = Get.find();
    //
    print("truc: ${commissaireController.evaluationArbitreReserve[0]}");
    //
    final pdf = pw.Document();
    //
    pdf.addPage(
      pw.MultiPage(
        margin: pw.EdgeInsets.all(3),
        header: (c) {
          //
          return pw.Container(
            height: 50,
            // color: PdfColors.red,
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: [
                pw.Expanded(
                  flex: 2,
                  child: pw.Container(
                    width: 50,
                    height: 05,
                    //color: PdfColors.green,
                    child: pw.Image(
                      width: 50,
                      height: 50,
                      pw.MemoryImage(img1),
                    ),
                    // decoration: pw.BoxDecoration(
                    //   image: pw.DecorationImage(
                    //     image: img1,
                    //   ),
                    // ),
                  ),
                ),
                pw.Expanded(
                  flex: 8,
                  child: pw.Container(
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Align(
                          alignment: pw.Alignment.center,
                          child: pw.Text(
                              "FEDERATION CONGOLAISE DE FOOTBALL ASSOCIATION"),
                        ),
                        pw.Align(
                          alignment: pw.Alignment.center,
                          child: pw.Text("FECOFA"),
                        ),
                        pw.Align(
                          alignment: pw.Alignment.center,
                          child: pw.Text("LIGUE NATIONALE DE FOOTBALL"),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 2,
                  child: pw.Container(
                    width: 50,
                    height: 50,
                    //color: PdfColors.green,
                    child: pw.Image(
                      width: 50,
                      height: 50,
                      pw.MemoryImage(img2),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        build: (c) {
          return [
            pw.ListView(
              padding: pw.EdgeInsets.all(10),
              children: [
                pw.SizedBox(
                  height: 5,
                ),
                pw.Align(
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    "Rapport du commissaire au match",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Column(
                  children: [
                    pw.Container(
                      color: PdfColors.black,
                      width: double.maxFinite,
                      padding: pw.EdgeInsets.all(5),
                      height: 20,
                      child: pw.Text(
                        "Commissaire au match",
                        style: style1,
                      ),
                    ),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      width: double.maxFinite,
                      padding: pw.EdgeInsets.all(5),
                      height: 20,
                      child: pw.Text(
                        "${commissaireController.commissaire['nom'] ?? ''} ${commissaireController.commissaire['postnom'] ?? ''} ${commissaireController.commissaire['prenom'] ?? ''}",
                        style: style2,
                      ),
                    )
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Expanded(
                      flex: 2,
                      child: block("Date", "${commissaireController.date}"),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: block("Heure", "${commissaireController.heure}"),
                    ),
                    // pw.Expanded(
                    //   flex: 2,
                    //   child: block("Lieu", "Kinshasa"),
                    // ),
                    pw.Expanded(
                      flex: 8,
                      child: block(
                          "Stade", "${commissaireController.stade['nom']}"),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Expanded(
                      child: block("Equipe A",
                          "${commissaireController.equipeA['nom']}"),
                    ),
                    pw.Expanded(
                      child: block("Equipe B",
                          "${commissaireController.equipeB['nom']}"),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Score à la mi-temps",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Expanded(
                      child: block("AS VITA CLUB",
                          "${commissaireController.scoreMitemps['a'] ?? '0'}"),
                    ),
                    pw.Expanded(
                      child: block("Tout Puissant MAZEMBE",
                          "${commissaireController.scoreMitemps['b'] ?? '0'}"),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Score à la fin du match",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Expanded(
                      child: block("AS VITA CLUB",
                          "${commissaireController.scoreFin['a'] ?? '0'}"),
                    ),
                    pw.Expanded(
                      child: block("Tout Puissant MAZEMBE",
                          "${commissaireController.scoreFin['b'] ?? '0'}"),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Les Arbitres",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Expanded(
                      child: block("Arbitre central",
                          "${commissaireController.arbitreCentral['nom']} ${commissaireController.arbitreCentral['postnom']} ${commissaireController.arbitreCentral['prenom']}"),
                    ),
                    pw.Expanded(
                      child: block("Arbitre assistant 1",
                          "${commissaireController.arbitreAssistant1['nom']} ${commissaireController.arbitreAssistant1['postnom']} ${commissaireController.arbitreAssistant1['prenom']}"),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Expanded(
                      child: block("Arbitre assistant 2",
                          "${commissaireController.arbitreAssistant2['nom']} ${commissaireController.arbitreAssistant2['postnom']} ${commissaireController.arbitreAssistant2['prenom']}"),
                    ),
                    pw.Expanded(
                      child: block("Arbitre protocolaire",
                          "${commissaireController.arbitreProtocolaire['nom']} ${commissaireController.arbitreProtocolaire['postnom']} ${commissaireController.arbitreProtocolaire['prenom']}"),
                    ),
                  ],
                ),
                //____________________________________________________________________
                pw.SizedBox(
                  height: 20,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Avertissements joueurs equipe A",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ),
                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 20,
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 2,
                        child: pw.Text(
                          "Nom",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Dorssare",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "License",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Minute",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          "Raison",
                          style: style1,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Column(
                    children: List.generate(
                        commissaireController
                            .avertissementsJoueursGeneralA.length, (index) {
                      //
                      Map joueur = commissaireController
                          .avertissementsJoueursGeneralA[index];
                      // print("joueur A: ${joueur}");
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(
                              "${joueur['joueur']['nom']} ${joueur['joueur']['postnom']} ${joueur['joueur']['nom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['joueur']['numero']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['joueur']['licence']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['minute']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${joueur['note']}",
                              style: style2,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Expulsions joueurs equipe A",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ),
                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 20,
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 2,
                        child: pw.Text(
                          "Nom",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Dorssare",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "License",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Minute",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          "Raison",
                          style: style1,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Column(
                    children: List.generate(
                        commissaireController.expulssionsJoueursGeneralA.length,
                        (index) {
                      //
                      Map joueur = commissaireController
                          .expulssionsJoueursGeneralA[index];
                      print("joueur A: ${joueur}");
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(
                              "${joueur['joueur']['nom']} ${joueur['joueur']['postnom']} ${joueur['joueur']['nom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['joueur']['numero']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['joueur']['licence']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['minute']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${joueur['note']}",
                              style: style2,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Buts joueurs equipe A",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ),
                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 20,
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 2,
                        child: pw.Text(
                          "Nom",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Dorssare",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "License",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Minute",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          "Raison",
                          style: style1,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  //
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Column(
                    children: List.generate(
                        commissaireController.butsJoueursGeneralA.length,
                        (index) {
                      //
                      Map joueur =
                          commissaireController.butsJoueursGeneralA[index];
                      print("joueur A: ${joueur}");
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(
                              "${joueur['joueur']['nom']} ${joueur['joueur']['postnom']} ${joueur['joueur']['nom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['joueur']['numero']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['joueur']['licence']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['minute']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${joueur['note']}",
                              style: style2,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),

                //____________________________________________________________________
                pw.SizedBox(
                  height: 20,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Avertissements joueurs equipe B",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ),
                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 20,
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 2,
                        child: pw.Text(
                          "Nom",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Dorssare",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "License",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Minute",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          "Raison",
                          style: style1,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Column(
                    children: List.generate(
                        commissaireController
                            .avertissementsJoueursGeneralB.length, (index) {
                      //
                      Map joueur = commissaireController
                          .avertissementsJoueursGeneralB[index];
                      print("joueur A: ${joueur}");
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(
                              "${joueur['joueur']['nom']} ${joueur['joueur']['postnom']} ${joueur['joueur']['nom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['joueur']['numero']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['joueur']['licence']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['minute']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${joueur['note']}",
                              style: style2,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Expulsions joueurs equipe B",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ),
                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 20,
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 2,
                        child: pw.Text(
                          "Nom",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Dorssare",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "License",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Minute",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          "Raison",
                          style: style1,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Column(
                    children: List.generate(
                        commissaireController.expulssionsJoueursGeneralB.length,
                        (index) {
                      //
                      Map joueur = commissaireController
                          .expulssionsJoueursGeneralB[index];
                      print("joueur A: ${joueur}");
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(
                              "${joueur['joueur']['nom']} ${joueur['joueur']['postnom']} ${joueur['joueur']['nom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['joueur']['numero']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['joueur']['licence']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['minute']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${joueur['note']}",
                              style: style2,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Buts joueurs equipe B",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ),
                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 20,
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 2,
                        child: pw.Text(
                          "Nom",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Dorssare",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "License",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Minute",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          "Raison",
                          style: style1,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Column(
                    children: List.generate(
                        commissaireController.butsJoueursGeneralB.length,
                        (index) {
                      //
                      Map joueur =
                          commissaireController.butsJoueursGeneralB[index];
                      print("joueur A: ${joueur}");
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(
                              "${joueur['joueur']['nom']} ${joueur['joueur']['postnom']} ${joueur['joueur']['nom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['joueur']['numero']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['joueur']['licence']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${joueur['minute']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${joueur['note']}",
                              style: style2,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                //______________________________________________________________
                pw.SizedBox(
                  height: 10,
                ),
                pw.Column(
                  children: [
                    pw.Container(
                      color: PdfColors.black,
                      width: double.maxFinite,
                      padding: pw.EdgeInsets.all(5),
                      height: 20,
                      child: pw.Text(
                        "Nombre de spectateurs",
                        style: style1,
                      ),
                    ),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      width: double.maxFinite,
                      padding: pw.EdgeInsets.all(5),
                      height: 20,
                      child: pw.Text(
                        commissaireController.nombreSpectateur.value.text,
                        style: style2,
                      ),
                    )
                  ],
                ),

                pw.SizedBox(
                  height: 10,
                ),
                pw.Column(
                  children: [
                    pw.Container(
                      color: PdfColors.black,
                      width: double.maxFinite,
                      padding: pw.EdgeInsets.all(5),
                      height: 20,
                      child: pw.Text(
                        "Attitude Joueurs équipe A",
                        style: style1,
                      ),
                    ),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      width: double.maxFinite,
                      padding: pw.EdgeInsets.all(5),
                      height: 20,
                      child: pw.Text(
                        "${etats[commissaireController.attitudeJouerA.value]}",
                        style: style2,
                      ),
                    )
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Column(
                  children: [
                    pw.Container(
                      color: PdfColors.black,
                      width: double.maxFinite,
                      padding: pw.EdgeInsets.all(5),
                      height: 20,
                      child: pw.Text(
                        "Attitude Joueurs équipe B",
                        style: style1,
                      ),
                    ),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      width: double.maxFinite,
                      padding: pw.EdgeInsets.all(5),
                      height: 20,
                      child: pw.Text(
                        "${etats[commissaireController.attitudeJouerB.value]}",
                        style: style2,
                      ),
                    )
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Column(
                  children: [
                    pw.Container(
                      color: PdfColors.black,
                      width: double.maxFinite,
                      padding: pw.EdgeInsets.all(5),
                      height: 20,
                      child: pw.Text(
                        "Attitude public",
                        style: style1,
                      ),
                    ),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      width: double.maxFinite,
                      padding: pw.EdgeInsets.all(5),
                      height: 20,
                      child: pw.Text(
                        "${etats[commissaireController.attitudePublic.value]}",
                        style: style2,
                      ),
                    )
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 20,
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Etat terrain",
                          style: style1,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Column(
                    children: List.generate(
                        commissaireController.etatsTerrainListe.length,
                        (index) {
                      String e = commissaireController.etatsTerrainListe[index];
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(
                              e,
                              style: style2,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 20,
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Etat installation",
                          style: style1,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Column(
                    children: List.generate(
                        commissaireController.etatsInstallationListe.length,
                        (index) {
                      //
                      String e =
                          commissaireController.etatsInstallationListe[index];
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(
                              e,
                              style: style2,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                block("Incident", commissaireController.incident.value.text),
                //
                pw.SizedBox(
                  height: 10,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      flex: 3,
                      child: block("Organisation générale",
                          "${etats2[commissaireController.organisationGenerale.value]}"),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: block("Service de controle",
                          "${etats2[commissaireController.serviceControle.value]}"),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: block("Service de police",
                          "${etats2[commissaireController.servicePolice.value]}"),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: block("Service sanitaire",
                          "${etats2[commissaireController.serviceSanitaire.value]}"),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: block("Organisation",
                          "${etats2[commissaireController.organisation.value]}"),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                block("Personnalité",
                    "${commissaireController.personnalite['personnalite']}"),
                pw.SizedBox(
                  height: 10,
                ),
                block("Face aux joueurs",
                    "${commissaireController.personnalite['faceJoueur']}"),
                block("Cote",
                    "${commissaireController.personnalite['appreciation']}"),
                block("Commentaire",
                    "${commissaireController.personnalite['appreciationCommentaire']}"),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Row(
                  //
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      flex: 3,
                      child: block("Condition physique",
                          "${commissaireController.conditionPhysique['cpFaceJoueur']}"),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: block("Cote",
                          "${commissaireController.conditionPhysique['physique']}"),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: block("Commentaire",
                          "${commissaireController.conditionPhysique['physiqueCommentaire']}"),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      flex: 3,
                      child: block("Capacité quant à l'arbitrage",
                          "${commissaireController.capacite['caFaceJoueur']}"),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: block("Cote",
                          "${commissaireController.capacite['capacite']}"),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: block("Commentaire",
                          "${commissaireController.capacite['capaciteCommentaire']}"),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      flex: 3,
                      child: block("Execution de ses obligations",
                          "${commissaireController.execution['exFaceJoueur']}"),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: block("Cote",
                          "${commissaireController.execution['execution']}"),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: block("Commentaire",
                          "${commissaireController.execution['executionCommentaire']}"),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      flex: 3,
                      child: block("Discipline et direction",
                          "${commissaireController.discipline['diFaceJoueur']}"),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: block("Cote",
                          "${commissaireController.discipline['discipline']}"),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: block("Commentaire",
                          "${commissaireController.discipline['disciplineCommentaire']}"),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Evaluation arbitre assistant et reserve",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Expanded(
                      child: block("Arbitre assistant",
                          "${commissaireController.evaluationArbitreAssistant[0]['evaluation']}"),
                    ),
                    pw.Expanded(
                      child: block("Arbitre reserve",
                          "${commissaireController.evaluationArbitreReserve[0]['evaluation']}"),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                block("Evaluation du match",
                    commissaireController.difficulte.value),
                pw.SizedBox(
                  height: 10,
                ),
                block("Commentaire",
                    commissaireController.commentaire.value.text),

                pw.SizedBox(
                  height: 100,
                ),
              ],
            )
          ];
        },
      ),
    );
    //
    String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Your File to desired location',
        fileName: "Rapport du commissaire - journéé playoff.pdf");

    try {
      //
      final file = io.File("$outputFile");
      await file.writeAsBytes(await pdf.save());
      //io.File returnedFile = io.File('$outputFile');
      //await returnedFile.writeAsString("Salut bro");
    } catch (e) {
      Get.snackbar("Erreur", "Un problème d'enregistrement ($e)");
    }
  }

  static pw.Widget block(String titre, String dada) {
    return pw.Column(
      children: [
        pw.Container(
          color: PdfColors.black,
          width: double.maxFinite,
          padding: pw.EdgeInsets.all(5),
          height: 15,
          child: pw.Text(
            titre,
            style: style1,
          ),
        ),
        pw.Container(
          decoration:
              pw.BoxDecoration(border: pw.Border.all(color: PdfColors.black)),
          width: double.maxFinite,
          padding: pw.EdgeInsets.all(5),
          height: 15,
          child: pw.Text(
            dada,
            style: style2,
          ),
        )
      ],
    );
  }

  //
  static pw.TextStyle style1 = pw.TextStyle(
    color: PdfColors.white,
    fontSize: 9,
  );
  static pw.TextStyle style2 = pw.TextStyle(
    color: PdfColors.black,
    fontSize: 8,
    fontWeight: pw.FontWeight.bold,
  );
  //
}
