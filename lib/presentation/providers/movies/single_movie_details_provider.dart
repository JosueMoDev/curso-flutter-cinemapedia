import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domian/entities/movie.dart';
import 'package:movies_app/presentation/providers/providers.dart';

final sigleMovieDetailsProvider = StateNotifierProvider<SingleMovieDetailsNotifier, Map<String, Movie>>((ref) {
  final getSingleMovie = ref.watch(movieRepositoryProvider).getMovieById;
  return SingleMovieDetailsNotifier(getMovieCallBack: getSingleMovie);
});

typedef GetMovieCallBack = Future<Movie> Function(String movieId);

class SingleMovieDetailsNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallBack getMovieCallBack;

  SingleMovieDetailsNotifier({required this.getMovieCallBack}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await getMovieCallBack(movieId);

    state = {...state, movieId: movie};
  }
}
