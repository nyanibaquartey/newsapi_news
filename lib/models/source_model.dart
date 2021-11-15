class Source {
  String id;
  String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    String name = '';
    if (json['name'] != null) {
      name = json['name'] as String;
    }
    String id = '';
    if (json['id'] != null) {
      id = json['id'] as String;
    }
    return Source(id: id, name: name);
  }
}
