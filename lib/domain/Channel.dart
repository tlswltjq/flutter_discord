class Channel {
  final int id;
  final int serverId;
  final String name;
  final String topic;
  final String type;
  final bool nsfw;
  final bool privateChannel;

  Channel({
    required this.id,
    required this.serverId,
    required this.name,
    required this.topic,
    required this.type,
    required this.nsfw,
    required this.privateChannel,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'],
      serverId: json['serverId'],
      name: json['name'],
      topic: json['topic'],
      type: json['type'],
      nsfw: json['nsfw'],
      privateChannel: json['privateChannel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serverId': serverId,
      'name': name,
      'topic': topic,
      'type': type,
      'nsfw': nsfw,
      'privateChannel': privateChannel,
    };
  }
}