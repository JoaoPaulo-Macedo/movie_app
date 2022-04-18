class ListIdentifierEntity {
  ListIdentifierEntity({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.totalMovies,
    required this.userName,
  });

  final int id;
  final String name;
  final String? posterPath;
  final int totalMovies;
  final String? userName;

  @override
  String toString() {
    return 'List(id: $id, ${name.substring(0, (name.length < 10) ? name.length : 10)}, poster: ${posterPath != null}, user: ${userName != null})';
  }
}
