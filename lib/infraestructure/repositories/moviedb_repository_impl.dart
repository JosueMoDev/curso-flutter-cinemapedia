import 'package:movies_app/domian/datasources/movies_datasource.dart';
import 'package:movies_app/domian/entities/movie.dart';
import 'package:movies_app/domian/repositories/movies_repository.dart';

class MovieDBRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDataSource;

  MovieDBRepositoryImpl(this.moviesDataSource);
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
   return  moviesDataSource.getNowPlaying();
  }
  
}