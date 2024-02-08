import 'package:flutter/material.dart';
import 'package:movies/constants.dart';
import 'package:movies/views/dashboard/dashboard_controller.dart';
import 'package:movies/widgets/category_button.dart';
import 'package:movies/widgets/m_icon_button.dart';
import 'package:movies/widgets/m_text_button.dart';
import 'package:movies/widgets/movie_item.dart';

class Dashboard extends StatefulWidget{
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashBoardController ctrl = DashBoardController();

  @override
  void initState() {
    super.initState();
    ctrl.registerOnUpdate((){
      setState(() {});
    });
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
              child: const Text("Find your movies", textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: colorWH, fontWeight: FontWeight.w600)),
            ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Flexible(fit: FlexFit.tight, child: 
                Container(
                  height: 42,
                  width: width-60-42-8,
                  //decoration: const BoxDecoration(color: colorSW),
                  child: TextField(
                    controller: ctrl.searchCtrl,
                    onSubmitted: (String a){ctrl.search();},
                    style: TextStyle(fontSize: 14.0, color: colorWH),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colorSW,
                      hintText: 'Search here...',
                      hintStyle: TextStyle(fontSize: 14.0, color: colorWH),
                      contentPadding:
                          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8,),
                MIconButton(
                  onTap: () {
                    ctrl.search();
                  },
                  bg: colorSW,
                  color: colorWH,
                  icon1: "search",
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 30, top: 30),
              child: const Text("Categories", textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: colorWH, fontWeight: FontWeight.w600)),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              height: 44,
              child: Row(
                children: [
                  CategoryButton(category: "Top Rated", selected:ctrl.filterSelected, onTap: (){
                    ctrl.selectFilter("Top Rated");
                  },),
                  const SizedBox(width: 12),
                  CategoryButton(category: "Popular", selected:ctrl.filterSelected, onTap: (){
                    ctrl.selectFilter("Popular");
                  },),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ctrl.moviesFiltered.length,
                itemBuilder: (BuildContext context, int index) {
                  return MovieItem(ctrl.moviesFiltered[index]);
                },
              ),
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
                        Navigator.pushNamed(context, '/watchlist');
                      },
                      label: "Watch List",
                      bg: colorHL,
                      color: colorBG,
                      icon2: "bookmark",
                    ),
                  ],
                ),
              ),
          ),
        ),
    );
  }
}