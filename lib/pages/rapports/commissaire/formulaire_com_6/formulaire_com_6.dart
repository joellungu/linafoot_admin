import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/commissaire/commissaire_controller.dart';

class FormulaireCom6 extends StatelessWidget {
  //
  PageController controller;
  //
  CommissaireController2 commissaireController = Get.find();
  //
  RxInt personnalite = 1.obs;

  List personnalites = [
    "Décidé",
    "Indécis",
    "anxieux",
    "Influençable face au public"
  ];
  //
  List x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  //
  RxInt faceJoueur = 1.obs;
  //
  List faceJoueurs = ["Partial", "Personnalité forte", "Personnalité faible"];
  //
  RxInt appreciation = 1.obs;
  TextEditingController appreciationCommentaire = TextEditingController();
  //____________________________________________________________________________
  RxInt physique = 1.obs;
  RxInt cpFaceJoueur = 1.obs;
  TextEditingController textPhysique = TextEditingController();
  //____________________________________________________________________________
  RxInt capacite = 1.obs;
  RxInt caFaceJoueur = 1.obs;
  TextEditingController textCapacite = TextEditingController();
  //____________________________________________________________________________
  RxInt execution = 1.obs;
  RxInt exFaceJoueur = 1.obs;
  TextEditingController textExecution = TextEditingController();
  //____________________________________________________________________________
  RxInt discipline = 1.obs;
  RxInt diFaceJoueur = 1.obs;
  TextEditingController textDiscipline = TextEditingController();
  //____________________________________________________________________________
  FormulaireCom6(this.controller) {
    //
    String rr = "1";
    //
    print("rapport: ${commissaireController.conditionPhysique['physique']}");
    print(
        "rapport: ${commissaireController.conditionPhysique['cpFaceJoueur']}");
    print(
        "rapport: ${commissaireController.conditionPhysique['physiqueCommentaire']}");

    //personnalite.value =
    //  int.parse("${commissaireController.personnalite['personnalite']}");
    //faceJoueur.value =
    //  int.parse("${commissaireController.personnalite['faceJoueur']}");
    //appreciation.value =
    //  int.parse("${commissaireController.personnalite['appreciation']}");
    appreciationCommentaire.text =
        commissaireController.personnalite['appreciationCommentaire'] ?? "";
    //
    //__________________________________________________________________________

    physique.value = commissaireController.conditionPhysique['physique'] ?? 1;
    cpFaceJoueur.value = commissaireController.conditionPhysique['index'] ?? 1;
    textPhysique.text =
        commissaireController.conditionPhysique['physiqueCommentaire'] ?? "";

    //__________________________________________________________________________

    capacite.value = commissaireController.capacite['capacite'] ?? 1;
    caFaceJoueur.value = commissaireController.capacite['index'] ?? 1;
    textCapacite.text =
        commissaireController.capacite['capaciteCommentaire'] ?? "";

    //__________________________________________________________________________

    execution.value = commissaireController.execution['execution'] ?? 1;
    exFaceJoueur.value = commissaireController.execution['index'] ?? 1;
    textExecution.text =
        commissaireController.execution['executionCommentaire'] ?? "";

    //__________________________________________________________________________

    discipline.value = commissaireController.discipline['discipline'] ?? 1;
    diFaceJoueur.value = commissaireController.discipline['index'] ?? 1;
    textDiscipline.text =
        commissaireController.discipline['disciplineCommentaire'] ?? "";

    //__________________________________________________________________________
    //
  }

  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      children: [
        //
        const SizedBox(
          height: 10,
        ),
        //
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Appréciation sur la performance de l'arbitre",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Personnalité",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 60,
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
                  //personnalite.value = e as int;
                },
                value: personnalite.value,
                items: List.generate(
                  personnalites.length,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text("${personnalites[index]}"),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Face Joueur",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              DropdownButtonHideUnderline(
                child: Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    onChanged: (e) {
                      //
                      faceJoueur.value = e as int;
                    },
                    value: faceJoueur.value,
                    items: List.generate(
                      faceJoueurs.length,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text("${faceJoueurs[index]}"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  decoration: const BoxDecoration(
                      //border: Border.all(color: Colors.black, width: 1),
                      ),
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton(
                        onChanged: (e) {
                          //
                          //appreciation.value = e as int;
                        },
                        value: appreciation.value,
                        items: List.generate(
                          10,
                          (index) => DropdownMenuItem(
                            value: index + 1,
                            child: Text(
                              "${index + 1}",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(" X 1 "),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Obx(
                    () => Text(
                      "${appreciation.value * 1}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            label: Text("Commentaire"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.blue,
          height: 2,
        ),
//////////////////////////////////////////////////
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Condition physique ",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              DropdownButtonHideUnderline(
                child: Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    onChanged: (e) {
                      //
                      //cpFaceJoueur.value = e as int;
                    },
                    value: cpFaceJoueur.value,
                    items: List.generate(
                      faceJoueurs.length,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text("${faceJoueurs[index]}"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: DropdownButtonHideUnderline(
                  child: Obx(
                    () => DropdownButton(
                      isExpanded: true,
                      onChanged: (e) {
                        //
                        //physique.value = e as int;
                      },
                      value: physique.value,
                      items: List.generate(
                        10,
                        (index) => DropdownMenuItem(
                          value: index + 1,
                          child: Text("${index + 1}"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(" X 2 "),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Obx(
                    () => Text(
                      "${physique.value * 2}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        TextField(
          maxLines: 4,
          controller: textPhysique,
          decoration: InputDecoration(
            label: Text("Commentaire"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.blue,
          height: 2,
        ),
/////////////////////////////////////////////////////////////////
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Capacités quant à l'arbitrage ",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              DropdownButtonHideUnderline(
                child: Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    onChanged: (e) {
                      //
                      //caFaceJoueur.value = e as int;
                    },
                    value: caFaceJoueur.value,
                    items: List.generate(
                      faceJoueurs.length,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text("${faceJoueurs[index]}"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: DropdownButtonHideUnderline(
                  child: Obx(
                    () => DropdownButton(
                      isExpanded: true,
                      onChanged: (e) {
                        //
                        //capacite.value = e as int;
                      },
                      value: capacite.value,
                      items: List.generate(
                        10,
                        (index) => DropdownMenuItem(
                          value: index + 1,
                          child: Text("${index + 1}"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text("X 3"),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Obx(
                    () => Text(
                      "${capacite.value * 3}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        TextField(
          controller: textCapacite,
          maxLines: 4,
          decoration: InputDecoration(
            label: Text("Commentaire"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.blue,
          height: 2,
        ),
/////////////////////////////////////////////////////////////////
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Execution de ses obligations",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              DropdownButtonHideUnderline(
                child: Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    onChanged: (e) {
                      //
                      //exFaceJoueur.value = e as int;
                    },
                    value: exFaceJoueur.value,
                    items: List.generate(
                      faceJoueurs.length,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text("${faceJoueurs[index]}"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: DropdownButtonHideUnderline(
                  child: Obx(
                    () => DropdownButton(
                      isExpanded: true,
                      onChanged: (e) {
                        //
                        //execution.value = e as int;
                      },
                      value: execution.value,
                      items: List.generate(
                        10,
                        (index) => DropdownMenuItem(
                          value: index + 1,
                          child: Text("${index + 1}"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text("X 2"),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Obx(
                    () => Text(
                      "${execution.value * 2}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        TextField(
          maxLines: 4,
          controller: textExecution,
          decoration: InputDecoration(
            label: Text("Commentaire"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.blue,
          height: 2,
        ),
/////////////////////////////////////////////////////////////////
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Discipline et direction",
            style: textStyle,
          ),
        ),
        //
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              DropdownButtonHideUnderline(
                child: Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    onChanged: (e) {
                      //
                      //diFaceJoueur.value = e as int;
                    },
                    value: diFaceJoueur.value,
                    items: List.generate(
                      faceJoueurs.length,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text("${faceJoueurs[index]}"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: DropdownButtonHideUnderline(
                  child: Obx(
                    () => DropdownButton(
                      isExpanded: true,
                      onChanged: (e) {
                        //
                        //discipline.value = e as int;
                      },
                      value: discipline.value,
                      items: List.generate(
                        10,
                        (index) => DropdownMenuItem(
                          value: index + 1,
                          child: Text("${index + 1}"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text("X 2"),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Obx(
                    () => Text(
                      "${discipline.value * 2}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        TextField(
          maxLines: 4,
          controller: textDiscipline,
          decoration: InputDecoration(
            label: Text("Commentaire"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.blue,
          height: 2,
        ),
/////////////////////////////////////////////////////////////////

        // const SizedBox(
        //   height: 20,
        // ),
        // //
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     InkWell(
        //       onTap: () {
        //         //
        //         controller.previousPage(
        //             duration: const Duration(milliseconds: 300),
        //             curve: Curves.ease);
        //       },
        //       child: Container(
        //         decoration: const BoxDecoration(
        //           color: Colors.blue,
        //           borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(30),
        //             bottomLeft: Radius.circular(30),
        //           ),
        //         ),
        //         alignment: Alignment.center,
        //         height: 50,
        //         width: 100,
        //         child: const Text(
        //           "Retour",
        //           style: TextStyle(
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //     InkWell(
        //       onTap: () {
        //         //
        //         controller.nextPage(
        //             duration: const Duration(milliseconds: 300),
        //             curve: Curves.ease);
        //         //
        //       },
        //       child: Container(
        //         decoration: const BoxDecoration(
        //           color: Colors.blue,
        //           borderRadius: BorderRadius.only(
        //             topRight: Radius.circular(30),
        //             bottomRight: Radius.circular(30),
        //           ),
        //         ),
        //         alignment: Alignment.center,
        //         height: 50,
        //         width: 100,
        //         child: const Text(
        //           "Suivant 6/7",
        //           style: TextStyle(
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  //
  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
