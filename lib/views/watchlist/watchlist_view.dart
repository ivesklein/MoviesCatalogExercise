import 'package:flutter/material.dart';
import 'package:movies/constants.dart';
import 'package:movies/widgets/movie_item.dart';

class Watchlist extends StatelessWidget{
  const Watchlist({super.key});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print("w ${width}");
    print("h ${height}");

    List items = ["hola", "s", "g"];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: colorBG),
        padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Text("Movie DB App", textAlign: TextAlign.left, style: TextStyle(fontSize: 36, color: colorWH, fontWeight: FontWeight.bold)),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 30),
              child: const Text("Your Watch List", textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: colorWH, fontWeight: FontWeight.w600)),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieItem();
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: 
        Container(
          decoration: const BoxDecoration(color: colorBG),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: Container(
                height: 42,
                //decoration: const BoxDecoration(color: colorHL),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 134,
                      decoration: const BoxDecoration(color: colorSW),
                      child: Text("Load More", textAlign: TextAlign.left, style: TextStyle(fontSize: 12, color: colorWH, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(width: width-60-134*2,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 42,
                        width: 134,
                        decoration: const BoxDecoration(color: colorSW),
                        child: Text("Back", textAlign: TextAlign.left, style: TextStyle(fontSize: 12, color: colorWH, fontWeight: FontWeight.w600)),
                      ),
                    )
                  ],
                ),
              ),
          ),
        ),
    );
  }

}