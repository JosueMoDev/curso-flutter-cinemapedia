import 'package:movies_app/domian/entities/actor.dart';

abstract class ActorRepository {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
