import 'package:flutter/material.dart';
import 'package:flutter_diary/model/Activity.dart';

class ActivityLog extends StatelessWidget {
  final List<Activity> activityList;

  ActivityLog(this.activityList);

  @override
  Widget build(BuildContext context) {
    // Group activities by date
    Map<String, List<Activity>> groupedActivities = {};
    for (var activity in activityList) {
      String date = activity.timeStamp.toLocal().toString().split(' ')[0];
      if (!groupedActivities.containsKey(date)) {
        groupedActivities[date] = [];
      }
      groupedActivities[date]!.add(activity);
    }

    // Sort the grouped activities by date in descending order
    var sortedKeys = groupedActivities.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return ListView(
      children: sortedKeys.map((key) {
        return ExpansionTile(
          title: Text(key),
          children: groupedActivities[key]!.map((activity) {
            return ListTile(
              title: Text(activity.doName),
              subtitle: Text(activity.type),
              trailing: Text(activity.timeStamp.toString()),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}