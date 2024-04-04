import 'package:dartz/dartz.dart';
import 'package:movie/core%20/error/failure.dart';
import 'package:movie/features/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getAllMovies(int id);
  
  Future<Either<Failure, List<MovieEntity>>> searchMovie(String query);
}