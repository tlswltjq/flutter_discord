class Todo{
  final int id;
  final String descritpion;
  final bool isDone;

  Todo({
    required this.id,
    required this.descritpion,
    required this.isDone,
  });
  factory Todo.fromJson(Map<String, dynamic> json) {
    // Add your implementation here
    return Todo(
      id: json['id'],
      descritpion: json['descritpion'],
      isDone: json['isDone'],
    );
  }
  void toggle(){
    isDone != isDone;
  }
}