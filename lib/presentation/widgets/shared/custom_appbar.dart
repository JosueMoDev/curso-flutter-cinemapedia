import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/domian/entities/movie.dart';
import 'package:movies_app/presentation/delagates/search_movie_delegate.dart';
import 'package:movies_app/presentation/providers/providers.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = Theme.of(context).colorScheme;
    final fontTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.movie_outlined,
                color: colorTheme.primary,
              ),
              const SizedBox(width: 5),
              Text('CinemapeliSv', style: fontTheme.titleMedium),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    final seachMovies = ref.read(movieRepositoryProvider).searchMovies;
                    showSearch<Movie?>(
                      context: context,
                      delegate: SearchMovieDelegate(searchMovieCallBack: seachMovies),
                    ).then(
                      (movie) {
                        if (movie == null) return;
                        context.push('/movie/${movie.id}');
                      },
                    );
                  },
                  icon: const Icon(Icons.search_outlined))
            ],
          )),
    ));
  }
}
