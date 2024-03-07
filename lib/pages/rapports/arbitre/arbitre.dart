import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/arbitre/preview_arb.dart';
import 'package:linafoot_admin/utils/impression_rapport_arb.dart';

import 'formulaire_arb_1/formulaire_arb_1.dart';
import 'formulaire_arb_2/formulaire_arb_2.dart';
import 'formulaire_arb_3/formulaire_arb_3.dart';
import 'formulaire_arb_33/formulaire_arb_33.dart';
import 'formulaire_arb_33/formulaire_arb_333.dart';
import 'formulaire_arb_4/formulaire_arb_4.dart';
import 'formulaire_arb_5/formulaire_arb_5.dart';
import 'formulaire_arb_6/formulaire_arb_6.dart';
import 'formulaire_arb_7/formulaire_arb_7.dart';

class HarbitreRapport extends StatelessWidget {
  //
  Map match;
  //
  int local;
  //
  HarbitreRapport(this.match, this.local);
  //
  PageController controller = PageController();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      color: Colors.red, // Status bar color
      child: SafeArea(
          left: false,
          right: false,
          bottom: false,
          child: DefaultTabController(
            length: 9,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Rapport arbitre centrale"),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: TabBar(
                      tabAlignment: TabAlignment.center,
                      isScrollable: true,
                      labelStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      tabs: List.generate(
                        9,
                        (index) => Tab(
                          text: "Formulaire ${index + 1}",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        width: 500,
                        child: TabBarView(children: [
                          FormulaireArb1(controller),
                          FormulaireArb2(controller),
                          FormulaireArb3(controller),
                          FormulaireArb33(controller),
                          FormulaireArb333(controller),
                          FormulaireArb4(controller),
                          FormulaireArb5(controller),
                          FormulaireArb6(controller),
                          FormulaireArb7(controller, match, local),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  final ByteData image1 = await rootBundle
                      .load('assets/IMG-20240116-WA0003-removebg-preview.png');

                  Uint8List img1 = (image1).buffer.asUint8List();

                  final ByteData image2 =
                      await rootBundle.load('assets/LOGO VERTICAL HD.png');

                  Uint8List img2 = (image2).buffer.asUint8List();

                  RapportArbitreImpression.imprimer(img1, img2);
                  //
                  // Get.to(PreviewArb());
                },
                child: Icon(Icons.print),
              ),
            ),
          )

          // Scaffold(
          //   appBar: AppBar(
          //     title: const Text("Rapport arbitre centrale"),
          //     centerTitle: true,
          //   ),
          //   body: PageView(
          //     controller: controller,
          //     children: [
          //       FormulaireArb1(controller),
          //       FormulaireArb2(controller),
          //       FormulaireArb3(controller),
          //       FormulaireArb33(controller),
          //       FormulaireArb333(controller),
          //       FormulaireArb4(controller),
          //       FormulaireArb5(controller),
          //       FormulaireArb6(controller),
          //       FormulaireArb7(controller, match, local),
          //     ],
          //   ),
          // ),

          ),
    );
  }
}
