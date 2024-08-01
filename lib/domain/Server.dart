class Server {
  final String id;
  final String name;
  final String ownerId;

  Server({
    required this.id,
    required this.name,
    required this.ownerId,
  });

  factory Server.fromJson(Map<String, dynamic> json) {
    return Server(
      id: json['id'],
      name: json['name'],
      ownerId: json['ownerId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'ownerId': ownerId,
    };
  }
}