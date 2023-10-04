import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/config/helpers/helpers.dart';
import 'package:movies_app/domian/domain.dart';

typedef SearchMovieCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMovieCallBack searchMovieCallBack;
  final List<Movie> initialMovies;
  StreamController<List<Movie>> debouncedMoviesQuery = StreamController.broadcast();
  Timer? _debounceTimer;

  SearchMovieDelegate({
    required this.searchMovieCallBack,
    required this.initialMovies,
  });

  void clearSteams() {
    debouncedMoviesQuery.close();
  }

  void _onQueryChanged(String query) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      final movies = await searchMovieCallBack(query);
      debouncedMoviesQuery.add(movies);
    });
  }

  @override
  String get searchFieldLabel => 'Search Movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        FadeIn(
          child: IconButton(
            onPressed: () => query = '',
            icon: const Icon(Icons.clear_rounded),
          ),
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          clearSteams();
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black45,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildSuggestions');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return StreamBuilder(
      initialData: initialMovies,
      stream: debouncedMoviesQuery.stream,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieItem(
            movie: movies[index],
            onMovieSelected: (contex, movie) {
              clearSteams();
              close(context, movie);
            },
          ),
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;
  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(children: [
          SizedBox(
            width: size.width * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.backdropPath,
                width: size.width * 0.3,
                height: size.height * 0.15,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                (movie.overview.length > 100)
                    ? Text(
                        '${movie.overview.substring(0, 100)}...',
                        style: textTheme.bodyMedium,
                      )
                    : Text(
                        movie.overview,
                        style: textTheme.bodyMedium,
                      ),
                Row(
                  children: [
                    Icon(
                      Icons.star_half_rounded,
                      color: Colors.yellow.shade800,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      HumanFormats.number(movie.voteAverage, 1),
                      style: textTheme.bodyMedium!.copyWith(color: Colors.yellow.shade800),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
