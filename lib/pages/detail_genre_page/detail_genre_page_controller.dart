part of '../../pages/_controllers.dart';

class DetailGenrePageController extends GetxController {
  int _initPage = 1;
  ListMovieByGenre? _data;
  late GenreElement _genre;
  ScrollController _scrollController = ScrollController();
  bool _isLoading = true;

  @override
  void onInit() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        print('MAX');
        if (initPage < getData!.totalPages) {
          ListMovieByGenre newData = (await ApiServices.getMoviesByGenre(
            genre: genre.id.toString(),
            page: initPage.toString(),
          ))!;
          addList(newData.results);
          initPage += 1;
          update();
        }
      }
    });
  }

  Future<void> goToPage(GenreElement genre) async {
    isLoading = true;
    this.genre = genre;
    initPage = 1;
    Get.to(const DetailGenrePageView());

    print('genre.id: ' + genre.id.toString());

    setData = (await ApiServices.getMoviesByGenre(
      genre: genre.id.toString(),
      page: '1',
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

  void addList(List<Result> newData) {
    List<Result> data = getData!.results;
    data.addAll(newData);
    update();
  }

  ListMovieByGenre? get getData {
    return _data;
  }

  set setData(ListMovieByGenre value) {
    _data = value;
    update();
  }

  GenreElement get genre => _genre;

  set genre(GenreElement value) {
    _genre = value;
    update();
  }

  ScrollController get scrollController => _scrollController;

  set scrollController(ScrollController value) {
    _scrollController = value;
    update();
  }

  int get initPage => _initPage;

  set initPage(int value) {
    _initPage = value;
    update();
  }
}
