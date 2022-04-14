import 'package:movie_app/domain/entities/movie.dart';

extension MovieDTO on MovieEntity {
  static MovieEntity fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      adult: json['adult'],
      genreIds: List.castFrom<dynamic, int>(json['genre_ids']),
      id: json['id'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
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
}
