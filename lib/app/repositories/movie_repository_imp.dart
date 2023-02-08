import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movies/app/utilis/movies_api.dart';
import '../models/movie_model.dart';
import '../service/dio_service.dart';
import 'movie_repository.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImp({required DioService dioService}) : _dioService = dioService;

  @override
  Future<MoviesModel> getMovies() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      var result = await _dioService.getDio().get(API.requestMovieList);
      return MoviesModel.fromJson(result.data);
    } on DioError catch (e, s) {
      log('Error =>  $e', stackTrace: s);
      throw Exception(e.message);
    }
  }
}
