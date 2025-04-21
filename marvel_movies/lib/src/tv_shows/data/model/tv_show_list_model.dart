class TvShowListModel {
  final List<Datum>? data;
  final int? total;

  TvShowListModel({this.data, this.total});

  factory TvShowListModel.fromJson(Map<String, dynamic> json) =>
      TvShowListModel(
        data:
            json["data"] == null
                ? []
                : List<Datum>.from(json["data"]?.map((x) => Datum.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
    "data":
        data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "total": total,
  };
}

class Datum {
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    saga: sagaValues.map[json["saga"]] ?? Saga.INFINITY_SAGA,
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
