import 'package:flutter/material.dart';
import 'package:movies/constants.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class MIconButton extends StatelessWidget{

  final String label;
  final String icon1;
  final Color color;
  final Color bg;
  final String icon2;
  final Function onTap;

  const MIconButton({super.key, this.label = "", this.icon1 = "", required this.onTap, required this.color, this.icon2 = "", required this.bg});

  @override
  Widget build(BuildContext context) {

    Widget wicon1 = SizedBox();
    Widget wtext = SizedBox();
    Widget wicon2 = SizedBox();

    if(label!=""){
      wtext = Text(label, style: TextStyle(fontSize: 14.0, color: color));
    }

    print(icon1);
    print(icon2);

    if(icon1!=""){
      switch (icon1) {
        case "bookmark":
          wicon1 = Padding(
            padding: const EdgeInsets.only(left: -0.0),
            child: Icon(BootstrapIcons.bookmark_fill, color: color, size: 18,),
          );
          break;
        case "back":
          wicon1 = Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(BootstrapIcons.arrow_left, color: color, size: 18,),
          );
          break;
        case "search":
          wicon1 = Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: Icon(BootstrapIcons.search, color: color, size: 18,),
          );
          break;
        default:
      }
    }

    if(icon2!=""){
      switch (icon2) {
        case "bookmark":
          wicon2 = Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(BootstrapIcons.bookmark_fill, color: color, size: 18,),
          );
          break;
        case "back":
          wicon2 = Icon(BootstrapIcons.arrow_left, color: color, size: 18,);
          break;
        default:
      }
    }


    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 42,
        width: label==""?42:134,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        padding: EdgeInsets.only(left: 14),
        child: Row(
          children: [
            wicon1,
            wtext,
            wicon2,
          ],
        )
      ),
    );
  }



}