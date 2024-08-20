class Server {
  final int id;
  final String name;
  final String ownerId;

  Server({
    required this.id,
    required this.name,
    required this.ownerId,
  });

  factory Server.fromJson(Map<dynamic, dynamic> json) {
    return Server(
      id: json['id'],
      name: json['name'],
      ownerId: json['ownerId'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'ownerId': ownerId,
    };
  }

  @override
  String toString() {
    return 'Server{id: $id, name: $name, ownerID : $ownerId}';
  }
}
