import 'package:dio/dio.dart';
import 'package:movies_app/config/constant/environment.dart';
import 'package:movies_app/domian/domain.dart';
import 'package:movies_app/infraestructure/mapper/moviedb_mapper.dart';
import 'package:movies_app/infraestructure/models/moviedb_response.dart';

class MovieDBDatasource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiBaseUrl,
      queryParameters: {
        'api_key': Environment.theMovieDBApiKey
      }
      
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();
    return movies;

  }
  
}