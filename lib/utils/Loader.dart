import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
