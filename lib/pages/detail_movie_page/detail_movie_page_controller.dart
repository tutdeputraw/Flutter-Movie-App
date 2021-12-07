part of '../../pages/_controllers.dart';

class DetailMoviePageController extends GetxController {
  ScrollController _scrollController = ScrollController();
  bool _isLoading = true;
  Movie? _data;
  List<Video>? _videos;
  Review? _reviews;

  Future<void> goToPage(String movieId) async {
    isLoading = true;
    Get.to(const DetailMoviePageView());

    setData = (await ApiServices.getMovie(movieId))!;
    setVideos = (await ApiServices.getVideos(movieId))!;
    setReviews = (await ApiServices.getReviews(id: movieId, pages: '1'))!;

    isLoading = false;
  }

  void seeAllOnClick() {
    final controller = Get.put(DetailReviewPageController());
    controller.goToPage(getData!);
  }

  void backOnCLick() {
    Get.back();
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
    update();
  }

  Review? get getReviews => _reviews;

  set setReviews(Review value) {
    _reviews = value;
    update();
  }

  ScrollController get scrollController => _scrollController;

  set scrollController(ScrollController value) {
    _scrollController = value;
    update();
  }
}
