import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commissaire_controller.dart';

class FormulaireCom4 extends StatelessWidget {
  //
  PageController controller;
  //
  TextEditingController incident = TextEditingController();
  //
  CommissaireController2 commissaireController = Get.find();
  //
  FormulaireCom4(this.controller);
  //
  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      children: [
        const SizedBox(
          height: 10,
        ),
        //
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Incident"),
        ),
        //
        TextField(
          controller: commissaireController.incident.value,
          maxLines: 20,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
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
        //           "Suivant 4/7",
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
}
