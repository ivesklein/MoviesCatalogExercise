//https://image.tmdb.org/t/p/w500/

import 'package:flutter/material.dart';

class MImage extends StatelessWidget{

  final String url;

  const MImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    if(url!=""){
      return Image.network("https://image.tmdb.org/t/p/w500${url}",fit: BoxFit.fill,);
    }else{
      return SizedBox();
    }
  }
  
}