import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String backdropPath;
  final Map<String,dynamic> genres;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
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