import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Material(color: Colors.transparent,
        child: Text(
          "Continue the reading",
          style: TextStyle(
              color: Color.fromRGBO(255, 214, 0, 1),
              fontSize: 16.0,
              fontWeight: FontWeight.w500),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Color.fromRGBO(81, 29, 147, 0.9),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 16.0,
            )
          ]),
    );
  }
}
