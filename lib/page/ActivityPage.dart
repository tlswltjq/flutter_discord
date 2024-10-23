import 'package:flutter/material.dart';
import 'package:flutter_diary/layouts/SplitLayout.dart';
import 'package:flutter_diary/widgets/ActivityLog.dart';
import 'package:flutter_diary/widgets/Grass.dart';
import 'package:flutter_diary/api/Api.dart';
import 'package:flutter_diary/model/Activity.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPage createState() => _ActivityPage();
}

class _ActivityPage extends State<ActivityPage> {
  final ApiService apiService = ApiService();
  List<Activity> activityList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchActivities();
  }

  void fetchActivities() async {
    try {
      activityList = await apiService.getActivity(6);
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("기록")),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : SplitLayout(axis: 1, widgets: [
                {1: Container(child: Center(child: Grass(activityList)))},
                {1: Container(child: Center(child: ActivityLog(activityList)))},
              ]),
      ),
    );
  }
}