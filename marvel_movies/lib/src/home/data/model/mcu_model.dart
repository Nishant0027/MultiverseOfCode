// To parse this JSON data, do
//
//     final mcuModel = mcuModelFromJson(jsonString);

class McuModel {
  final List<Data> data;
  final int? total;

  McuModel({required this.data, this.total});

  factory McuModel.fromJson(Map<String, dynamic> json) => McuModel(
    data:
        json["data"] == null
            ? []
            : List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "total": total,
  };
}

class Data {
  final int? id;
  final String? title;
  final DateTime? releaseDate;
  final String? boxOffice;
  final int? duration;
  final String? overview;
  final String? coverUrl;
  final String? trailerUrl;
  final String? directedBy;
  final int? phase;
  final Saga? saga;
  final int? chronology;
  final int? postCreditScenes;
  final String? imdbId;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.title,
    this.releaseDate,
    this.boxOffice,
    this.duration,
    this.overview,
    this.coverUrl,
    this.trailerUrl,
    this.directedBy,
    this.phase,
    this.saga,
    this.chronology,
    this.postCreditScenes,
    this.imdbId,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    saga: sagaValues.map[json["saga"]]!,
    chronology: json["chronology"],
    postCreditScenes: json["post_credit_scenes"],
    imdbId: json["imdb_id"],
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "release_date":
        "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
    "box_office": boxOffice,
    "duration": duration,
    "overview": overview,
    "cover_url": coverUrl,
    "trailer_url": trailerUrl,
    "directed_by": directedBy,
    "phase": phase,
    "saga": sagaValues.reverse[saga],
    "chronology": chronology,
    "post_credit_scenes": postCreditScenes,
    "imdb_id": imdbId,
    "updated_at": updatedAt?.toIso8601String(),
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
