part of '../../pages/_controllers.dart';

class DetailReviewPageController extends GetxController {
  int _initPage = 1;
  ScrollController _scrollController = ScrollController();
  Movie? _movie;
  bool _isLoading = true;
  Review? _reviews;

  @override
  void onInit() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        print('MAX');
        if (initPage < getReviews!.totalPages) {
          Review newData = (await ApiServices.getReviews(
            id: getMovie!.id.toString(),
            pages: initPage.toString(),
          ))!;
          addList(newData.reviews);
          initPage += 1;
          update();
        }
      }
    });
    super.onInit();
  }

  void goToPage(Movie movie) async {
    isLoading = true;
    setMovie = movie;
    initPage = 1;
    Get.to(const DetailReviewPageView());

    setReviews = (await ApiServices.getReviews(
      id: movie.id.toString(),
      pages: '1',
    ))!;

    isLoading = false;
  }

  void addList(List<ReviewElement> newData) {
    List<ReviewElement> data = getReviews!.reviews;
    data.addAll(newData);
    update();
  }

  Review? get getReviews => _reviews;

  int get getItemCount {
    return getReviews!.reviews.length;
  }

  set setReviews(Review value) {
    _reviews = value;
    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  Movie? get getMovie => _movie;

  set setMovie(Movie value) {
    _movie = value;
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
