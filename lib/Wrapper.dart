import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyto_professor/Routes/Home.dart';
import 'package:tyto_professor/Routes/Login.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);
  static const routeName = '/';
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  var _isUserLoggedIn = false;

  _checkIfUserIsLoggedIn() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    if (_sharedPreferences.getBool('isLoggedIn') != null) {
      if (_sharedPreferences.getBool('isLoggedIn')) {
        setState(() {
          _isUserLoggedIn = !_isUserLoggedIn;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checkIfUserIsLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return _isUserLoggedIn ? Home() : Login();
  }
}
