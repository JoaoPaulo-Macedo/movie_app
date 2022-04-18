class ListIdentifierEntity {
  ListIdentifierEntity({
    required this.id,
    required this.name,
    required this.posterPath,
  });

  final int id;
  final String name;
  final String posterPath;

  @override
  String toString() => 'ListIdentifierEntity(id: $id, name: $name, posterPath: $posterPath)';
}
