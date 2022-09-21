import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseFunction {
  Widget displayLoadingScreen(BuildContext context,
      {Color color = Colors.white}) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }

  void displayToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey[700],
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
