
import 'package:flutter/material.dart';
import 'package:movies/data/api.dart';
import 'package:movies/models/movies_model.dart';

class DetailsController {

  Function update = (){print("OnUpdate not registered");};
  bool showLoad = false;
  int id = 0;
  Map movie = {
      "backdrop_path": "",
      "genres": [],
      "id": 0,
      "title": "Loading ...",
      "overview": "",
      "popularity": 0.0,
      "poster_path": "",
      "release_date": "",
      "vote_average": 0.0,
      "vote_count": 0,
    };

  registerOnUpdate(Function onUpdate){
    update = onUpdate;
  }

  void updateId(int args) {
    id = args;
    loadContent();
  }

  add2WatchList(){
    
  }
  
  void loadContent() async {
    movie = MoviesModel.parseId( await API.getId(id));
    update();
  }



}


/*late Object args; 

@override
void didChangeDependencies() {
  args = ModalRoute.of(context).settings.argument
  super.didChangeDependencies();
}

*/