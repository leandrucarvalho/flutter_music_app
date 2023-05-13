import 'package:dartz/dartz.dart';
import 'package:flutter_music_app/core/erros/exceptions.dart';
import 'package:flutter_music_app/core/services/api_service.dart';
import 'package:flutter_music_app/shared/models/genre_model.dart';

import '../../../../core/erros/failures.dart';

class GenreListRepository {
  final ApiService _apiService;

  GenreListRepository({required ApiService apiService})
      : _apiService = apiService;

  Future<Either<Failure, List<GenreModel>>> getGenreList() async {
    try {
      final genres = await _apiService.getGenres();

      return Right(genres);
    } on ApiException catch (apiException) {
      return Left(GetGenreDetailsFailure(apiException.message));
    } on GeneralException catch (generealException) {
      return Left(GetGenreListFailure(generealException.message));
    }
  }
}
