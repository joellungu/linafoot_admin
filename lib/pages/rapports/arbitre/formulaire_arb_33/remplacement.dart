import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/arbitre/arbitre_controller.dart';

class Remplacement extends StatelessWidget {
  //
  String equipe;
  Remplacement(this.equipe);
  //
  ArbitreController2 arbitreController = Get.find();
  //
  TextEditingController minute = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("Remplacement"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          //
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Entrant",
              style: textStyle,
            ),
          ),
          Container(
            //height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade600,
              ),
            ),
            child: Column(
              children: [
                // ListTile(
                //   onTap: () {
                //     //
                //     Recherche.affiche(
                //         ListJoueurs("entrant", "Equipe A" == equipe ? 1 : 2),
                //         context);
                //     //
                //   },
                //   title: const Text("Ajouter"),
                //   trailing: const Icon(Icons.add),
                // ),
                Obx(
                  () => arbitreController.joueurRemplacantEntrant['nom'] != null
                      ? ListTile(
                          onTap: () {
                            //
                          },
                          leading: SvgPicture.asset(
                            'assets/IcTwotoneSports.svg',
                            width: 25,
                            height: 25,
                            color: Colors.blue,
                            semanticsLabel: 'IcTwotoneSports.svg',
                          ),
                          title: Text(
                              "${arbitreController.joueurRemplacantEntrant['nom']}"),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Numero: ",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                  "${arbitreController.joueurRemplacantEntrant['numero']}")
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              //
                              arbitreController.joueurRemplacantEntrant.value =
                                  {};
                              //
                            },
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          //
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Sortant",
              style: textStyle,
            ),
          ),
          Container(
            //height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade600,
              ),
            ),
            child: Column(
              children: [
                // ListTile(
                //   onTap: () {
                //     //
                //     Recherche.affiche(
                //         ListJoueurs("sortant", "Equipe A" == equipe ? 1 : 2),
                //         context);
                //     //
                //   },
                //   title: const Text("Ajouter"),
                //   trailing: const Icon(Icons.add),
                // ),
                Obx(
                  () => arbitreController.joueurRemplacantSortant['nom'] != null
                      ? ListTile(
                          onTap: () {
                            //
                          },
                          leading: SvgPicture.asset(
                            'assets/IcTwotoneSports.svg',
                            width: 25,
                            height: 25,
                            color: Colors.blue,
                            semanticsLabel: 'IcTwotoneSports.svg',
                          ),
                          title: Text(
                              "${arbitreController.joueurRemplacantSortant['nom']}"),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Numero: ",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                  "${arbitreController.joueurRemplacantSortant['numero']}")
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              //
                              arbitreController.joueurRemplacantSortant.value =
                                  {};
                              //
                            },
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          //
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Minute(s)",
              style: textStyle,
            ),
          ),
          Container(
            //height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade600,
              ),
            ),
            child: TextField(
              controller: minute,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          //
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              //Equipe A
              if ("Equipe A" == equipe) {
                arbitreController.joueurRemplacantA.add({
                  "entrant": arbitreController.joueurRemplacantEntrant.value,
                  "sortant": arbitreController.joueurRemplacantSortant.value,
                  "minute": minute.text,
                });
              } else {
                arbitreController.joueurRemplacantB.add({
                  "entrant": arbitreController.joueurRemplacantEntrant.value,
                  "sortant": arbitreController.joueurRemplacantSortant.value,
                  "minute": minute.text,
                });
              }
              Get.back();
            },
            child: Text("Ajouter"),
          ),
        ],
      ),
    );
  }

  //
  //
  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
