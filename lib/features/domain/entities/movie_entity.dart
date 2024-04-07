import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String backdropPath;
  // I will use it, if I take a movie => detail api
  // final List<Genre> genres; 
  final List<int> genres;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final double voteAverage;

  const MovieEntity({
    required this.id,
    required this.backdropPath, 
    required this.genres, 
    required this.overview, 
    required this.popularity, 
    required this.posterPath, 
    required this.releaseDate, 
    required this.title, 
    required this.voteAverage
  });
  
  @override
  List<Object?> get props => [
    id, 
    backdropPath, 
    genres, 
    overview, 
    popularity, 
    posterPath, 
    releaseDate, 
    title, 
    voteAverage
  ];
}
/*
class Genre {
    int id;
    String name;

    Genre({
        required this.id,
        required this.name,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json['id'],
        name: json['name'],
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
    };
}
*/