import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyto_professor/Constants/TytoColors.dart';
import 'package:tyto_professor/Widgets/Login/LoginForm.dart';

class LoginFormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 5,
      child: Container(
        decoration: BoxDecoration(
          color: TytoColors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'TY',
                    style: GoogleFonts.raleway(
                      color: TytoColors.darkMintGreen,
                      fontSize: 90.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: 'TO\n',
                    style: GoogleFonts.raleway(
                      color: TytoColors.white,
                      fontSize: 90.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: 'MOBILE LEARNING MANAGEMENT SYSTEM',
                    style: GoogleFonts.raleway(
                      color: TytoColors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _screenWidth * .06),
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'WELCOME!\n',
                      style: GoogleFonts.raleway(
                        color: TytoColors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Please log in to continue...',
                      style: GoogleFonts.raleway(
                        color: TytoColors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            LoginForm(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
