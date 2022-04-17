import 'dart:convert';

class FavoriteMoviesListEntity {
  FavoriteMoviesListEntity({
    required this.id,
    required this.name,
  });
  
  final int id;
  final String name;

  @override
  String toString() => 'FavoriteList(id: $id, name: $name)';
}
