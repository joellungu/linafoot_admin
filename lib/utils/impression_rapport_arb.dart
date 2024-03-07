import 'dart:io' as io;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot_admin/pages/rapports/commissaire/commissaire_controller.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import '../pages/rapports/arbitre/arbitre_controller.dart';

class RapportArbitreImpression {
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
    ArbitreController2 arbitreController = Get.find();
    //
    //print("truc: ${arbitreController.evaluationArbitreReserve[0]}");
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
                    "Rapport de l'arbitre central",
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
                        "Arbitre central du match",
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
                        "${arbitreController.arbitreCentral['nom']} ${arbitreController.arbitreCentral['postnom']} ${arbitreController.arbitreCentral['prenom']}",
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
                      child: block("Date", "${arbitreController.date}"),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: block("Heure", "${arbitreController.heure}"),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: block("Lieu", arbitreController.jouea.value.text),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: block("Nombre de spetacteurs",
                          arbitreController.nombreSpectateur.value.text),
                    ),
                    pw.Expanded(
                      flex: 8,
                      child:
                          block("Stade", "${arbitreController.stade['nom']}"),
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
                          "Equipe A", "${arbitreController.equipeA['nom']}"),
                    ),
                    pw.Expanded(
                      child: block(
                          "Equipe B", "${arbitreController.equipeB['nom']}"),
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
                          "${arbitreController.scoreMitemps['a']}"),
                    ),
                    pw.Expanded(
                      child: block("Tout Puissant MAZEMBE",
                          "${arbitreController.scoreMitemps['b']}"),
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
                      child: block(
                          "AS VITA CLUB", "${arbitreController.scoreFin['a']}"),
                    ),
                    pw.Expanded(
                      child: block("Tout Puissant MAZEMBE",
                          "${arbitreController.scoreFin['b']}"),
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
                          "${arbitreController.arbitreAssistant1['nom']} ${arbitreController.arbitreAssistant1['postnom']} ${arbitreController.arbitreAssistant1['prenom']}"),
                    ),
                    pw.Expanded(
                      child: block("Arbitre assistant 2",
                          "${arbitreController.arbitreAssistant2['nom']} ${arbitreController.arbitreAssistant2['postnom']} ${arbitreController.arbitreAssistant2['prenom']}"),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Expanded(
                      child: block("Arbitre protocolaire",
                          "${arbitreController.arbitreProtocolaire['nom']} ${arbitreController.arbitreProtocolaire['postnom']} ${arbitreController.arbitreProtocolaire['prenom']}"),
                    ),
                    pw.Expanded(
                      child: block("", ""),
                    ),
                  ],
                ),
                //____________
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
                        "Condition meteorologique",
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
                        arbitreController.meteo.value,
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
                      height: 15,
                      child: pw.Text(
                        "Comportement equipe A",
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
                        arbitreController.comportementEquipeA.value,
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
                      height: 15,
                      child: pw.Text(
                        "Comportement equipe B",
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
                        arbitreController.comportementEquipeB.value,
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
                      height: 15,
                      child: pw.Text(
                        "Comportement public equipe A",
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
                        arbitreController.comportementPubliqueEquipeA.value,
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
                      height: 15,
                      child: pw.Text(
                        "Comportement public equipe B",
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
                        arbitreController.comportementPubliqueEquipeB.value,
                        style: style2,
                      ),
                    )
                  ],
                ),
                //____________________________________________________________________
                pw.SizedBox(
                  height: 20,
                ),

                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 15,
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
                        arbitreController.etatsTerrainListe.length, (index) {
                      //
                      ;
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              arbitreController.etatsTerrainListe[index],
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

                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 15,
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
                        arbitreController.etatsInstallationListe.length,
                        (index) {
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              arbitreController.etatsInstallationListe[index],
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
                    "Joueurs equipe A",
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
                        flex: 5,
                        child: pw.Text(
                          "Titulaires",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 5,
                        child: pw.Text(
                          "Remplaçants",
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
                  //padding: pw.EdgeInsets.all(11),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                    children: [
                      pw.Expanded(
                        flex: 5,
                        child: pw.Container(
                          // decoration:
                          //     pw.BoxDecoration(border: pw.Border.all(color: PdfColors.black)),
                          // width: double.maxFinite,
                          // padding: pw.EdgeInsets.all(5),
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            children: List.generate(
                                arbitreController.joueurEqupeA.length, (index) {
                              //
                              Map joueur =
                                  arbitreController.joueurEqupeA[index];
                              //
                              return pw.Row(
                                children: [
                                  pw.Expanded(
                                    flex: 7,
                                    child: pw.Text(
                                      "${joueur['nom']} ${joueur['postnom']} ${joueur['prenom']}",
                                      style: style2,
                                    ),
                                  ),
                                  pw.Expanded(
                                    flex: 1,
                                    child: pw.Text(
                                      "${joueur['numero']}",
                                      style: style2,
                                    ),
                                  ),
                                  pw.Expanded(
                                    flex: 2,
                                    child: pw.Text(
                                      "${joueur['licence']}",
                                      style: style2,
                                    ),
                                  )
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 5,
                        child: pw.Container(
                          alignment: pw.Alignment.topCenter,
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            children: List.generate(
                                arbitreController
                                    .joueurEquipeRemplacantA.length, (index) {
                              //
                              Map joueur = arbitreController
                                  .joueurEquipeRemplacantA[index];
                              //
                              return pw.Row(
                                children: [
                                  pw.Expanded(
                                    flex: 7,
                                    child: pw.Text(
                                      "${joueur['nom']} ${joueur['postnom']} ${joueur['prenom']}",
                                      style: style2,
                                    ),
                                  ),
                                  pw.Expanded(
                                    flex: 1,
                                    child: pw.Text(
                                      "${joueur['numero']}",
                                      style: style2,
                                    ),
                                  ),
                                  pw.Expanded(
                                    flex: 2,
                                    child: pw.Text(
                                      "${joueur['licence']}",
                                      style: style2,
                                    ),
                                  )
                                ],
                              );
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
                        arbitreController.joueurRemplacantA.length, (i) {
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${arbitreController.joueurRemplacantA[i]['entrant']['nom']} ${arbitreController.joueurRemplacantA[i]['entrant']['postnom']} ${arbitreController.joueurRemplacantA[i]['entrant']['prenom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${arbitreController.joueurRemplacantA[i]['sortant']['nom']} ${arbitreController.joueurRemplacantA[i]['sortant']['postnom']} ${arbitreController.joueurRemplacantA[i]['sortant']['prenom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${arbitreController.joueurRemplacantA[i]['minute']} min",
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
                        arbitreController.joueurRemplacantB.length, (i) {
                      //
                      //
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${arbitreController.joueurRemplacantB[i]['entrant']['nom']} ${arbitreController.joueurRemplacantB[i]['entrant']['postnom']} ${arbitreController.joueurRemplacantB[i]['entrant']['prenom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(
                              "${arbitreController.joueurRemplacantB[i]['sortant']['nom']} ${arbitreController.joueurRemplacantB[i]['sortant']['postnom']} ${arbitreController.joueurRemplacantB[i]['sortant']['prenom']}",
                              style: style2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text(
                              "${arbitreController.joueurRemplacantB[i]['minute']} min",
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
                    "Joueurs equipe B",
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
                        flex: 5,
                        child: pw.Text(
                          "Titulaires",
                          style: style1,
                        ),
                      ),
                      pw.Expanded(
                        flex: 5,
                        child: pw.Text(
                          "Remplaçants",
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
                  //padding: pw.EdgeInsets.all(11),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                    children: [
                      pw.Expanded(
                        flex: 5,
                        child: pw.Container(
                          // decoration:
                          //     pw.BoxDecoration(border: pw.Border.all(color: PdfColors.black)),
                          // width: double.maxFinite,
                          // padding: pw.EdgeInsets.all(5),
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            children: List.generate(
                                arbitreController.joueurEqupeB.length, (index) {
                              //
                              Map joueur =
                                  arbitreController.joueurEqupeB[index];
                              //
                              return pw.Row(
                                children: [
                                  pw.Expanded(
                                    flex: 7,
                                    child: pw.Text(
                                      "${joueur['nom']} ${joueur['postnom']} ${joueur['prenom']}",
                                      style: style2,
                                    ),
                                  ),
                                  pw.Expanded(
                                    flex: 1,
                                    child: pw.Text(
                                      "${joueur['numero']}",
                                      style: style2,
                                    ),
                                  ),
                                  pw.Expanded(
                                    flex: 2,
                                    child: pw.Text(
                                      "${joueur['licence']}",
                                      style: style2,
                                    ),
                                  )
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 5,
                        child: pw.Container(
                          alignment: pw.Alignment.topCenter,
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            children: List.generate(
                                arbitreController
                                    .joueurEquipeRemplacantB.length, (index) {
                              //
                              Map joueur = arbitreController
                                  .joueurEquipeRemplacantB[index];
                              //
                              return pw.Row(
                                children: [
                                  pw.Expanded(
                                    flex: 7,
                                    child: pw.Text(
                                      "${joueur['nom']} ${joueur['postnom']} ${joueur['prenom']}",
                                      style: style2,
                                    ),
                                  ),
                                  pw.Expanded(
                                    flex: 1,
                                    child: pw.Text(
                                      "${joueur['numero']}",
                                      style: style2,
                                    ),
                                  ),
                                  pw.Expanded(
                                    flex: 2,
                                    child: pw.Text(
                                      "${joueur['licence']}",
                                      style: style2,
                                    ),
                                  )
                                ],
                              );
                            }),
                          ),
                        ),
                      )
                    ],
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
                        arbitreController.avertissementsJoueursGeneralA.length,
                        (index) {
                      //
                      Map joueur = arbitreController
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
                        arbitreController.expulssionsJoueursGeneralA.length,
                        (index) {
                      //
                      Map joueur =
                          arbitreController.expulssionsJoueursGeneralA[index];
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
                        arbitreController.butsJoueursGeneralA.length, (index) {
                      //
                      Map joueur = arbitreController.butsJoueursGeneralA[index];
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
                        arbitreController.avertissementsJoueursGeneralB.length,
                        (index) {
                      //
                      Map joueur = arbitreController
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
                        arbitreController.expulssionsJoueursGeneralB.length,
                        (index) {
                      //
                      Map joueur =
                          arbitreController.expulssionsJoueursGeneralB[index];
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
                        arbitreController.butsJoueursGeneralB.length, (index) {
                      //
                      Map joueur = arbitreController.butsJoueursGeneralB[index];
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
                  height: 20,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Officier equipe A",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ),
                pw.Column(
                  children: List.generate(
                      arbitreController.officierEquipeA.length, (i) {
                    //
                    return pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Expanded(
                          flex: 6,
                          child: block("Noms",
                              "${arbitreController.officierEquipeA[i]['nom']}"),
                        ),
                        pw.Expanded(
                          flex: 4,
                          child: block("Fonction",
                              "${arbitreController.officierEquipeA[i]['fonction']}"),
                        ),
                      ],
                    );
                  }),
                ),

                pw.SizedBox(
                  height: 10,
                ),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Officier equipe B",
                    style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ),
                pw.Column(
                  children: List.generate(
                      arbitreController.officierEquipeA.length, (i) {
                    //
                    return pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Expanded(
                          flex: 6,
                          child: block("Noms",
                              "${arbitreController.officierEquipeB[i]['nom']}"),
                        ),
                        pw.Expanded(
                          flex: 4,
                          child: block("Fonction",
                              "${arbitreController.officierEquipeB[i]['fonction']}"),
                        ),
                      ],
                    );
                  }),
                ),

                pw.SizedBox(
                  height: 10,
                ),
                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 15,
                  child: pw.Text(
                    "Observations eventuelles",
                    style: style1,
                  ),
                ),
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  //height: 15,
                  child: pw.Text(
                    arbitreController.observationEventuelle.value.text,
                    style: style2,
                  ),
                ),

                pw.SizedBox(
                  height: 10,
                ),
                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 15,
                  child: pw.Text(
                    "Incidents",
                    style: style1,
                  ),
                ),
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  //height: 15,
                  child: pw.Text(
                    arbitreController.incident.value.text,
                    style: style2,
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 15,
                  child: pw.Text(
                    "Observations",
                    style: style1,
                  ),
                ),
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  //height: 15,
                  child: pw.Text(
                    arbitreController.observation.value.text,
                    style: style2,
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                //
                pw.Container(
                  color: PdfColors.black,
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  height: 15,
                  child: pw.Text(
                    "Reserves",
                    style: style1,
                  ),
                ),
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black)),
                  width: double.maxFinite,
                  padding: pw.EdgeInsets.all(5),
                  //height: 15,
                  child: pw.Text(
                    arbitreController.reserves.value.text,
                    style: style2,
                  ),
                ),
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
        fileName: "Rapport arbitre central - journéé playoff.pdf");

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
