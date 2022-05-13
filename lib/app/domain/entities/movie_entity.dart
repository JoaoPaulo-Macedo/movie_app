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

  final bool? adult;
  final List<int>? genreIds;
  final int id;
  final String? posterPath;
  final String? mediaType;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final num? popularity;
  final String? releaseDate;
  final String title;
  final bool? video;
  final num? voteAverage;
  final int? voteCount;

  @override
  String toString() {
    return "\nadult: $adult;\ngenreIds: $genreIds;\nid: $id;posterPath: $posterPath;\nmediaType: $mediaType;\noriginalLanguage: $originalLanguage;\noriginalTitle: $originalTitle;\noverview: $overview;\npopularity: $popularity;\nreleaseDate: $releaseDate;\ntitle: $title;\nvideo: $video;\nvoteAverage: $voteAverage;\nvoteCount: $voteCount\n";
  }
}
