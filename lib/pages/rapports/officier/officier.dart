import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/utils/imperssion_officier.dart';

import 'formulaire_officier_1/formulaire_officier_1.dart';
import 'formulaire_officier_2/formulaire_officier_2.dart';
import 'formulaire_officier_3/formulaire_officier_3.dart';
import 'formulaire_officier_4/formulaire_officier_4.dart';
import 'preview_off.dart';

class OfficierRapport extends StatelessWidget {
  //
  Map match;
  //
  int local;
  //
  OfficierRapport(this.match, this.local);
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
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Rapport 4eme Officier"),
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
                      4,
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
                        FormulaireOffice1(controller),
                        FormulaireOffice2(controller),
                        FormulaireOffice3(controller),
                        FormulaireOffice4(controller, match, local),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                //
                final ByteData image1 = await rootBundle
                    .load('assets/IMG-20240116-WA0003-removebg-preview.png');

                Uint8List img1 = (image1).buffer.asUint8List();

                final ByteData image2 =
                    await rootBundle.load('assets/LOGO VERTICAL HD.png');

                Uint8List img2 = (image2).buffer.asUint8List();

                RapportOfficierImpression.imprimer(img1, img2);
                //
                //Get.to(PreviewOff());
              },
              child: Icon(Icons.print),
            ),
          ),
        ),
      ),
    );
  }
}
