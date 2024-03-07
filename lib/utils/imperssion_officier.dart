import 'dart:io' as io;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot_admin/pages/rapports/commissaire/commissaire_controller.dart';
import 'package:linafoot_admin/pages/rapports/officier/officier_controller.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import '../pages/rapports/arbitre/arbitre_controller.dart';

class RapportOfficierImpression {
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
    OfficierController2 officierController = Get.find();
    //
    //print("truc: ${officierController.evaluationArbitreReserve[0]}");
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
            // color: PdfPdfColors.red,
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: [
                pw.Expanded(
                  flex: 2,
                  child: pw.Container(
                    width: 50,
                    height: 05,
                    //color: PdfPdfColors.green,
                    child: pw.Image(
                      width: 50,
                      height: 50,
                      pw.MemoryImage(img1),
                    ),
                    // decoration: pw.pw.BoxDecoration(
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
                    //color: PdfPdfColors.green,
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
                // pw.Container(
                //   height: 100,
                //   //color: PdfColors.red,
                //   child: pw.Row(
                //     mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                //     children: [
                //       pw.Expanded(
                //         flex: 2,
                //         child: pw.Container(),
                //       ),
                //       pw.Expanded(
                //         flex: 8,
                //         child: pw.Container(
                //           child: pw.Column(
                //             mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                //             children: [
                //               pw.Align(
                //                 alignment: pw.Alignment.center,
                //                 child: pw.Text(
                //                     "FEDERATION CONGOLAISE DE FOOTBALL ASSOCIATION"),
                //               ),
                //               pw.Align(
                //                 alignment: pw.Alignment.center,
                //                 child: pw.Text("FECOFA"),
                //               ),
                //               pw.Align(
                //                 alignment: pw.Alignment.center,
                //                 child: pw.Text("LIGUE NATIONALE DE FOOTBALL"),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       pw.Expanded(
                //         flex: 2,
                //         child: pw.Container(),
                //       ),
                //     ],
                //   ),
                // ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Align(
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    "Rapport de l'officier du match",
                    style: pw.TextStyle(
                      fontSize: 20,
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
                      height: 15,
                      child: pw.Text(
                        "Officier du match",
                        style: style1,
                      ),
                    ),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      width: double.maxFinite,
                      padding: pw.EdgeInsets.all(5),
                      height: 15,
                      child: pw.Text(
                        "${officierController.arbitreProtocolaire['nom']} ${officierController.arbitreProtocolaire['postnom']} ${officierController.arbitreProtocolaire['prenom']}",
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
                      child: block("Date", "${officierController.date}"),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: block("Heure", "${officierController.heure}"),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: block("Lieu", officierController.jouea.value.text),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: block("Nombre de spetacteurs",
                          officierController.nombreSpectateur.value.text),
                    ),
                    pw.Expanded(
                      flex: 8,
                      child:
                          block("Stade", "${officierController.stade['nom']}"),
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
                      child: block(
                          "Equipe A", "${officierController.equipeA['nom']}"),
                    ),
                    pw.Expanded(
                      child: block(
                          "Equipe B", "${officierController.equipeB['nom']}"),
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
                          "${officierController.scoreMitemps['a']}"),
                    ),
                    pw.Expanded(
                      child: block("Tout Puissant MAZEMBE",
                          "${officierController.scoreMitemps['b']}"),
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
                          "${officierController.scoreFin['a']}"),
                    ),
                    pw.Expanded(
                      child: block("Tout Puissant MAZEMBE",
                          "${officierController.scoreFin['b']}"),
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
                      child: block("Arbitre assistant 1",
                          "${officierController.arbitreAssistant1['nom']} ${officierController.arbitreAssistant1['postnom']} ${officierController.arbitreAssistant1['prenom']}"),
                    ),
                    pw.Expanded(
                      child: block("Arbitre assistant 2",
                          "${officierController.arbitreAssistant2['nom']} ${officierController.arbitreAssistant2['postnom']} ${officierController.arbitreAssistant2['prenom']}"),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Expanded(
                      child: block("Arbitre central",
                          "${officierController.arbitreCentral['nom']} ${officierController.arbitreCentral['postnom']} ${officierController.arbitreCentral['prenom']}"),
                    ),
                    pw.Expanded(
                      child: block("", ""),
                    ),
                  ],
                ),
                //____________________________________________________________________
                //_______________________
                pw.SizedBox(
                  height: 20,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Remplacements equipe A",
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
                  height: 15,
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          "Entrants",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          "Sortants",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Minutes",
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
                        officierController.joueurRemplacantA.length, (i) {
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${officierController.joueurRemplacantA[i]['entrant']['nom']} ${officierController.joueurRemplacantA[i]['entrant']['postnom']} ${officierController.joueurRemplacantA[i]['entrant']['prenom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${officierController.joueurRemplacantA[i]['sortant']['nom']} ${officierController.joueurRemplacantA[i]['sortant']['postnom']} ${officierController.joueurRemplacantA[i]['sortant']['prenom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${officierController.joueurRemplacantA[i]['minute']} min",
                              style: style2,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                //_______________________
                pw.SizedBox(
                  height: 20,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Remplacements equipe B",
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
                  height: 15,
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          "Entrants",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          "Sortants",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Minutes",
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
                        officierController.joueurRemplacantB.length, (i) {
                      //
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${officierController.joueurRemplacantB[i]['entrant']['nom']} ${officierController.joueurRemplacantB[i]['entrant']['postnom']} ${officierController.joueurRemplacantB[i]['entrant']['prenom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${officierController.joueurRemplacantB[i]['sortant']['nom']} ${officierController.joueurRemplacantB[i]['sortant']['postnom']} ${officierController.joueurRemplacantB[i]['sortant']['prenom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${officierController.joueurRemplacantB[i]['minute']} min",
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
                        officierController.avertissementsJoueursGeneralA.length,
                        (index) {
                      //
                      Map joueur = officierController
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
                        officierController.expulssionsJoueursGeneralA.length,
                        (index) {
                      //
                      Map joueur =
                          officierController.expulssionsJoueursGeneralA[index];
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
                        officierController.butsJoueursGeneralA.length, (index) {
                      //
                      Map joueur =
                          officierController.butsJoueursGeneralA[index];
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
                  height: 15,
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
                        officierController.avertissementsJoueursGeneralB.length,
                        (index) {
                      //
                      Map joueur = officierController
                          .avertissementsJoueursGeneralB[index];
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
                  height: 15,
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
                        officierController.expulssionsJoueursGeneralB.length,
                        (index) {
                      //
                      Map joueur =
                          officierController.expulssionsJoueursGeneralB[index];
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
                  height: 15,
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
                        officierController.butsJoueursGeneralB.length, (index) {
                      //
                      Map joueur =
                          officierController.butsJoueursGeneralB[index];
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
                //______________________________________________________________
                pw.SizedBox(
                  height: 100,
                ),
              ],
            ),
          ];
        },
      ),
    );

    String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Your File to desired location',
        fileName: "Rapport officier du match - journéé playoff.pdf");

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
