class MovieEntity {
  MovieEntity({
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

  @override
  String toString() {
    return "\nadult: $adult;\ngenreIds: $genreIds;\nid: $id;posterPath: $posterPath;\nmediaType: $mediaType;\noriginalLanguage: $originalLanguage;\noriginalTitle: $originalTitle;\noverview: $overview;\npopularity: $popularity;\nreleaseDate: $releaseDate;\ntitle: $title;\nvideo: $video;\nvoteAverage: $voteAverage;\nvoteCount: $voteCount\n";
  }
}
