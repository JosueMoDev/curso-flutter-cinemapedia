import 'package:movies_app/domian/datasources/movies_datasource.dart';
import 'package:movies_app/domian/entities/movie.dart';
import 'package:movies_app/domian/repositories/movies_repository.dart';

class MovieDBRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDataSource;

  MovieDBRepositoryImpl(this.moviesDataSource);
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesDataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return moviesDataSource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpComing({int page = 1}) {
    return moviesDataSource.getUpComing(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return moviesDataSource.getMovieById(id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return moviesDataSource.searchMovies(query);
  }
}
