import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domian/entities/actor.dart';
import 'package:movies_app/presentation/providers/providers.dart';

final actorByMovieProvider = StateNotifierProvider<ActorByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final actorsList = ref.watch(actorListRepositoryProvider).getActorsByMovie;
  return ActorByMovieNotifier(getActorsByMovieCallBack: actorsList);
});

typedef ActorListCallBack = Future<List<Actor>> Function(String movieId);

class ActorByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final ActorListCallBack getActorsByMovieCallBack;

  ActorByMovieNotifier({required this.getActorsByMovieCallBack}) : super({});

  Future<void> loadActorList(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actorList = await getActorsByMovieCallBack(movieId);

    state = {...state, movieId: actorList};
  }
}
