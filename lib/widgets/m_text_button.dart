import 'package:flutter/material.dart';
import 'package:movies/constants.dart';

class MTextButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 134,
      child: Text("Load More", textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: colorWH, fontWeight: FontWeight.w600)),
    );
  }



}