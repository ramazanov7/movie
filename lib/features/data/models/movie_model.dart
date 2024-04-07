// ignore_for_file: use_super_parameters

import 'package:movie/features/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required id,
    required backdropPath, 
    required genres, 
    required overview, 
    required popularity, 
    required posterPath, 
    required releaseDate, 
    required title, 
    required voteAverage
  }) : super(
    id: id, 
    backdropPath: backdropPath, 
    genres: genres, 
    overview: overview, 
    popularity: popularity, 
    posterPath: posterPath, 
    releaseDate: releaseDate, 
    title: title, 
    voteAverage: voteAverage
  );

  factory MovieModel.fromJson(Map<String,dynamic> json) {
    return MovieModel(
      id: json['id'], 
      backdropPath: json['backdrop_path'], 
      genres: List<int>.from(json["genre_ids"].map((x) => x)),
      // genres: List<Genre>.from(json['genres'].map((x) => Genre.fromJson(x))),
      overview: json['overview'], 
      popularity: json["popularity"]?.toDouble(),
      posterPath: json['poster_path'], 
      releaseDate: DateTime.parse(json['release_date'] as String), 
      title: json['title'], 
      voteAverage: json["vote_average"]?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genres.map((x) => x)),
        // "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "id": id,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "vote_average": voteAverage,
    };

}