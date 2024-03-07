import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/commissaire/commissaire_controller.dart';

class FormulaireCom5 extends StatelessWidget {
  //
  PageController controller;
  //
  CommissaireController2 commissaireController = Get.find();
  //
  RxInt organisationGenerale = 1.obs;
  RxInt serviceControle = 1.obs;
  //
  RxInt servicePolice = 1.obs;
  RxInt serviceSanitaire = 1.obs;
  RxInt organisation = 1.obs;
  //
  TextEditingController nombreSpectateur = TextEditingController();
  //
  List etats = [
    "Très mauvais",
    "Mauvais",
    "Insuffisant",
    "Moyen",
    "Bien",
    "Très bien",
    "Excellent"
  ];
  //
  FormulaireCom5(this.controller);

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
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Organisation Générale",
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
                  //commissaireController.organisationGenerale.value = e as int;
                },
                value: commissaireController.organisationGenerale.value,
                items: List.generate(
                  etats.length,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text("${etats[index]}"),
                  ),
                ),
              ),
            ),
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Service de Controle",
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
                  //commissaireController.serviceControle.value = e as int;
                },
                value: commissaireController.serviceControle.value,
                items: List.generate(
                  etats.length,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text("${etats[index]}"),
                  ),
                ),
              ),
            ),
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Service de police",
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
                  //commissaireController.servicePolice.value = e as int;
                },
                value: commissaireController.servicePolice.value,
                items: List.generate(
                  etats.length,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text("${etats[index]}"),
                  ),
                ),
              ),
            ),
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Service Sanitaire",
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
                  //commissaireController.serviceSanitaire.value = e as int;
                },
                value: commissaireController.serviceSanitaire.value,
                items: List.generate(
                  etats.length,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text("${etats[index]}"),
                  ),
                ),
              ),
            ),
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Organisation",
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
                  //commissaireController.organisation.value = e as int;
                },
                value: commissaireController.organisation.value,
                items: List.generate(
                  etats.length,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text("${etats[index]}"),
                  ),
                ),
              ),
            ),
          ),
        ),

        //
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
        //         //
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
        //           "Suivant 5/7",
        //           style: TextStyle(
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // //
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
