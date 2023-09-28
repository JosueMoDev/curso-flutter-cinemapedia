import 'package:movies_app/domian/entities/movie.dart';

abstract class MoviesDataSource {

  Future<List<Movie>> getNowPlaying({ int page = 1 });
  
}