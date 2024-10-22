class Activity{
  final String doName;
  final String type;
  final DateTime timeStamp;

  Activity({
    required this.doName,
    required this.type,
    required this.timeStamp,
  });
  
  factory Activity.fromJson(Map<String, dynamic> json){
    return Activity(
      doName: json['doName'],
      type: json['type'],
      timeStamp: DateTime.parse(json['timeStamp'])
      );
  }
  @override
  String toString() {
    return 'Activity(doName: $doName, type: $type, timeStamp: $timeStamp)';
  }
}