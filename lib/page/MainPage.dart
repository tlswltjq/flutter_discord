import 'package:flutter/material.dart';
import 'package:flutter_diary/layouts/SplitLayout.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("메인 레이아웃"),
      ),
      body: Center(
          child: SplitLayout(
        axis: 0,
        widgets: [
          {
            3: SplitLayout(widgets: [
              {1: Container(color: Colors.green)},
              {1: Container(color: Colors.red)}
            ], axis: 1)
          },
          {1: Container(color: Colors.blue)},
        ],
      )),
    );
  }
}
