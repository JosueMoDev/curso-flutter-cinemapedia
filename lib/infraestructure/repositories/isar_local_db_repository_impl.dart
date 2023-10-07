import 'package:movies_app/domian/datasources/isar_local_db_datasource.dart';
import 'package:movies_app/domian/entities/movie.dart';
import 'package:movies_app/domian/repositories/isar_local_db_repository.dart';

class IsarLocalDBRepositoryImpl extends IsarLocalDBRepository {
  final IsarLocalDBDatasource isarLocalDBDatasource;
  IsarLocalDBRepositoryImpl(this.isarLocalDBDatasource);
  @override
  Future<bool> isMovieFavorite(int movieId) {
   return isarLocalDBDatasource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMoreMovies({int limit = 10, int offset = 0}) {
    return isarLocalDBDatasource.loadMoreMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return toggleFavorite(movie);
  }

}