/*
{

1: Movie,
2: Movie,
3: Movie,
4: Movie
}

*/

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/presentation/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final favoritesMoviesProvider = StateNotifierProvider((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;

  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  Future<void> toggleFavoriteMovie(Movie movie) async {
    final isFavoriteMovie = await localStorageRepository.isFavoriteMovie(
      movie.id,
    );

    await localStorageRepository.toggleFavoriteMovie(movie);

    if (isFavoriteMovie) {
      state.remove(movie.id);
      state = {...state};
      return;
    }
    state = {...state, movie.id: movie};
  }


  Future<List<Movie>> loadNextPage() async {
    final movies = await localStorageRepository.loadFavoriteMovies(
      limit: 10,
      offset: page * 10,
    );

    page++;

    final tempMovies = <int, Movie>{};

    for(final movie in movies) {
    // state = {...state, movie.id: movie};

    tempMovies[movie.id] = movie;
    }

    state = {...state, ...tempMovies};


    return movies;


  } 


}
