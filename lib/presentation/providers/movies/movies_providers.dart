import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domian/domain.dart';
import 'package:movies_app/presentation/providers/movies/movie_repository_provider.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNofier, List<Movie>>((ref){
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying; 
  return MoviesNofier(fetchMoreMovies: fetchMoreMovies);
});

final topReatedMoviesProvider = StateNotifierProvider<MoviesNofier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;
  return MoviesNofier(fetchMoreMovies: fetchMoreMovies);
});

final upcomingMoviesProvider = StateNotifierProvider<MoviesNofier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpComing;
  return MoviesNofier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallBack = Future<List<Movie>> Function({ int page });

class MoviesNofier extends StateNotifier<List<Movie>>{

  int currentPage = 0 ;
  bool isLoading = false;
  MovieCallBack fetchMoreMovies;

  MoviesNofier({
    required this.fetchMoreMovies
  }) : super([]);

  Future<void> loadNextPage() async {
    if( isLoading ) return;
    isLoading = true;
    currentPage ++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [ ...state, ...movies];
    isLoading = false;
  }

}
