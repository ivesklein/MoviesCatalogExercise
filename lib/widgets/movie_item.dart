import 'package:flutter/material.dart';
import 'package:movies/constants.dart';

class MovieItem extends StatelessWidget{
  Map movie;

  MovieItem(this.movie);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "/details", arguments: movie["id"]??1);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 9, bottom: 9),
        height: 138,
        child: Row(
          children: [
            Container(
              width: 95,
              height: 120,
              color: Colors.amber,
              //padding: EdgeInsets.only(right: 22),
            ),
            SizedBox(width:22),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title:", style: TextStyle(fontSize: 12, color: colorWH, fontWeight: FontWeight.w600)),
                  Text(movie["title"]??"" , style: TextStyle(fontSize: 12, color: colorWH, fontWeight: FontWeight.w400)),
                  Text("Release date:", style: TextStyle(fontSize: 12, color: colorWH, fontWeight: FontWeight.w600)),
                  Text(movie["release_date"]??"", style: TextStyle(fontSize: 12, color: colorWH, fontWeight: FontWeight.w400)),
                  Text("Average Rating:", style: TextStyle(fontSize: 12, color: colorWH, fontWeight: FontWeight.w600)),
                  Text(movie["vote_average"].toStringAsFixed(1)??"", style: TextStyle(fontSize: 12, color: colorWH, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            Column(
              children: [
                Text("A", style: TextStyle(fontSize: 12, color: colorHL, fontWeight: FontWeight.w600)),
                Text("B", style: TextStyle(fontSize: 12, color: colorHL, fontWeight: FontWeight.w400)),
                Text("C", style: TextStyle(fontSize: 12, color: colorHL, fontWeight: FontWeight.w600)),
              ],
            )
          ],
        ),
      ),
    );
  }
  
}