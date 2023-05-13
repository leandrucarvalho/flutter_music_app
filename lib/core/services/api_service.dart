import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_music_app/shared/models/genre_details_model.dart';
import 'package:flutter_music_app/shared/models/genre_model.dart';

import '../erros/exceptions.dart';

class ApiService extends DioForNative {
  ApiService([super.baseOptions]);

  Future<List<GenreModel>> getGenres() async {
    try {
      const endPoint = "/genres";
      final response = await get(endPoint);

      return (response.data as List)
          .map((genre) => GenreModel.fromMap(genre))
          .toList();
    } on DioError catch (dioError, stackTrace) {
      log(
        "Erro ao fazer o get dos gêneros musicais",
        error: dioError,
        stackTrace: stackTrace, // mostra em qual linha esta o erro
      );
      throw ApiException(
          message: "Erro ao carregar gêneros.",
          statusCode: dioError.response?.statusCode);
    } catch (error, stackTrace) {
      log(
        "Erro ao fazer o get dos gêneros musicais.",
        error: error,
        stackTrace: stackTrace,
      );
      throw GeneralException();
    }
  }

  Future<GenreDetailsModel> getGenreDetails({required String genre}) async {
    try {
      final endPoint = "/genres/$genre";
      final response = await get(endPoint);

      return GenreDetailsModel.fromMap(response.data);
    } on DioError catch (dioError, stackTrace) {
      log(
        "Erro ao fazer o get dos detalhes do gênero musical.",
        error: dioError,
        stackTrace: stackTrace, // mostra em qual linha esta o erro
      );
      throw ApiException(
          message: "Erro ao carregar detalhes do gênero.",
          statusCode: dioError.response?.statusCode);
    } catch (error, stackTrace) {
      log(
        "Erro ao fazer o get dos detalhes do gênero musical.",
        error: error,
        stackTrace: stackTrace,
      );
      throw GeneralException();
    }
  }
}
