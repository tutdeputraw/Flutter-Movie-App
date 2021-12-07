part of '_model.dart';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
  Review({
    required this.id,
    required this.page,
    required this.reviews,
    required this.totalPages,
    required this.totalResults,
  });

  int id;
  int page;
  List<ReviewElement> reviews;
  int totalPages;
  int totalResults;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        page: json["page"],
        reviews: List<ReviewElement>.from(
          json["results"].map((x) => ReviewElement.fromJson(x)),
        ),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "page": page,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class ReviewElement {
  ReviewElement({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  String author;
  AuthorDetails authorDetails;
  String content;
  DateTime createdAt;
  String id;
  DateTime updatedAt;
  String url;

  factory ReviewElement.fromJson(Map<String, dynamic> json) => ReviewElement(
        author: json["author"],
        authorDetails: AuthorDetails.fromJson(json["author_details"]),
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "author_details": authorDetails.toJson(),
        "content": content,
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "url": url,
      };
}

class AuthorDetails {
  AuthorDetails({
    required this.name,
    required this.username,
    this.avatarPath,
    this.rating,
  });

  String name;
  String username;
  String? avatarPath;
  double? rating;

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
        name: json["name"],
        username: json["username"],
        avatarPath: json["avatar_path"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "avatar_path": avatarPath,
        "rating": rating,
      };
}

// List<Review> reviewFromJson(String str) => List<Review>.from(
//     json.decode(str)['results'].map((x) => Review.fromJson(x)));
//
// String reviewToJson(List<Review> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Review {
//   String author;
//   AuthorDetails authorDetails;
//   String content;
//   DateTime createdAt;
//   String id;
//   DateTime updatedAt;
//   String url;
//
//   Review({
//     required this.author,
//     required this.authorDetails,
//     required this.content,
//     required this.createdAt,
//     required this.id,
//     required this.updatedAt,
//     required this.url,
//   });
//
//   factory Review.fromJson(Map<String, dynamic> json) => Review(
//         author: json["author"],
//         authorDetails: AuthorDetails.fromJson(json["author_details"]),
//         content: json["content"],
//         createdAt: DateTime.parse(json["created_at"]),
//         id: json["id"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         url: json["url"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "author": author,
//         "author_details": authorDetails.toJson(),
//         "content": content,
//         "created_at": createdAt.toIso8601String(),
//         "id": id,
//         "updated_at": updatedAt.toIso8601String(),
//         "url": url,
//       };
// }
//
// class AuthorDetails {
//   String name;
//   String username;
//   String? avatarPath;
//   double? rating;
//
//   AuthorDetails({
//     required this.name,
//     required this.username,
//     this.avatarPath,
//     this.rating,
//   });
//
//   factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
//         name: json["name"],
//         username: json["username"],
//         avatarPath: json["avatar_path"],
//         rating: json["rating"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "username": username,
//         "avatar_path": avatarPath,
//         "rating": rating,
//       };
// }
