class Movie {
  Movie({
    required this.adult,
    required this.genreIds,
    required this.id,
    required this.posterPath,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  late final bool adult;
  late final List<int> genreIds;
  late final int id;
  late final String posterPath;
  late final String mediaType;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final num popularity;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final num? voteAverage;
  late final int voteCount;

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['adult'] = adult;
    json['genre_ids'] = genreIds;
    json['id'] = id;
    json['poster_path'] = posterPath;
    json['media_type'] = mediaType;
    json['original_language'] = originalLanguage;
    json['original_title'] = originalTitle;
    json['overview'] = overview;
    json['popularity'] = popularity;
    json['release_date'] = releaseDate;
    json['title'] = title;
    json['video'] = video;
    json['vote_average'] = voteAverage;
    json['vote_count'] = voteCount;
    return json;
  }

  Movie copyWith({
    bool? adult,
    List<int>? genreIds,
    int? id,
    String? posterPath,
    String? mediaType,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    num? popularity,
    String? releaseDate,
    String? title,
    bool? video,
    num? voteAverage,
    int? voteCount,
  }) {
    return Movie(
      adult: adult ?? this.adult,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      posterPath: posterPath ?? this.posterPath,
      mediaType: mediaType ?? this.mediaType,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  String toString() {
    return "\nadult: $adult;\ngenreIds: $genreIds;\nid: $id;posterPath: $posterPath;\nmediaType: $mediaType;\noriginalLanguage: $originalLanguage;\noriginalTitle: $originalTitle;\noverview: $overview;\npopularity: $popularity;\nreleaseDate: $releaseDate;\ntitle: $title;\nvideo: $video;\nvoteAverage: $voteAverage;\nvoteCount: $voteCount\n";
  }
}
