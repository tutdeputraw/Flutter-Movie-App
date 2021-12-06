part of '_model.dart';

List<Video> videoFromJson(String str) =>
    List<Video>.from(json.decode(str)['results'].map((x) => Video.fromJson(x)));

String videoToJson(List<Video> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Video {
  String iso6391;
  String iso31661;
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  String publishedAt;
  String id;

  Video({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: json["published_at"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt,
        "id": id,
      };
}
