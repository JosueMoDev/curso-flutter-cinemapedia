import 'package:movies_app/config/constant/environment.dart';
import 'package:movies_app/domian/entities/actor.dart';
import 'package:movies_app/infraestructure/models/moviedb/movie_casting_response.dart';

class ActorMapper {
  static String size = '/w500';
  static Actor castingToEntity(Cast casting) => Actor(
        id: casting.id,
        name: casting.name,
        profilePath:
            (casting.profilePath != null) ? '${Environment.imageServer}$size${casting.profilePath}' : 'no-profile',
        character: casting.character,
      );
}
