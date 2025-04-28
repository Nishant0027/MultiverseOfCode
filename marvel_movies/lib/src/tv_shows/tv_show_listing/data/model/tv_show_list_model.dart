// To parse this JSON data, do
//
//     final tvShowListModel = tvShowListModelFromJson(jsonString);

import 'dart:convert';

TvShowListModel tvShowListModelFromJson(String str) =>
    TvShowListModel.fromJson(json.decode(str));

String tvShowListModelToJson(TvShowListModel data) =>
    json.encode(data.toJson());

class TvShowListModel {
  final List<TvShowData>? data;
  final int? total;

  TvShowListModel({this.data, this.total});

  factory TvShowListModel.fromJson(Map<String, dynamic> json) =>
      TvShowListModel(
        data:
            json["data"] == null
                ? []
                : List<TvShowData>.from(
                  json["data"]!.map((x) => TvShowData.fromJson(x)),
                ),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
    "data":
        data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "total": total,
  };
}

class TvShowData {
  final int? id;
  final String? title;
  final DateTime? releaseDate;
  final DateTime? lastAiredDate;
  final int? season;
  final int? numberEpisodes;
  final String? overview;
  final String? coverUrl;
  final String? trailerUrl;
  final String? directedBy;
  final int? phase;
  final Saga? saga;
  final String? imdbId;

  TvShowData({
    this.id,
    this.title,
    this.releaseDate,
    this.lastAiredDate,
    this.season,
    this.numberEpisodes,
    this.overview,
    this.coverUrl,
    this.trailerUrl,
    this.directedBy,
    this.phase,
    this.saga,
    this.imdbId,
  });

  factory TvShowData.fromJson(Map<String, dynamic> json) => TvShowData(
    id: json["id"],
    title: json["title"],
    releaseDate:
        json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
    lastAiredDate:
        json["last_aired_date"] == null
            ? null
            : DateTime.parse(json["last_aired_date"]),
    season: json["season"],
    numberEpisodes: json["number_episodes"],
    overview: json["overview"],
    coverUrl: json["cover_url"],
    trailerUrl: json["trailer_url"],
    directedBy: json["directed_by"],
    phase: json["phase"],
    saga: json["sage"] == null ? null : sagaValues.map[json["saga"]],
    imdbId: json["imdb_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "release_date":
        "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "last_aired_date":
        "${lastAiredDate!.year.toString().padLeft(4, '0')}-${lastAiredDate!.month.toString().padLeft(2, '0')}-${lastAiredDate!.day.toString().padLeft(2, '0')}",
    "season": season,
    "number_episodes": numberEpisodes,
    "overview": overview,
    "cover_url": coverUrl,
    "trailer_url": trailerUrl,
    "directed_by": directedBy,
    "phase": phase,
    "saga": sagaValues.reverse[saga],
    "imdb_id": imdbId,
  };
}

enum Saga { INFINITY_SAGA, MULTIVERSE_SAGA }

final sagaValues = EnumValues({
  "Infinity Saga": Saga.INFINITY_SAGA,
  "Multiverse Saga": Saga.MULTIVERSE_SAGA,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
