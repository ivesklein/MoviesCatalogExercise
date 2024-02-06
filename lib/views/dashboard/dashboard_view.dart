import 'package:flutter/material.dart';
import 'package:movies/constants.dart';

class Dashboard extends StatelessWidget{
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print("w ${width}");
    print("h ${height}");

    List items = ["hola"];

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
                  width: 252,
                  //decoration: const BoxDecoration(color: colorSW),
                  child: TextField(
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

                Container(
                  height: 42,
                  width: 42,
                  decoration: const BoxDecoration(color: colorSW),
                  child: Text("btn", textAlign: TextAlign.left, style: TextStyle(fontSize: 12, color: colorWH, fontWeight: FontWeight.w600)),
                )
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 30, top: 30),
              child: const Text("Categories", textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: colorWH, fontWeight: FontWeight.w600)),
            ),
            Container(
              width: double.infinity,
              height: 32,
              padding: const EdgeInsets.only(bottom: 30),
              child: Text("categorias"),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: 
        Container(
          decoration: const BoxDecoration(color: colorSW),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: SizedBox(
              width: 200,
              height: 42,
              child: Container(
                decoration: const BoxDecoration(color: colorHL),
                child: Text("hola"),
              ),
            ),
          ),
        ),
    );
  }

}