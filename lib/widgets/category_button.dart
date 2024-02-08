import 'package:flutter/material.dart';
import 'package:movies/constants.dart';

class CategoryButton extends StatelessWidget{
  
  const CategoryButton({super.key, required this.category, required this.selected, required this.onTap});

  final String category;
  final String selected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTap();},
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        height: 24,
        color: category==selected?colorHL:colorSW,
        child: Text(category),
      ),
    );
  }

}



