import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyto_professor/Constants/TytoColors.dart';
import 'package:tyto_professor/Providers/LoginAuth.dart';
import 'package:tyto_professor/Providers/TodaysScheduleList.dart';
import 'package:tyto_professor/Routes/Home.dart';

class Header extends StatelessWidget {
  showMenuModal(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    const List _menuButtons = [];
    showMaterialModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.9,
            padding: EdgeInsets.symmetric(
              horizontal: _screenWidth * 0.06,
              vertical: _screenHeight * 0.05,
            ),
            decoration: BoxDecoration(
              color: TytoColors.lightBlack,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  80.0,
                ),
                topRight: Radius.circular(
                  80.0,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.bars,
                      color: TytoColors.white,
                      size: 40.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'MENU',
                      style: GoogleFonts.raleway(
                        color: TytoColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _screenWidth * 0.02, vertical: _screenHeight * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Home.routeName);
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'TY',
                    style: GoogleFonts.raleway(
                      color: TytoColors.darkMintGreen,
                      fontSize: 60.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: 'TO',
                    style: GoogleFonts.raleway(
                      color: TytoColors.white,
                      fontSize: 60.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _screenWidth < 300
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.bars,
                      color: TytoColors.darkMintGreen,
                      size: 20.0,
                    ),
                    onPressed: () {
                      showMenuModal(context);
                    },
                  ),
                )
              : ElevatedButton.icon(
                  onPressed: () {
                    showMenuModal(context);
                  },
                  icon: FaIcon(FontAwesomeIcons.bars),
                  label: Text(
                    'MENU',
                    style: GoogleFonts.raleway(
                      color: TytoColors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: TytoColors.darkMintGreen,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 20.0,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
