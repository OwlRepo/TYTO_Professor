import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyto_professor/Constants/TytoColors.dart';
import 'package:tyto_professor/Routes/Home.dart';
import 'package:tyto_professor/Routes/Login.dart';

class LoginAuth extends GetxController {
  static RxBool isAuthenticating = false.obs;
  static RxBool isLoginSuccessful = false.obs;
  static RxString _loginFeedback = ''.obs;

  static var _db = FirebaseFirestore.instance.collection('ProfessorAccounts');

  static _showLoginAuthFeedback({BuildContext context, String message, Color backgroundColor, Color textColor}) {
    showToastWidget(
      Container(
        padding: EdgeInsets.all(
          20.0,
        ),
        margin: EdgeInsets.all(
          20.0,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
        ),
        child: Text(
          message,
          style: GoogleFonts.raleway(
            color: TytoColors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      context: context,
      animation: StyledToastAnimation.slideFromBottomFade,
      animDuration: Duration(
        milliseconds: 100,
      ),
      position: StyledToastPosition(
        align: Alignment.bottomCenter,
      ),
    );
  }

  static void authenticateLogin({String accountID, String password, BuildContext context}) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setBool('isLoggedIn', false);
    isAuthenticating.value = true;

    if (accountID == '' || password == '') {
      _showLoginAuthFeedback(
        backgroundColor: TytoColors.darkMintGreen,
        context: context,
        message: 'Please fill out all the text fields.',
      );
      isAuthenticating.value = false;
    } else if (await _db.doc(accountID).get().then((doc) => doc.exists) == true) {
      _db.doc(accountID).get().then((snapshot) {
        if (snapshot.data()['password'].toString() == password) {
          _sharedPreferences.setBool('isLoggedIn', true);
          _sharedPreferences.setString('loggedInAccountID', accountID);
          print(_sharedPreferences.getString('loggedInAccountID'));
          _loginFeedback.value = 'Log in Sucessful';
          _showLoginAuthFeedback(
            backgroundColor: TytoColors.correctGreen,
            context: context,
            message: _loginFeedback.value,
          );
          Get.toNamed(Home.routeName);

          isAuthenticating.value = false;
        } else {
          isAuthenticating.value = false;
          _loginFeedback.value = 'Wrong password';
          _showLoginAuthFeedback(
            backgroundColor: TytoColors.wrongRed,
            context: context,
            message: _loginFeedback.value,
            textColor: TytoColors.white,
          );
        }
      });
    } else {
      isAuthenticating.value = false;
      _loginFeedback.value = 'Account ID does not exist';
      _showLoginAuthFeedback(
        backgroundColor: TytoColors.wrongRed,
        context: context,
        message: _loginFeedback.value,
        textColor: TytoColors.white,
      );
    }
  }

  static void logOut() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setBool('isLoggedIn', false);
    _sharedPreferences.setString('loggedInAccountID', '');
    Get.toNamed(Login.routeName);
  }
}
