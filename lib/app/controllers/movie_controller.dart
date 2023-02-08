import 'package:flutter/cupertino.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';
import '../repositories/movie_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;

  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<MoviesModel?> movies = ValueNotifier<MoviesModel?>(null);
  MoviesModel? _cachedMovies;

  onChanged(String value) {
    List<MovieDetailsModel> list = _cachedMovies!.movieList
        .where(
          (e) => e.toString().toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
    movies.value = movies.value!.copyWith(movieList: list);
  }

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
    _cachedMovies = movies.value;
  }
}
