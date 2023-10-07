import 'package:isar/isar.dart';
import 'package:movies_app/domian/datasources/isar_local_db_datasource.dart';
import 'package:movies_app/domian/entities/movie.dart';
import 'package:path_provider/path_provider.dart';

class IsarLocalDBDatasourceImpl extends IsarLocalDBDatasource {
  late Future<Isar> localdb;

  IsarLocalDBDatasourceImpl() {
    localdb = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([MovieSchema],
          inspector: true, directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await localdb;
    final Movie? isMovieFavorite =
        await isar.movies.filter().idEqualTo(movieId).findFirst();

    return isMovieFavorite != null;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await localdb;
    final favoriteMovie = await isar.movies.filter().idEqualTo(movie.id).findFirst();

    if (favoriteMovie != null) {
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));
      return;
    }

    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }

  @override
  Future<List<Movie>> loadMoreMovies({int limit = 10, int offset = 0}) async {
    final isar = await localdb;
    return isar.movies.where().offset(offset).limit(limit).findAll();
  }
}
