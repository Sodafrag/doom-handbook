import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black87,
      // child: Text("Loading...", style: TextStyle(color: Colors.grey),),
      child: CircularProgressIndicator(),
    );
  }
}