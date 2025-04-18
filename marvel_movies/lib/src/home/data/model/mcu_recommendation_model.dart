// To parse this JSON data, do
//
//     final mcuRecommendation = mcuRecommendationFromJson(jsonString);

import 'dart:convert';

McuRecommendation mcuRecommendationFromJson(String str) =>
    McuRecommendation.fromJson(json.decode(str));

String mcuRecommendationToJson(McuRecommendation data) =>
    json.encode(data.toJson());

class McuRecommendation {
  McuRecommendation({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.boxOffice,
    required this.duration,
    required this.overview,
    required this.coverUrl,
    required this.trailerUrl,
    required this.directedBy,
    required this.phase,
    required this.saga,
    required this.chronology,
    required this.postCreditScenes,
    required this.imdbId,
    required this.relatedMovies,
  });

  int id;
  String title;
  DateTime? releaseDate;
  String? boxOffice;
  int? duration;
  String? overview;
  String coverUrl;
  String? trailerUrl;
  String? directedBy;
  int? phase;
  String? saga;
  int? chronology;
  int? postCreditScenes;
  String? imdbId;
  List<McuRecommendation>? relatedMovies;

  factory McuRecommendation.fromJson(Map<String, dynamic> json) =>
      McuRecommendation(
        id: json["id"],
        title: json["title"],
        releaseDate:
            json["release_date"] == null
                ? null
                : DateTime.parse(json["release_date"]),
        boxOffice: json["box_office"],
        duration: json["duration"],
        overview: json["overview"],
        coverUrl: json["cover_url"],
        trailerUrl: json["trailer_url"],
        directedBy: json["directed_by"],
        phase: json["phase"],
        saga: json["saga"],
        chronology: json["chronology"],
        postCreditScenes: json["post_credit_scenes"],
        imdbId: json["imdb_id"],
        relatedMovies:
            json["related_movies"] == null
                ? null
                : List<McuRecommendation>.from(
                  json["related_movies"].map(
                    (x) => McuRecommendation.fromJson(x),
                  ),
                ),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "release_date":
        releaseDate == null
            ? null
            : "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
    "box_office": boxOffice,
    "duration": duration,
    "overview": overview,
    "cover_url": coverUrl,
    "trailer_url": trailerUrl,
    "directed_by": directedBy,
    "phase": phase,
    "saga": saga,
    "chronology": chronology,
    "post_credit_scenes": postCreditScenes,
    "imdb_id": imdbId,
    "related_movies":
        relatedMovies == null
            ? null
            : List<dynamic>.from(relatedMovies!.map((x) => x.toJson())),
  };
}
