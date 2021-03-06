import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/model/_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static String baseURL = 'https://api.themoviedb.org/3';
  static String imageURL = 'https://image.tmdb.org/t/p/original';
  static String apiKey = 'cc3131ef061461aa1aa8949dfc428131';

  static Future<Genre?> getGenres() async {
    final uri = baseURL + '/genre/movie/list?api_key=$apiKey';

    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return genreFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<ListMovieByGenre?> getMoviesByGenre({
    required String genre,
    required String page,
  }) async {
    final uri = baseURL +
        '/discover/movie?api_key=$apiKey&with_genres=$genre&page=$page';

    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return movieByGenreFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<Movie?> getMovie(String id) async {
    final uri = baseURL + '/movie/$id?api_key=$apiKey';

    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return movieFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Video>?> getVideos(String id) async {
    final uri = baseURL + '/movie/$id/videos?api_key=$apiKey';

    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return videoFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<Review?> getReviews({required String id, required String pages}) async {
    final uri = baseURL + '/movie/$id/reviews?api_key=$apiKey';

    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return reviewFromJson(response.body);
    } else {
      return null;
    }
  }
}
