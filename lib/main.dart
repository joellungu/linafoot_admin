import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:window_manager/window_manager.dart';
import 'pages/accueil.dart';
import 'pages/agents/agents_controller.dart';
import 'pages/arbitres/arbitre_controller.dart';
import 'pages/calendrier/calendrier_controller.dart';
import 'pages/calendrier/matchs/journee_controller.dart';
import 'pages/calendrier/matchs/match_controller.dart';
import 'pages/commissaires/commissaire_controller.dart';
import 'pages/equipes/equipe_controller.dart';
import 'pages/joueurs/joueur_controller.dart';
import 'pages/rapports/arbitre/arbitre_controller.dart';
import 'pages/rapports/commissaire/commissaire_controller.dart';
import 'pages/rapports/officier/officier_controller.dart';
import 'pages/rapports/rapport_controller.dart';
import 'pages/splash.dart';
import 'pages/stade/stade_controller.dart';
import 'utils/test_tab.dart';

List entiteAdmin = [];

void main() async {
  //
  EquipeController equipeController = Get.put(EquipeController());
  //
  JoueurController joueurController = Get.put(JoueurController());
  //
  CommissaireController commissaireController =
      Get.put(CommissaireController());
  //____________________________________________________________________________
  CommissaireController2 commissaireController2 =
      Get.put(CommissaireController2());
  //
  ArbitreController2 arbitreController2 = Get.put(ArbitreController2());
  //____________________________________________________________________________
  ArbitreController arbitresController = Get.put(ArbitreController());
  //
  CalendrierController calendrierController = Get.put(CalendrierController());
  //
  MatchController matchController = Get.put(MatchController());
  //
  JourneeController journeeController = Get.put(JourneeController());
  //
  OfficierController2 officierController2 = Get.put(OfficierController2());
  //
  RapportController rapportController = Get.put(RapportController());
  //
  StadeController stadeController = Get.put(StadeController());
  //
  AgentsController agentsController = Get.put(AgentsController());
  //
  //pourcent(10);
  //
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1300, 800),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    fullScreen: false,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  //
  await GetStorage.init();
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //
    //load(context);
    // _deleteCacheDir();
    // _deleteAppDir();
    //
    return GetMaterialApp(
      title: 'LINAFOOT ADMIN',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 112, 0, 0),
        ),
        textTheme: const TextTheme(
          titleSmall: TextStyle(fontSize: 10),
        ),
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),

        useMaterial3: true,
        //cardColor: Colors.white,
      ),
      home:
          //TestTab()
          Accueil(),
    );
  }
}
