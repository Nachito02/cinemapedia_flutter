import 'package:cinemapedia/presentation/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isFavoriteMovieProvider = FutureProvider.family<bool, int>((
  ref,
  novieId,
) {


  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  final isFavoriteMovie = localStorageRepository.isFavoriteMovie(novieId);

  return isFavoriteMovie;
});
