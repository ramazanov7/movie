// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:movie/core%20/error/exception.dart';
import 'package:movie/features/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {

  // Call the https://api.themoviedb.org/3/movie/popular 
  Future<List<MovieModel>> getAllMovies(int id);

  // Call the https://api.themoviedb.org/3/search/movie
  Future<List<MovieModel>> searchMovie(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl ({required this.client});

  @override
  Future<List<MovieModel>> getAllMovies(int id) => _getPersonFromUrl(
      'https://api.themoviedb.org/3/movie/popular');
  
  @override
  Future<List<MovieModel>> searchMovie(String query) => _getPersonFromUrl(
      'https://api.themoviedb.org/3/search/movie?query=$query');


   Future<List<MovieModel>> _getPersonFromUrl(String url) async {
    print(url);
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final movies = json.decode(response.body);
      return (movies['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } else {
      throw ServerException();
    }
  }

  

}