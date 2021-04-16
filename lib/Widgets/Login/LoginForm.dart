import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyto_professor/Constants/TytoColors.dart';
import 'package:tyto_professor/Providers/LoginAuth.dart';
import 'package:tyto_professor/Routes/Home.dart';
import 'package:tyto_professor/Routes/LoadingScreen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _isPasswordHidden = true;
  final _accountIDController = TextEditingController();
  final _passwordController = TextEditingController();

  String _generateMd5({@required String input}) {
    return md5.convert(utf8.encode(input)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .06,
            vertical: 20.0,
          ),
          child: TextFormField(
            controller: _accountIDController,
            cursorColor: TytoColors.darkMintGreen,
            keyboardType: TextInputType.number,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: 'Account ID',
              hintStyle: GoogleFonts.raleway(),
              prefixIcon: Icon(
                Icons.account_circle,
                color: TytoColors.black,
              ),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: TytoColors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .06,
          ),
          child: Tooltip(
            message: 'Password is case sensitive',
            child: TextFormField(
              controller: _passwordController,
              cursorColor: TytoColors.darkMintGreen,
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                LoginAuth.isAuthenticating.value == true
                    ? print('autheticating')
                    : LoginAuth.authenticateLogin(
                        accountID: _accountIDController.text,
                        password: _generateMd5(input: _passwordController.text),
                        context: context,
                      );
              },
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: GoogleFonts.raleway(),
                prefixIcon: Icon(
                  Icons.lock,
                  color: TytoColors.black,
                ),
                suffixIcon: Container(
                  width: 10.0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                    child: FaIcon(
                      _isPasswordHidden ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                      size: 20.0,
                      color: _isPasswordHidden ? Colors.grey : TytoColors.darkMintGreen,
                    ),
                  ),
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: TytoColors.white,
              ),
              obscureText: _isPasswordHidden,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .06,
            vertical: 10.0,
          ),
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.raleway(
              color: TytoColors.white,
            ),
          ),
        ),
        Divider(
          color: Colors.transparent,
        ),
        SizedBox(
          height: 50.0,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .06,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: TytoColors.darkMintGreen,
                elevation: 5.0,
              ),
              onPressed: () {
                LoginAuth.isAuthenticating.value == true
                    ? print('autheticating')
                    : LoginAuth.authenticateLogin(
                        accountID: _accountIDController.text,
                        password: _generateMd5(input: _passwordController.text),
                        context: context,
                      );
              },
              child: Obx(
                () => LoginAuth.isAuthenticating.value == true
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          TytoColors.white,
                        ),
                      )
                    : Text(
                        'SUBMIT',
                        style: GoogleFonts.raleway(
                          color: TytoColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
