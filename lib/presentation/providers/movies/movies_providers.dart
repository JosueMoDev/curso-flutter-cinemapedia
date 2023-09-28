import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domian/domain.dart';
import 'package:movies_app/presentation/providers/movies/movie_repository_provider.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNofier, List<Movie>>((ref){
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying; 
  return MoviesNofier(fetchMoreMovies: fetchMoreMovies);
});


typedef MovieCallBack = Future<List<Movie>> Function({ int page });

class MoviesNofier extends StateNotifier<List<Movie>>{

  int currentPage = 0 ;
  MovieCallBack fetchMoreMovies;

  MoviesNofier({
    required this.fetchMoreMovies
  }) : super([]);

  Future<void> loadNextPage() async {
    currentPage ++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [ ...state, ...movies];
  }

}
