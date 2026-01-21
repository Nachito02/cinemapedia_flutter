import 'package:cinemapedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextpage();
    ref.read(popularMoviesProvider.notifier).loadNextpage();
    ref.read(upcomingMoviesProvider.notifier).loadNextpage();
    ref.read(topRatedMoviesProvider.notifier).loadNextpage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvier);

    if (initialLoading) {
      return const FullScreenLoader();
    }


    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(upcomingMoviesProvider);




    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(title: CustomAppBar()),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MoviesSlideshow(movies: slideShowMovies),
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En Cines',
                  subTitle: 'Lunes 20',
                  loadNextPage: () {
                    ref.watch(nowPlayingMoviesProvider.notifier).loadNextpage();
                  },
                ),

                MovieHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',
                  subTitle: 'Este Mes',
                  loadNextPage: () {
                    ref.watch(popularMoviesProvider.notifier).loadNextpage();
                  },
                ),

                MovieHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Mejores',
                  // subTitle: 'Lunes 20',
                  loadNextPage: () {
                    ref.watch(topRatedMoviesProvider.notifier).loadNextpage();
                  },
                ),

                MovieHorizontalListview(
                  movies: upComingMovies,
                  title: 'Proximamente',
                  // subTitle: 'Lunes 20',
                  loadNextPage: () {
                    ref.watch(upcomingMoviesProvider.notifier).loadNextpage();
                  },
                ),

                const SizedBox(height: 10),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}