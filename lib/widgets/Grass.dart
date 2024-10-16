import 'package:flutter/material.dart';
import 'package:flutter_diary/api/Api.dart';
import 'package:flutter_diary/model/Activity.dart';

class Grass extends StatefulWidget {
  @override
  _GrassState createState() => _GrassState();
}

class _GrassState extends State<Grass> {
  final ApiService apiService = ApiService();
  List<Activity> activityList = [];

  @override
  void initState() {
    super.initState();
    fetchActivities();
  }

  void fetchActivities() async {
    try {
      activityList = await apiService.getActivity(null);
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
