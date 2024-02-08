
import 'package:flutter/material.dart';
import 'package:movies/data/api.dart';
import 'package:movies/models/movies_model.dart';

class WatchListController {

  Function update = (){print("OnUpdate not registered");};

  List<Map> moviesFiltered = [];

  bool showLoad = false;

  int page = 0;

  registerOnUpdate(Function onUpdate){
    update = onUpdate;
  }

  loadMore() async{
    page++;
    moviesFiltered = MoviesModel.parseData(await API.getWatchList(page));
    update();
  }

  add2WatchList(){
    
  }

}