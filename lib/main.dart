import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyto_professor/Routes/Home.dart';
import 'package:tyto_professor/Routes/Login.dart';
import 'package:tyto_professor/Routes/NotSupported.dart';
import 'package:tyto_professor/Wrapper.dart';

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
      initialRoute: Wrapper.routeName,
      getPages: [
        GetPage(
          name: Wrapper.routeName,
          page: () => Wrapper(),
        ),
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
