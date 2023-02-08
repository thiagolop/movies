import '../models/movie_model.dart';

abstract class MoviesRepository {
  Future<MoviesModel> getMovies();
}
