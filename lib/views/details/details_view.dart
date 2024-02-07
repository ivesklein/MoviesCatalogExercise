import 'package:flutter/material.dart';
import 'package:movies/constants.dart';
import 'package:movies/widgets/movie_item.dart';

class Details extends StatelessWidget{
  const Details({super.key});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print("w ${width}");
    print("h ${height}");

    List items = [
      "hola",
        "hola",
          "hola",
            "hola",
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: colorBG),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 271,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 210,
                    decoration: BoxDecoration(
                      color: colorHL,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 271,
                    padding: EdgeInsets.only(top: 150, left: 30, right: 30),
                    child: Row(
                      children: [
                        Container(
                          width: 95,
                          height: 120,
                          decoration: BoxDecoration(
                            color: colorSW,
                            borderRadius: BorderRadius.all(Radius.circular(16)
                            )
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            padding: EdgeInsets.only(top: 72, left: 12, right: 12),
                            child: Text("Titulo pelicula", textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: colorWH, fontWeight: FontWeight.w600)),
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
              child: Column(
                children: [
                  // categories
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    height: 44,
                    child: Row(
                      children: [
                        Container(
                          width: 79,
                          height: 24,
                          color: colorSW,
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 79,
                          height: 24,
                          color: colorSW,
                        ),
                      ],
                    ),
                  ),
                  //tabs
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text("About Movie", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w600)),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: colorSW,
                              width: 2
                            ))
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(3),
                          child: Text("Reviews", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                  ),
                  //content
                  false?Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Reviews", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                        Text("Reviews", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                        Text("Reviews", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                        Text("Reviews", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text("Reviews", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                                Text("Reviews", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Reviews", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                                Text("Reviews", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ],
                        ),
                        Text("Reviews", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                        Text("Reviews", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ):
                  Container(
                    //child: ListView(),
                  )
                ],
              ),
            ),

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
                    ),
                    SizedBox(width: width-60-134-42,),
                    GestureDetector(
                      onTap: () {
                        //Navigator.pushNamed(context, '/watchlist');
                      },
                      child: Container(
                        height: 42,
                        width: 42,
                        decoration: const BoxDecoration(color: colorHL),
                        child: Text("TK", textAlign: TextAlign.left, style: TextStyle(fontSize: 12, color: colorWH, fontWeight: FontWeight.w600)),
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