// To parse this JSON data, do
//
//     final mcuModel = mcuModelFromJson(jsonString);

import 'dart:convert';

McuModel mcuModelFromJson(String str) => McuModel.fromJson(json.decode(str));

String mcuModelToJson(McuModel data) => json.encode(data.toJson());

class McuModel {
  McuModel({required this.data, required this.total});

  List<Data> data;
  int? total;

  factory McuModel.fromJson(Map<String, dynamic> json) => McuModel(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "total": total,
  };
}

class Data {
  Data({
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
  });

  int id;
  String title;
  String releaseDate;
  String boxOffice;
  int duration;
  String overview;
  String coverUrl;
  String trailerUrl;
  String directedBy;
  int phase;
  String saga;
  int chronology;
  int postCreditScenes;
  String imdbId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? 0,
    title: json["title"] ?? '',
    releaseDate: json["release_date"] ?? '',
    boxOffice: json["box_office"] ?? '',
    duration: json["duration"] ?? 0,
    overview: json["overview"] ?? '',
    coverUrl: json["cover_url"] ?? '',
    trailerUrl: json["trailer_url"] ?? '',
    directedBy: json["directed_by"] ?? '',
    phase: json["phase"] ?? 0,
    saga: json["saga"] ?? '',
    chronology: json["chronology"] ?? 0,
    postCreditScenes: json["post_credit_scenes"] ?? 0,
    imdbId: json["imdb_id"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "release_date": releaseDate,
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
  };
}
