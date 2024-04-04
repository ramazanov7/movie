import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core%20/error/failure.dart';
import 'package:movie/core%20/usecase/usecase.dart';
import 'package:movie/features/domain/entities/movie_entity.dart';
import 'package:movie/features/domain/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

class GetAllMovies extends UseCase<List<MovieEntity>, PageMovieParams> {
  final MovieRepository movieRepository;

  GetAllMovies({required this.movieRepository});

  @override 
  Future<Either<Failure, List<MovieEntity>>> call(PageMovieParams params) async {
    return await movieRepository.getAllMovies(params.id);
  }
}

class PageMovieParams extends Equatable {
  final int id;

  const PageMovieParams({required this.id});

  @override 
  List<Object> get props => [id];

}