import 'dart:convert';

import 'package:flutter_playground/NomadCoder_WEBTOON/A10/models/movie_detail_model.dart';
import 'package:flutter_playground/NomadCoder_WEBTOON/A10/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const Map<String, String> types = {
    "popular": "popular",
    "nowPlaying": "now-playing",
    "comingSoon": "coming-soon",
  };
  static Future<List<MovieModel>> getTypeMovies(String type) async {
    final url = Uri.parse('$baseUrl/${types[type]}');
    final response = await http.get(url);

    // if (response.statusCode == 200) {
    //   final popMovies = jsonDecode(response.body);
    //   for (var movie in popMovies) {
    //     final instance = MovieModel.fromJson(movie);
    //     popMoviesInstances.add(instance);
    //   }
    //   return popMoviesInstances;
    // } else {
    //   throw Exception('Failed to load pop movies');
    // }
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      final List<dynamic> movies = decodedResponse['results'];

      return movies.map((movie) => MovieModel.fromJson(movie)).toList();
    }

    throw Error();
  }

  static Future<MovieDetailModel> getDetailMovie({required String id}) async {
    final url = Uri.parse('$baseUrl/movie?id=$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      final instance = MovieDetailModel.fromJson(decodedResponse);

      return instance;
    }

    throw Error();
  }
}
