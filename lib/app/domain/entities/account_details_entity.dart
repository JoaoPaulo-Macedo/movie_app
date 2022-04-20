class AccountDetailsEntity {
  AccountDetailsEntity({
    required this.avatar,
    required this.id,
    required this.name,
    required this.includeAdult,
    required this.username,
  });

  final AvatarEntity avatar;
  final int id;
  final String name;
  final bool includeAdult;
  final String username;

  @override
  String toString() {
    return 'avatar: $avatar,id: $id, name: $name, username: $username';
  }
}

class AvatarEntity {
  AvatarEntity({
    this.gravatar,
    this.tmdb,
  });

  final Map<String, dynamic>? gravatar;
  final Map<String, dynamic>? tmdb;

  @override
  String toString() => 'gravatar: $gravatar, tmdb: $tmdb';
}
