import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_test/helper/masage.dart';
import 'package:movie_test/page/full/model/modelfull.dart';

//list id: 8249013
//sesion id: 8f031226f926f939305fd3aa6a34c8c15fa94901

Future<List<dynamic>> getListFilm(String page) async {
  final baseHTTP = Uri.parse(
      "https://api.themoviedb.org/3/movie/popular?api_key=0f7e7cd1eecb0a7202c323d281624338&language=en-US&page=$page");
  final response = await http.get(
    baseHTTP,
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['results'];
    // return json.Map<listFilm>((json) => listFilm.fromJson(json)).toList();
  } else {
    return jsonDecode(response.body);
  }
}

Future<FullDetailMovie> getDetailFilm(int id) async {
  final baseHTTP = Uri.parse(
      'https://api.themoviedb.org/3/movie/$id?api_key=0f7e7cd1eecb0a7202c323d281624338&language=en-US');
  final response = await http.get(
    baseHTTP,
  );

  if (response.statusCode == 200) {
    return FullDetailMovie.fromJson(jsonDecode(response.body));
  } else {
    return jsonDecode(response.body);
  }
}

Future<List<dynamic>> getReviewFilm(String id) async {
  final baseHTTP = Uri.parse(
      "https://api.themoviedb.org/3/movie/$id/reviews?api_key=0f7e7cd1eecb0a7202c323d281624338&language=en-US&page=1");
  final response = await http.get(
    baseHTTP,
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['results'];
    // return json.Map<listFilm>((json) => listFilm.fromJson(json)).toList();
  } else {
    return jsonDecode(response.body);
  }
}

Future<List<dynamic>> getCreditFilm(String id) async {
  final baseHTTP = Uri.parse(
      "https://api.themoviedb.org/3/movie/$id/credits?api_key=0f7e7cd1eecb0a7202c323d281624338&language=en-US");
  final response = await http.get(
    baseHTTP,
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['cast'];
    // return json.Map<listFilm>((json) => listFilm.fromJson(json)).toList();
  } else {
    return jsonDecode(response.body);
  }
}

Future<List<dynamic>> searchFilm(String query) async {
  final baseHTTP = Uri.parse(
      "https://api.themoviedb.org/3/search/multi?api_key=0f7e7cd1eecb0a7202c323d281624338&language=en-US&query=$query&page=1&include_adult=false");
  final response = await http.get(
    baseHTTP,
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['results'];
    // return json.Map<listFilm>((json) => listFilm.fromJson(json)).toList();
  } else {
    return jsonDecode(response.body);
  }
}

Future<List<dynamic>> getWishList() async {
  final baseHTTP = Uri.parse(
      "https://api.themoviedb.org/3/list/8249013?api_key=0f7e7cd1eecb0a7202c323d281624338&language=en-US");
  final response = await http.get(
    baseHTTP,
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['items'];
    // return json.Map<listFilm>((json) => listFilm.fromJson(json)).toList();
  } else {
    return jsonDecode(response.body);
  }
}

Future<Status> addWishList(String idF) async {
  final baseHTTP = Uri.parse(
      "https://api.themoviedb.org/3/list/8249013/add_item?api_key=0f7e7cd1eecb0a7202c323d281624338&session_id=8f031226f926f939305fd3aa6a34c8c15fa94901");
  final response = await http.post(
    baseHTTP,
    body: {'media_id': idF},
  );

  return Status.fromJson(
    jsonDecode(response.body),
  );
}
