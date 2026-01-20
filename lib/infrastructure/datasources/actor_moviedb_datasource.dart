


import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credit_response.dart';
import 'package:dio/dio.dart';
import 'package:cinemapedia/config/constants/environment.dart';

class ActorMoviedbDatasource extends ActorsDatasource {

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer ${Environment.movieDBJWT}',
      },
    ),
  );

  // List<Actor> _jsonToMovies(Map<String, dynamic> json) {
  //   final creditsResponse = CreditsResponse.fromJson(json);

  //   return creditsResponse.cast
  //       .map((moviedb) => ActorMapper.castToEntity(moviedb))
  //       .toList();
  // }


  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {

    final response = await dio.get(
      '/movie/$movieId/credits',
    );

    final castResponse =CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast.map((actor) => ActorMapper.castToEntity(actor)).toList();

    // _jsonToMovies(response.data);
   return actors;
  }

}