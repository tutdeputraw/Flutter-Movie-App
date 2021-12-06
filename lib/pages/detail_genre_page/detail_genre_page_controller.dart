part of '../../pages/_controllers.dart';

class DetailGenrePageController extends GetxController {
  ListMovieByGenre? _data;
  late GenreElement _genre;
  ScrollController scrollController = ScrollController();
  bool _isLoading = true;

  Future<void> goToPage(GenreElement genre) async {
    isLoading = true;
    this.genre = genre;
    Get.to(const DetailGenrePageView());

    print('genre.id: ' + genre.id.toString());

    setData = (await ApiServices.getMoviesByGenre(
      genre: genre.id.toString(),
    ))!;

    isLoading = false;
  }

  void movieOnClick(int movieId) async {
    final controller = Get.put(DetailMoviePageController());
    controller.goToPage(movieId.toString());
  }

  int get getItemCount {
    return getData!.results.length;
  }

  List<Result> get getItemList {
    return getData!.results;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  ListMovieByGenre? get getData => _data;

  set setData(ListMovieByGenre value) {
    _data = value;
    update();
  }

  GenreElement get genre => _genre;

  set genre(GenreElement value) {
    _genre = value;
    update();
  }
}
