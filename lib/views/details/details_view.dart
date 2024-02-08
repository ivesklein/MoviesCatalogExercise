import 'package:flutter/material.dart';
import 'package:movies/constants.dart';
import 'package:movies/views/details/details_controller.dart';
import 'package:movies/widgets/category_button.dart';
import 'package:movies/widgets/movie_item.dart';

class Details extends StatefulWidget{
  const Details({super.key});
  
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  late int args;

  DetailsController ctrl = DetailsController();

  @override
  void initState() {
    super.initState();
    ctrl.registerOnUpdate((){
      setState(() {});
    });
  }
 

  @override
  void didChangeDependencies() {
    try {
      args = (ModalRoute.of(context)!.settings.arguments as int);
      ctrl.updateId(args);
    } catch (e) {
      print("args invalid");
    }
    
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print("w ${width}");
    print("h ${height}");

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
                            child: Text(ctrl.movie["title"]??"Loading...", textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: colorWH, fontWeight: FontWeight.w600)),
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
                        ...(ctrl.movie["genres"] as List<dynamic>).map((e) => Row(
                          children: [
                            CategoryButton(category: e, selected: "", onTap: (){}),
                            SizedBox(width: 12),
                          ],
                        )).toList()
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
                  true?Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Overviews:", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                        Text(ctrl.movie["overview"]??"", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                        Text("Release Date:", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                        Text(ctrl.movie["release_date"]??"0000-00-00", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: (width-60)/2,
                              child: Column(
                                children: [
                                  Text("Average Rating:", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                                  Text((ctrl.movie["vote_average"] as double).toStringAsFixed(1)??"", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                            Container(
                              width: (width-60)/2,
                              child: Column(
                                children: [
                                  Text("Rate Count:", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                                  Text((ctrl.movie["vote_count"] as int).toString()??"", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text("Popularity:", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
                        Text((ctrl.movie["popularity"] as double).toStringAsFixed(1)??"", textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: colorWH, fontWeight: FontWeight.w400)),
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
                      child: ctrl.inWatchlist?GestureDetector(
                        onTap: () {
                          ctrl.add2WatchList(false);
                        },
                        child: Container(
                          height: 42,
                          width: 42,
                          decoration: const BoxDecoration(color: colorHL),
                          child: Text("TK", textAlign: TextAlign.left, style: TextStyle(fontSize: 12, color: colorWH, fontWeight: FontWeight.w600)),
                        ),
                      ):GestureDetector(
                        onTap: () {
                          ctrl.add2WatchList(true);
                        },
                        child: Container(
                          height: 42,
                          width: 42,
                          decoration: const BoxDecoration(color: colorSW),
                          child: Text("TK", textAlign: TextAlign.left, style: TextStyle(fontSize: 12, color: colorWH, fontWeight: FontWeight.w600)),
                        ),
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