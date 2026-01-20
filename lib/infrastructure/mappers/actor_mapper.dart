import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credit_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath != null
        ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
        : 'https://imgs.search.brave.com/fmTMVn_jm3TKF3KZ8l0_O221vwTEM4I_t7D7dWebcI8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/c2h1dHRlcnN0b2Nr/LmNvbS9zaHV0dGVy/c3RvY2svcGhvdG9z/LzExNTM2NzM3NTIv/ZGlzcGxheV8xNTAw/L3N0b2NrLXZlY3Rv/ci1wcm9maWxlLXBs/YWNlaG9sZGVyLWlt/YWdlLWdyYXktc2ls/aG91ZXR0ZS1uby1w/aG90by0xMTUzNjcz/NzUyLmpwZw',
    character: cast.character,
  );
}
