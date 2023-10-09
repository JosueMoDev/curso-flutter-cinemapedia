import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domian/domain.dart';
import 'package:movies_app/presentation/providers/providers.dart';

final searchQueryProdiver = StateProvider<String>((ref) => '');

final searchedMoviesProvider = StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
  final searchMovies = ref.read(movieRepositoryProvider).searchMovies;

  return SearchedMoviesNotifier(ref: ref, searchMovies: searchMovies);
});

typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallBack searchMovies;
  final Ref ref;
  SearchedMoviesNotifier({
    required this.searchMovies,
    required this.ref,
  }) : super([]);
  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProdiver.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
