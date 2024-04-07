// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:movie/core%20/error/exception.dart';
import 'package:movie/features/data/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class MovieLocalDataSource {
  /// Gets the cached [List<PersonModel>] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.

  Future<List<MovieModel>> getLastMoviesFromCache();
  Future<void> moviesToCache(List<MovieModel> persons);
}

const CACHED_PERSONS_LIST = 'CACHED_PERSONS_LIST';

class MovieLocalDataSourceImpl implements MovieLocalDataSource {

  final SharedPreferences sharedPreferences;

  MovieLocalDataSourceImpl({required this.sharedPreferences});
  
  @override
  Future<List<MovieModel>> getLastMoviesFromCache() {
    final jsonMoviesList = sharedPreferences.getStringList(CACHED_PERSONS_LIST);
    if (jsonMoviesList!.isNotEmpty) {
      print('Get Movies from Cache: ${jsonMoviesList.length}');
      return Future.value(jsonMoviesList
          .map((person) => MovieModel.fromJson(json.decode(person)))
          .toList());
    } else {
      throw CacheException();
    }
  }
  
  @override
  Future<void> moviesToCache(List<MovieModel> movie) {
    final List<String> jsonMoviesList =
        movie.map((movie) => json.encode(movie.toJson())).toList();

    sharedPreferences.setStringList(CACHED_PERSONS_LIST, jsonMoviesList);
    print('Movies to write Cache: ${jsonMoviesList.length}');
    return Future.value(jsonMoviesList);
  }


}