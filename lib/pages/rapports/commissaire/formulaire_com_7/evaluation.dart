import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../commissaire_controller.dart';

class Evaluation extends StatelessWidget {
  //
  String titre;
  Evaluation(this.titre);
  //
  TextEditingController commentaire = TextEditingController();
  //
  CommissaireController2 commissaireController = Get.find();
  //
  RxInt evaluation = 1.obs;
  List evaluations = [
    "1",
    "1.5",
    "2",
    "2.5",
    "3",
    "3.5",
    "4",
    "4.5",
    "5",
    "5.5",
    "6",
    "6.5",
    "7",
    "7.5",
    "8",
    "8.5",
    "9",
    "9.5",
    "10",
  ];
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(titre),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Arbitre assistant",
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
                    //         ListArbitre("Arbitre assistant 1"), context);
                    //     //
                    //   },
                    //   title: const Text("Ajouter"),
                    //   trailing: const Icon(Icons.add),
                    // ),
                    Obx(
                      () =>
                          commissaireController.arbitreAssistant1['nom'] != null
                              ? ListTile(
                                  onTap: () {
                                    //
                                  },
                                  leading: SvgPicture.asset(
                                    'assets/IcTwotoneSupportAgent.svg',
                                    width: 25,
                                    height: 25,
                                    color: Colors.blue,
                                    semanticsLabel: 'IcTwotoneSupportAgent.svg',
                                  ),
                                  title: Text(
                                      "${commissaireController.arbitreAssistant1['nom']}"),
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Region: ",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Text(
                                          "${commissaireController.arbitreAssistant1['region']}"),
                                    ],
                                  ),
                                  // trailing: IconButton(
                                  //   icon: Icon(
                                  //     Icons.delete,
                                  //     color: Colors.red,
                                  //   ),
                                  //   onPressed: () {
                                  //     //
                                  //     commissaireController
                                  //         .arbitreAssistant1.value = {};
                                  //     //
                                  //   },
                                  // ),
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
                  "Evaluation",
                  style: textStyle,
                ),
              ),
              //
              Container(
                padding: const EdgeInsets.only(left: 10),
                //height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade500,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: Obx(
                    () => DropdownButton(
                      onChanged: (e) {
                        //
                        //evaluation.value = e as int;
                        //
                      },
                      value: evaluation.value,
                      items: List.generate(
                        evaluations.length,
                        (index) => DropdownMenuItem(
                          value: index + 1,
                          child: Text("${evaluations[index]}"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //
              const SizedBox(
                height: 15,
              ),

              TextField(
                maxLines: 4,
                controller: commentaire,
                decoration: InputDecoration(
                  label: Text("Commentaire"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  //
                  if (titre == "Evaluation des arbitres de reserve") {
                    commissaireController.evaluationArbitreReserve.add(
                      {
                        "arbitre": commissaireController.arbitreAssistant1,
                        "evaluation": evaluations[evaluation.value],
                        "commentaire": commentaire.text,
                      },
                    );
                  } else {
                    commissaireController.evaluationArbitreAssistant.add(
                      {
                        "arbitre": commissaireController.arbitreAssistant1,
                        "evaluation": evaluations[evaluation.value],
                        "commentaire": commentaire.text,
                      },
                    );
                  }
                  //
                  Get.back();
                  //
                },
                child: Container(
                  height: 50,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: const Text(
                    "Enregistrer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
