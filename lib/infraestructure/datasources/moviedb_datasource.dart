import 'package:dio/dio.dart';
import 'package:movies_app/config/constant/environment.dart';
import 'package:movies_app/domian/domain.dart';

class MovieDBDatasource extends MovieDataSource {

  // TODO: configure an select lenguage

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
    final List<Movie> movies = [];
    return movies;

  }
  
}