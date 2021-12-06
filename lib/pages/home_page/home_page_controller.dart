part of '../../pages/_controllers.dart';

class HomePageController extends GetxController {
  Genre? _data;
  bool _isLoading = true;

  @override
  void onInit() async {
    isLoading = true;

    final response = await ApiServices.getGenres();
    if (response != null) {
      setData = response;
    }

    isLoading = false;
    super.onInit();
  }

  void cardOnClick(GenreElement genre) {
    final controller = Get.put(DetailGenrePageController());
    controller.goToPage(genre);
  }

  int get getItemCount {
    return getData!.genres.length;
  }

  List<GenreElement> get getGenreList {
    return getData!.genres;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  Genre? get getData => _data;

  set setData(Genre value) {
    _data = value;
    update();
  }
}
