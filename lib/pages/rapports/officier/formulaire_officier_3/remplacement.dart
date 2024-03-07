import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/officier/officier_controller.dart';

class Remplacement extends StatelessWidget {
  //
  String numero;
  Remplacement(this.numero);
  //
  OfficierController2 officierController = Get.find();
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
                ListTile(
                  onTap: () {
                    //
                    //Recherche.affiche(
                    //  ListJoueurs("entrant", "Equipe A" == numero ? 1 : 2),
                    //  context);
                    //
                  },
                  title: const Text("Ajouter"),
                  trailing: const Icon(Icons.add),
                ),
                Obx(
                  () =>
                      officierController.joueurRemplacantEntrant['nom'] != null
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
                                  "${officierController.joueurRemplacantEntrant['nom']}"),
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
                                      "${officierController.joueurRemplacantEntrant['numero']}")
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  officierController
                                      .joueurRemplacantEntrant.value = {};
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
                ListTile(
                  onTap: () {
                    //
                    //Recherche.affiche(
                    //  ListJoueurs("sortant", "Equipe A" == numero ? 1 : 2),
                    //context);
                    //
                  },
                  title: const Text("Ajouter"),
                  trailing: const Icon(Icons.add),
                ),
                Obx(
                  () =>
                      officierController.joueurRemplacantSortant['nom'] != null
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
                                  "${officierController.joueurRemplacantSortant['nom']}"),
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
                                      "${officierController.joueurRemplacantSortant['numero']}")
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  officierController
                                      .joueurRemplacantSortant.value = {};
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
