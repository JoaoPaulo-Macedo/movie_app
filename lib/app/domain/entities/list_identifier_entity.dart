class ListIdentifierEntity {
  ListIdentifierEntity({
    required this.id,
    required this.name,
    required this.totalMovies,
    required this.userName,
    required this.posterPath,
    required this.averageRating,
  });

  final int id;
  final String name;
  final int totalMovies;
  final String? userName;
  final String? posterPath;
  final num? averageRating;

  @override
  String toString() {
    return 'List(id: $id, ${name.substring(0, (name.length < 10) ? name.length : 10)}, poster: ${posterPath != null}, user: ${userName != null})';
  }
}
