import 'package:flutter/material.dart';
import 'package:flutter_diary/layouts/SplitLayout.dart';
import 'package:flutter_diary/widgets/Grass.dart';
import 'package:flutter_diary/api/Api.dart';
import 'package:flutter_diary/model/Activity.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPage createState() => _ActivityPage();
}

class _ActivityPage extends State<ActivityPage> {
  final ApiService apiService = ApiService();
  List<Activity> activityList = [
    Activity(doName: "Finish the project report", type: "TODO_ADD", timeStamp: DateTime.parse("2024-05-02T10:00:00")),
    Activity(doName: "Buy groceries", type: "TODO_DONE", timeStamp: DateTime.parse("2024-05-05T11:30:00")),
    Activity(doName: "Plan the weekend trip", type: "TODO_ADD", timeStamp: DateTime.parse("2024-05-10T09:00:00")),
    Activity(doName: "Read a new book", type: "TODO_ADD", timeStamp: DateTime.parse("2024-05-12T14:00:00")),
    Activity(doName: "Clean the house", type: "TODO_ADD", timeStamp: DateTime.parse("2024-05-15T16:00:00")),
    Activity(doName: "Sixth TODO List", type: "TODOLIST_CREATE", timeStamp: DateTime.parse("2024-05-20T12:00:00")),
    Activity(doName: "Complete the assignment", type: "TODO_DONE", timeStamp: DateTime.parse("2024-06-01T10:00:00")),
    Activity(doName: "Workout for 30 minutes", type: "TODO_UNDONE", timeStamp: DateTime.parse("2024-06-03T11:30:00")),
    Activity(doName: "Watch a movie", type: "TODO_ADD", timeStamp: DateTime.parse("2024-06-07T09:00:00")),
    Activity(doName: "Organize the desk", type: "TODO_DONE", timeStamp: DateTime.parse("2024-06-10T14:00:00")),
    Activity(doName: "Third TODO List", type: "TODOLIST_RENAME", timeStamp: DateTime.parse("2024-06-15T12:00:00")),
    Activity(doName: "Call a friend", type: "TODO_ADD", timeStamp: DateTime.parse("2024-07-02T10:00:00")),
    Activity(doName: "Attend the meeting", type: "TODO_DONE", timeStamp: DateTime.parse("2024-07-05T11:30:00")),
    Activity(doName: "Submit the application", type: "TODO_ADD", timeStamp: DateTime.parse("2024-07-09T09:00:00")),
    Activity(doName: "Research new technologies", type: "TODO_DONE", timeStamp: DateTime.parse("2024-07-15T14:00:00")),
    Activity(doName: "Prepare for the presentation", type: "TODO_ADD", timeStamp: DateTime.parse("2024-07-20T16:00:00")),
    Activity(doName: "Fourth TODO List", type: "TODOLIST_CREATE", timeStamp: DateTime.parse("2024-07-25T12:00:00")),
    Activity(doName: "Check emails", type: "TODO_ADD", timeStamp: DateTime.parse("2024-08-01T10:00:00")),
    Activity(doName: "Finish the book review", type: "TODO_DONE", timeStamp: DateTime.parse("2024-08-02T11:30:00")),
    Activity(doName: "Update the website", type: "TODO_ADD", timeStamp: DateTime.parse("2024-08-10T09:00:00")),
    Activity(doName: "Buy a birthday gift", type: "TODO_DONE", timeStamp: DateTime.parse("2024-08-15T14:00:00")),
    Activity(doName: "Fifth TODO List", type: "TODOLIST_DELETE", timeStamp: DateTime.parse("2024-08-20T12:00:00")),
    Activity(doName: "Volunteer at the local shelter", type: "TODO_ADD", timeStamp: DateTime.parse("2024-09-02T10:00:00")),
    Activity(doName: "Go for a run", type: "TODO_DONE", timeStamp: DateTime.parse("2024-09-10T11:30:00")),
    Activity(doName: "Finish the project report", type: "TODO_ADD", timeStamp: DateTime.parse("2024-09-15T09:00:00")),
    Activity(doName: "Sixth TODO List", type: "TODOLIST_CREATE", timeStamp: DateTime.parse("2024-09-20T12:00:00")),
    Activity(doName: "Buy groceries", type: "TODO_ADD", timeStamp: DateTime.parse("2024-10-05T10:00:00")),
    Activity(doName: "Plan the weekend trip", type: "TODO_DONE", timeStamp: DateTime.parse("2024-10-12T11:30:00")),
    Activity(doName: "Read a new book", type: "TODO_ADD", timeStamp: DateTime.parse("2024-10-20T09:00:00")),
    Activity(doName: "Fourth TODO List", type: "TODOLIST_RENAME", timeStamp: DateTime.parse("2024-10-20T12:00:00")),
  ];

  @override
  void initState() {
    super.initState();
    // fetchActivities();
  }

  void fetchActivities() async {
    try {
      activityList = await apiService.getActivity(6);
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("기록")),
      body: Center(
        child: SplitLayout(axis: 1, widgets: [
          {1: Container(color: Colors.green, child: Center(child: Grass(activityList)))},
          {1: Container(child: Center(child: Text("로그 표시할 자리")))},
        ]),
      ),
    );
  }
}
