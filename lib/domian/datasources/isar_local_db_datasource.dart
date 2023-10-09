import 'package:movies_app/domian/domain.dart';

abstract class IsarLocalDBDatasource {
  Future<void> toggleFavorite(Movie movie);
  Future<bool> isMovieFavorite(int movieId);
  Future<List<Movie>> loadMoreMovies({int limit = 10, int offset = 0});
}