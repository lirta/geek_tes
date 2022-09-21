import 'package:flutter/material.dart';

class BaseView {
  Widget displayLoadingScreen(BuildContext context,
      {Color color = Colors.black}) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
