import 'package:movies_app/config/constant/environment.dart';
import 'package:movies_app/domian/entities/movie.dart';
import 'package:movies_app/infraestructure/models/movie_moviedb.dart';

class MovieMapper {
  static String size = '/w500';
  static Movie movieDBToEntity(MovieFromMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath:  (moviedb.backdropPath != '') 
      ? '${Environment.imageServer}$size${moviedb.backdropPath}'
      : 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '') 
      ? '${Environment.imageServer}size${moviedb.posterPath}'
      : 'no-poster',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
    );
}
