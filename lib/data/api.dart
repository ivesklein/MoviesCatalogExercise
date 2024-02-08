import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movies/secret.dart';

const String apiURL ="https://api.themoviedb.org/3";

class API{

  static Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $apiKey'
  };

  static Future<dynamic> getTopRated(int page) async {
    try {
      final data = await getDiscover(page, "vote_average.desc");
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<dynamic> getPopular(int page) async {
    try {
      final data = await getDiscover(page, "popularity.desc");
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
  

  static Future<dynamic> getDiscover(int page, String sort_by) async {
    try {

      final res = await http.get(
        Uri.parse(
          '${apiURL}/discover/tv?language=en-US&page=${page}&sort_by=${sort_by}',
        ),
        headers: requestHeaders
      );

      final data = jsonDecode(res.body);

      /*if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }*/

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<dynamic> getQuery(int page, String query) async {
    try {

      final res = await http.get(
        Uri.parse(
          '${apiURL}/search/tv?query=${query}&language=en-US&page=${page}',
        ),
        headers: requestHeaders
      );

      final data = jsonDecode(res.body);

      /*if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }*/

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  


  static Future<dynamic> getWatchList(int page) async {
    try {

      final res = await http.get(
        Uri.parse(
          '${apiURL}/account/20974318/watchlist/tv?language=en-US&page=${page}&sort_by=created_at.asc',
        ),
        headers: requestHeaders
      );

      final data = jsonDecode(res.body);

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<dynamic> add2watchlist(int id, {bool add = true}) async {
    try {

      String body = '{"media_type": "tv","media_id": ${id},"watchlist": ${add?"true":"false"}}';

      final res = await http.post(
        Uri.parse(
          '${apiURL}/account/20974318/watchlist',
        ),
        headers: requestHeaders,
        body: body
      );

      final data = jsonDecode(res.body);
      
      return data;

      /*
        {
          "success": true,
          "status_code": 1,
          "status_message": "Success."
        }

        {
          "success": false,
          "status_code": 34,
          "status_message": "The resource you requested could not be found."
        }
      */
    } catch (e) {
      throw e.toString();
    }
  }

  static getId(int id) async {
    try {

      final res = await http.get(
        Uri.parse(
          '${apiURL}/tv/${id}?language=en-US',
        ),
        headers: requestHeaders
      );

      final data = jsonDecode(res.body);

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

}