class MoviesModel{
  static List<Map> parseData(dynamic data) {

    print(data["results"]);

    print(data["results"].runtimeType);

    List results = data["results"];


    return results.map((e) {

      List<int> genre = (e["genre_ids"] as List<dynamic>).map((e) => (e as int)).toList();

      return {
        "backdrop_path": e["backdrop_path"],
        "genre_ids": genre,
        "id": e["id"],
        "title": e["name"],
        "overview": e["overview"],
        "popularity": e["popularity"],
        "poster_path": e["poster_path"],
        "release_date": e["first_air_date"],
        "vote_average": e["vote_average"],
        "vote_count": e["vote_count"]
      };
    }).toList();

  }

  static Map parseId(data) {

    print(data);

    List<String> genres = (data["genres"] as List<dynamic>).map((e) => (e["name"] as String)).toList();

    return {
      "backdrop_path": data["backdrop_path"],
      "genres": genres,
      "id": data["id"],
      "title": data["name"],
      "overview": data["overview"],
      "popularity": data["popularity"],
      "poster_path": data["poster_path"],
      "release_date": data["first_air_date"],
      "vote_average": data["vote_average"],
      "vote_count": data["vote_count"]
    };
  }
  

/*
{
  "name": "Starting Over",
  "overview": "Starting Over is an American reality TV show that follows the lives of women who are experiencing difficulty in their lives and want to make changes, with the help of life coaches. It was the first reality TV show to be nominated for a Daytime Emmy Award. Six women at a time work to overcome obstacles and meet personal goals. When it is determined that a woman has met all her goals, she \"graduates\" from the house and is replaced by a new roommate. On the other hand, if it's determined that she's not met her goals, she could be put on probation, or even asked to leave.",
  "first_air_date": "2003-09-09",
  "genres": [],
  "vote_average": 8.5,
  "vote_count": 1
  "popularity": 23.975,

  "backdrop_path": "/vNDmspYMfwfPJ6tauchiwRkPJCZ.jpg",
  "poster_path": "/dfoTgMdVKF08Sqp4AeLlMcLaVV7.jpg",

  "adult": false,

  "created_by": [
    {
      "id": 587827,
      "credit_id": "52533ba819c295794006f3a9",
      "name": "Jonathan Murray",
      "gender": 0,
      "profile_path": null
    },
    {
      "id": 1016448,
      "credit_id": "52533ba819c295794006f3af",
      "name": "Mary-Ellis Bunim",
      "gender": 1,
      "profile_path": null
    }
  ],
  "episode_run_time": [
    60
  ],
  
  
  "homepage": "",
  "id": 123,
  "in_production": false,
  "languages": [],
  "last_air_date": "2004-11-05",
  "last_episode_to_air": {
    "id": 5920,
    "name": "Boot Camp",
    "overview": "",
    "vote_average": 0,
    "vote_count": 0,
    "air_date": "2004-11-05",
    "episode_number": 40,
    "episode_type": "finale",
    "production_code": "",
    "runtime": 60,
    "season_number": 2,
    "show_id": 123,
    "still_path": null
  },
  
  "next_episode_to_air": null,
  "networks": [],
  "number_of_episodes": 235,
  "number_of_seasons": 2,
  "origin_country": [
    "US"
  ],
  "original_language": "en",
  "original_name": "Starting Over",
  
  

  "production_companies": [],
  "production_countries": [],
  "seasons": [
    {
      "air_date": "2003-09-08",
      "episode_count": 195,
      "id": 358,
      "name": "Season 1",
      "overview": "",
      "poster_path": null,
      "season_number": 1,
      "vote_average": 8.5
    },
    {
      "air_date": "2004-09-13",
      "episode_count": 40,
      "id": 359,
      "name": "Season 2",
      "overview": "",
      "poster_path": null,
      "season_number": 2,
      "vote_average": 0
    }
  ],
  "spoken_languages": [],
  "status": "Ended",
  "tagline": "",
  "type": "Scripted",

}

*/


}