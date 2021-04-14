import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyto_professor/Routes/Home.dart';
import 'package:tyto_professor/Routes/LoadingScreen.dart';
import 'package:tyto_professor/Routes/Login.dart';
import 'package:tyto_professor/Routes/NotSupported.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TYTO',
      defaultTransition: Transition.fadeIn,
      initialRoute: Login.routeName,
      getPages: [
        GetPage(
          name: Login.routeName,
          page: () => Login(),
        ),
        GetPage(
          name: NotSupported.routeName,
          page: () => NotSupported(),
        ),
        GetPage(
          name: Home.routeName,
          page: () => Home(),
        ),
      ],
    );
  }
}
