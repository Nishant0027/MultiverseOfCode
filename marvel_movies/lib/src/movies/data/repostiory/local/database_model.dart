class DbModel {
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

  DbModel({
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

  DbModel.fromMap(Map<String, dynamic> value)
      : id = value['id'],
        title = value['title'],
        releaseDate = value['releaseDate'],
        boxOffice = value['boxOffice'],
        duration = value['duration'],
        overview = value['overview'],
        coverUrl = value['coverUrl'],
        trailerUrl = value['trailerUrl'],
        directedBy = value['directedBy'],
        phase = value['phase'],
        saga = value['saga'],
        chronology = value['chronology'],
        postCreditScenes = value['postCreditScenes'],
        imdbId = value['imdbId'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'boxOffice': boxOffice,
      'duration': duration,
      'overview': overview,
      'coverUrl': coverUrl,
      'trailerUrl': trailerUrl,
      'directedBy': directedBy,
      'phase': phase,
      'saga': saga,
      'chronology': chronology,
      'postCreditScenes': postCreditScenes,
      'imdbId': imdbId,
    };
  }
}
