class CreatedBy {
  CreatedBy({
    required this.id,
    required this.name,
    required this.username,
  });
  late final String id;
  late final String name;
  late final String username;

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;
    return _data;
  }

  @override
  String toString() {
    return "\nid: $id;\nname: $name;\nusername: $username;";
  }
}
