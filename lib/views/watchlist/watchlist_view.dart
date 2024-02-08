import 'package:flutter/material.dart';
import 'package:movies/constants.dart';
import 'package:movies/views/watchlist/watchlist_controller.dart';
import 'package:movies/widgets/m_icon_button.dart';
import 'package:movies/widgets/m_text_button.dart';
import 'package:movies/widgets/movie_item.dart';

class Watchlist extends StatefulWidget{
  const Watchlist({super.key});

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {

  WatchListController ctrl = WatchListController();

  @override
  void initState() {
    super.initState();
    ctrl.registerOnUpdate((){
      setState(() {});
    });
    ctrl.loadMore();
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
              itemCount: ctrl.moviesFiltered.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieItem(ctrl.moviesFiltered[index]);
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
                    MTextButton(),
                    SizedBox(width: width-60-134*2,),
                    MIconButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      label: "Back",
                      bg: colorSW,
                      color: colorWH,
                      icon1: "back",
                    ),
                    
                  ],
                ),
              ),
          ),
        ),
    );
  }
}