part of '../../pages/_controllers.dart';

class DetailMoviePageController extends GetxController {
  bool _isLoading = true;
  Movie? _data;
  List<Video>? _videos;

  Future<void> goToPage(String movieId) async {
    isLoading = true;
    Get.to(const DetailMoviePageView());

    setData = (await ApiServices.getMovie(movieId))!;
    setVideos = (await ApiServices.getVideos(movieId))!;

    isLoading = false;
  }

  void backOnCLick() {
    Get.close(2);
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  Movie? get getData => _data;

  set setData(Movie value) {
    _data = value;
    update();
  }

  List<Video>? get getVideos => _videos;

  set setVideos(List<Video> value) {
    _videos = value;
  }
}
