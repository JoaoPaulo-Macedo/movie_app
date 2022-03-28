class Movies {
  Movies({
    required this.adult,
    required this.genreIds,
    required this.id,
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

  Movies.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
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
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['media_type'] = mediaType;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['release_date'] = releaseDate;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }

  @override
  String toString() {
    return "\nadult: $adult;\ngenreIds: $genreIds;\nid: $id;\nmediaType: $mediaType;\noriginalLanguage: $originalLanguage;\noriginalTitle: $originalTitle;\noverview: $overview;\npopularity: $popularity;\nreleaseDate: $releaseDate;\ntitle: $title;\nvideo: $video;\nvoteAverage: $voteAverage;\nvoteCount: $voteCount\n";
  }
}
