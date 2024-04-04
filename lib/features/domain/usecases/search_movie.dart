import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core%20/error/failure.dart';
import 'package:movie/core%20/usecase/usecase.dart';
import 'package:movie/features/domain/entities/movie_entity.dart';
import 'package:movie/features/domain/repositories/movie_repository.dart';


class SearchMovie extends UseCase<List<MovieEntity>, SearchMovieParams> {
  final MovieRepository movieRepository;

  SearchMovie({required this.movieRepository});

  @override 
  Future<Either<Failure, List<MovieEntity>>> call(SearchMovieParams params) async {
    return await movieRepository.searchMovie(params.query);
  }
}

class SearchMovieParams extends Equatable {
  final String query;
  
  const SearchMovieParams({required this.query});

  @override 
  List<Object> get props => [query];

}