import 'package:movies_app/domian/datasources/actors_datasource.dart';
import 'package:movies_app/domian/entities/actor.dart';
import 'package:movies_app/domian/repositories/actor_repository.dart';

class ActorsDBRepositoryIml extends ActorRepository {
  final ActorsDatasource actorsDatasource;
  ActorsDBRepositoryIml(this.actorsDatasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return actorsDatasource.getActorsByMovie(movieId);
  }
}
