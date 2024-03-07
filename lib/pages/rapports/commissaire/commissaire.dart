import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/utils/impression_rapport_com.dart';
import 'formulaire_com_1/formulaire_com_1.dart';
import 'formulaire_com_2/formulaire_com_2.dart';
import 'formulaire_com_3/formulaire_com_3.dart';
import 'formulaire_com_4/formulaire_com_4.dart';
import 'formulaire_com_5/formulaire_com_5.dart';
import 'formulaire_com_6/formulaire_com_6.dart';
import 'formulaire_com_7/formulaire_com_7.dart';
import 'preview_com.dart';
import 'package:flutter/services.dart';

class CommissaireFormulaire extends StatelessWidget {
  //
  Map match;
  //
  int local;
  //
  CommissaireFormulaire(this.match, this.local);
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
          length: 7,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Rapport commissaire"),
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
                      7,
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
                        FormulaireCom1(controller, match),
                        FormulaireCom2(controller),
                        FormulaireCom3(controller),
                        FormulaireCom4(controller),
                        FormulaireCom5(controller),
                        FormulaireCom6(controller),
                        FormulaireCom7(controller, match, local),
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
                //
                final ByteData image2 =
                    await rootBundle.load('assets/LOGO VERTICAL HD.png');

                Uint8List img2 = (image2).buffer.asUint8List();
                //

                RapportCommissaireImpression.imprimer(img1, img2);
                //Get.to(PreviewCom());
                //
              },
              child: Icon(Icons.print),
            ),
          ),
        ),
      ),
    );
  }
}
