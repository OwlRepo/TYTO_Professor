import 'package:flutter/material.dart';

class NotSupported extends StatelessWidget {
  static const routeName = '/notsupported';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Not Supported'),
        ),
      ),
    );
  }
}
