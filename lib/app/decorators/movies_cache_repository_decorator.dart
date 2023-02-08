import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/movie_model.dart';
import '../repositories/movie_repository.dart';
import 'movies_repository_decorator.dart';

class MoviesCacheRepositoryDecorator extends MovieRepositoryDecorator {
  MoviesCacheRepositoryDecorator(MoviesRepository moviesRepository) : super(moviesRepository);

  @override
  Future<MoviesModel> getMovies() async {
    try {
      MoviesModel movies = await super.getMovies();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return await _getInCache();
    }
  }

  _saveInCache(MoviesModel movies) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
  }

  Future<MoviesModel> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var stringJsonMovies = prefs.getString('movies_cache')!;
    var json = jsonDecode(stringJsonMovies);
    var movies = MoviesModel.fromJson(json);
    return movies;
  }
}
