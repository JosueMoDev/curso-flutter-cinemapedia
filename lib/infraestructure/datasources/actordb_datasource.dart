import 'package:dio/dio.dart';
import 'package:movies_app/config/constant/environment.dart';
import 'package:movies_app/domian/datasources/actors_datasource.dart';
import 'package:movies_app/domian/entities/actor.dart';
import 'package:movies_app/infraestructure/mapper/actors_mappers.dart';
import 'package:movies_app/infraestructure/models/moviedb/movie_casting_response.dart';

class ActorsDBDataSource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: Environment.apiBaseUrl, queryParameters: {'api_key': Environment.theMovieDBApiKey}),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    final castingResponse = CastingResponse.fromJson(response.data);
    final List<Actor> actorsList = castingResponse.cast
        .where((actor) => actor.profilePath != null)
        .map((actor) => ActorMapper.castingToEntity(actor))
        .toList();
    return actorsList;
  }
}
