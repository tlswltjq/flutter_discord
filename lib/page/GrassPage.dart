import 'package:flutter/material.dart';
import 'package:flutter_diary/layouts/SplitLayout.dart';

class GrassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("기록")),
      body: Center(
        // child: Text("Grass"),
        child: SplitLayout(axis: 1, widgets: [
          {1: Container(color : Colors.green, child: Center(child: Text("Grass")))},
          {1: Container(child: Center(child: Text("로그 표시할 자리")))},
        ]),
      ),
    );
    throw UnimplementedError();
  }
}
