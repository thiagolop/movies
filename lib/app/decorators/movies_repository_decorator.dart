import '../models/movie_model.dart';
import '../repositories/movie_repository.dart';

class MovieRepositoryDecorator implements MoviesRepository {
  final MoviesRepository _moviesRepository;
  MovieRepositoryDecorator(this._moviesRepository);

  @override
  Future<MoviesModel> getMovies() async {
    return await _moviesRepository.getMovies();
  }
}
