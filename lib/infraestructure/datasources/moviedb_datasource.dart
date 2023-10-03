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

  List<Movie> _mappedResponse( Map<String, dynamic> json ){
    final movieDBResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing', 
      queryParameters:{
      'page': page
    });
    return _mappedResponse(response.data);

  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {
        'page': page
      }
    );
    return _mappedResponse(response.data);
  }
  
  @override
  Future<List<Movie>> getUpComing({int page = 1}) async {
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {
        'page': page
      }
    );
    return _mappedResponse(response.data);
  }
  
}