import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_providers.dart';

final initialLoaderProvider = Provider<bool>((ref) {
  final movies = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final topRatedMovies = ref.watch(topReatedMoviesProvider).isEmpty;
  final upComingMovies = ref.watch(upcomingMoviesProvider).isEmpty;

  if ( movies || topRatedMovies || upComingMovies ) return true;
  return false;
});