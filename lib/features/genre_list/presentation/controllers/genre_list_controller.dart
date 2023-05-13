import 'package:flutter_music_app/core/erros/failures.dart';
import 'package:get/get.dart';

import '../../../../core/mixins/screen_loading_and_error_mixin.dart';
import '../../../../shared/models/genre_model.dart';
import '../../data/repository/genre_list_repository.dart';

//esse mixin serve para colocar a parte do erro e do carregamento das telas
class GenreListController extends GetxController
    with ScreenLoadingAndErrorMixin {
  final GenreListRepository _genreListRepository;

  GenreListController(GenreListRepository genreListRepository)
      : _genreListRepository = genreListRepository;

  //inicia vazio, pois ainda vai ser carregado
  final RxList<GenreModel> genres = RxList([]);

  @override
  void onInit() {
    getGenreList();
    super.onInit();
  }

  Future<void> getGenreList() async {
    setLoadingToTrue();
    setError(null);

    final getGenresResponse = await _genreListRepository.getGenreList();

    getGenresResponse.fold(
      (Failure failureResponse) {
        if (failureResponse is GetGenreListFailure) {
          setError(failureResponse.message);
        }
      },
      (List<GenreModel> genreResponse) {
        genres.value = genreResponse;
      },
    );

    setLoadingToFalse();
  }
}
