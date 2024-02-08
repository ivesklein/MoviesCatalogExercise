
import 'package:flutter/material.dart';
import 'package:movies/data/api.dart';
import 'package:movies/models/movies_model.dart';

class DashBoardController {

  String filterSelected = "Top Rated";

  TextEditingController searchCtrl = TextEditingController();

  Function update = (){print("OnUpdate not registered");};

  List<Map> moviesFiltered = [];

  bool showLoad = false;

  int page = 1;

  registerOnUpdate(Function onUpdate){
    update = onUpdate;

    searchCtrl.addListener(() {
      print("################         ${searchCtrl.text}");
    });

    selectFilter("Top Rated");
  }

  loadMore(){

  }

  selectFilter(String filter) async {
    switch (filter) {
      case "Top Rated":
        showLoad = true;
        update();

        filterSelected = filter;
        // get data
        moviesFiltered = MoviesModel.parseData(await API.getTopRated(page));
        
        showLoad = false;
        update();
        break;
      case "Popular":
        showLoad = true;
        update();

        filterSelected = filter;
        // get data
        moviesFiltered = MoviesModel.parseData(await API.getPopular(page));
        
        showLoad = false;
        update();
        break;
      default:
        filterSelected = "Top Rated";
        // get data
        showLoad = true;
        update();
        break;
    }
  }

  search() async {
    
    showLoad = true;
    update();
    // get data
    moviesFiltered = MoviesModel.parseData(await API.getQuery(page, searchCtrl.text));
    
    showLoad = false;
    update();
  }


}