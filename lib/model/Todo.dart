class Todo{
  final int todoID;
  final String todoTitle;
  final bool done;

  Todo({
    required this.todoID,
    required this.todoTitle,
    required this.done,
  });

  void toggle(){
    done != done;
  }
}