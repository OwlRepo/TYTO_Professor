import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyto_professor/Constants/TytoColors.dart';
import 'package:tyto_professor/Providers/LoadingText.dart';

import 'Home.dart';

class LoadingScreen extends StatefulWidget {
  static const routeName = '/loading';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: TytoColors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Home.routeName);
              },
              child: SpinKitFadingCube(
                color: TytoColors.darkMintGreen,
                size: 100.0,
              ),
            ),
            SizedBox(height: 70.0),
            Obx(
              () => Text(
                '${LoadingText.textEvent.value}',
                style: GoogleFonts.raleway(
                  color: TytoColors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
