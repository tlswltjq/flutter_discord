import 'package:flutter/material.dart';

///화면을 가로, 세로 방향으로 비율과 위젯을 배치할 수 있는 레이아웃 위젯
///비율, 위젯 쌍 widgets을 axis가 0 이면 가로, 0이 아니라면 세로방향으로 배치

class SplitLayout extends StatelessWidget {
  final List<Map<int, Widget>> widgets;
  final int axis;

  const SplitLayout({
    super.key,
    required this.widgets,
    required this.axis,
  });

  @override
  Widget build(BuildContext context) {
    if (axis == 0) {
      return Row(
        children: widgets.map((pair) {
          int ratio = pair.keys.first;
          Widget widget = pair.values.first;
          return Expanded(
            flex: ratio,
            child: widget,
          );
        }).toList(),
      );
    } else {
      return Column(
        children: widgets.map((pair) {
          int ratio = pair.keys.first;
          Widget widget = pair.values.first;
          return Expanded(
            flex: ratio,
            child: widget,
          );
        }).toList(),
      );
    }
  }
}
