import 'package:flutter/material.dart';
import 'package:tyto_professor/Routes/NotSupported.dart';
import 'package:tyto_professor/Widgets/Login/LoginFormContainer.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _screenWidth < 1400
          ? _screenWidth < 400 && _screenHeight < 550
              ? NotSupported()
              : SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LoginFormContainer(),
                        MediaQuery.of(context).size.height < 1000
                            ? Container()
                            : Expanded(
                                flex: 6,
                                child: Text(
                                  'Banners',
                                ),
                              ),
                      ],
                    ),
                  ),
                )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoginFormContainer(),
                Expanded(
                  flex: 6,
                  child: Text(
                    'Banners',
                  ),
                ),
              ],
            ),
    );
  }
}
