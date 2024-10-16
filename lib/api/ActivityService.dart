import 'package:flutter_diary/model/Activity.dart';

abstract class ActivityService{
  Future<List<Activity>> getActivity(int? months);
}