import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/presentation/providers/providers.dart';
import 'package:movies_app/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(topReatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingSlideShowMovies = ref.watch(moviesSlideShowProvider);
    final movies = ref.watch(nowPlayingMoviesProvider);
    final topRatedMovies = ref.watch(topReatedMoviesProvider);
    final upComingMovies = ref.watch(upcomingMoviesProvider);
    final isFetchingMovies = ref.watch(initialLoaderProvider);

    if (isFetchingMovies) return const FullScreenLoader();

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(children: [
              // * Slide Movies
              MoviesSlideshow(movies: nowPlayingSlideShowMovies),

              // * Now Playing Movies
              MovieHorizontalListView(
                movies: movies,
                title: 'Now Playing',
                subTitle: 'Monday 2th',
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              // * Top Rated Movies
              MovieHorizontalListView(
                movies: topRatedMovies,
                title: 'Top Rated',
                subTitle: 'October',
                loadNextPage: () =>
                    ref.read(topReatedMoviesProvider.notifier).loadNextPage(),
              ),
              // * UpComing Movies
              MovieHorizontalListView(
                movies: upComingMovies,
                title: 'Upcoming',
                loadNextPage: () =>
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
              ),
            ]);
          }, childCount: 1),
        ),
      ],
    );
  }
}
