import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Loader {
  static loading() {
    Get.dialog(
      Center(
        child: Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  static var backgroundColor = HexColor("#DD0707");

  static Widget loadingW() {
    return Center(
      child: Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
