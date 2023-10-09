import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domian/domain.dart';
import 'package:movies_app/domian/repositories/isar_local_db_repository.dart';
import 'package:movies_app/presentation/providers/localdb/local_db_repository_provider.dart';

final favoriteMoviesProvider = StateNotifierProvider<LocalDBMoviesNotifier, Map<int, Movie>>((ref) {
  final localDBRepository = ref.watch(localDBRepositoryProvider);
  return LocalDBMoviesNotifier(isarLocalDBRepository: localDBRepository);
});

/*
  {
    1234: Movie,
    1645: Movie,
    6523: Movie,
  }

*/

class LocalDBMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final IsarLocalDBRepository isarLocalDBRepository;

  LocalDBMoviesNotifier({required this.isarLocalDBRepository}) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies = await isarLocalDBRepository.loadMoreMovies(offset: page * 10, limit: 20);
    page++;

    final tempMoviesMap = <int, Movie>{};
    for (final movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }

    state = {...state, ...tempMoviesMap};

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await isarLocalDBRepository.toggleFavorite(movie);
    final bool isMovieInFavorites = state[movie.id] != null;

    if (isMovieInFavorites) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
