import 'package:flutter/material.dart';
import 'package:flutter_diary/model/Activity.dart';

class Grass extends StatelessWidget {
  final List<Activity> activityList;
  final ScrollController _scrollController = ScrollController();

  Grass(this.activityList);

  @override
  Widget build(BuildContext context) {
    final dates = _generateDates();
    final emptyBoxCount = _calculateEmptyBoxCount(dates.first);
    final dateToActivities = _mapActivitiesToDates(activityList);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });

    return Scaffold(
      body: GridView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
        ),
        itemCount: dates.length + emptyBoxCount,
        itemBuilder: (context, index) {
          if (index < emptyBoxCount) {
            return Container(margin: EdgeInsets.all(1.0));
          } else {
            final date = dates[index - emptyBoxCount];
            final activities = dateToActivities[date];
            return _buildDateCell(date, activities);
          }
        },
      ),
    );
  }

  List<DateTime> _generateDates() {
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month - 5, 1);
    final endDate = now;
    final dates = <DateTime>[];

    for (DateTime date = startDate;
        date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
        date = date.add(Duration(days: 1))) {
      dates.add(DateTime(date.year, date.month, date.day));
    }

    return dates;
  }

  int _calculateEmptyBoxCount(DateTime startDate) {
    return startDate.weekday - 1;
  }

  Map<DateTime, List<Activity>> _mapActivitiesToDates(
      List<Activity> activities) {
    final dateToActivities = <DateTime, List<Activity>>{};

    for (var activity in activities) {
      final date = DateTime(activity.timeStamp.year, activity.timeStamp.month,
          activity.timeStamp.day);
      dateToActivities.putIfAbsent(date, () => []).add(activity);
    }

    return dateToActivities;
  }

  Widget _buildDateCell(DateTime date, List<Activity>? activities) {
    return Container(
      margin: EdgeInsets.all(1.0),
      color: activities != null ? Colors.green : Colors.grey,
      child: Stack(
        children: [
          Center(
            child: Text(
              '${date.month}/${date.day}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          if (activities != null)
            ...activities
                .map((activity) => _buildActivityIcon(activity))
                .toList(),
        ],
      ),
    );
  }

  Widget _buildActivityIcon(Activity activity) {
    final iconData = _getActivityIconData(activity.type);
    return Positioned(
      top: 5,
      right: 5,
      child: Icon(
        iconData.icon,
        color: iconData.color,
        size: 16,
      ),
    );
  }

  _ActivityIconData _getActivityIconData(String type) {
    switch (type) {
      case "TODO_ADD":
      case "TODO_DONE":
      case "TODO_UNDONE":
      case "TODO_UPDATE":
      case "TODO_DELETE":
        return _ActivityIconData(Icons.add_box, Colors.blue);
      case "TODOLIST_RENAME":
      case "TODOLIST_CREATE":
      case "TODOLIST_DELETE":
        return _ActivityIconData(Icons.list, Colors.red);
      default:
        return _ActivityIconData(Icons.help, Colors.green.shade100);
    }
  }
}

class _ActivityIconData {
  final IconData icon;
  final Color color;

  _ActivityIconData(this.icon, this.color);
}
