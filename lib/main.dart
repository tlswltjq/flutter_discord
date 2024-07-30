import 'package:flutter/material.dart';

void main() {
  /**
   * runApp()함수는 주어진 위젯을 받아 위젯트리의 루트로 만든다.
   * 아래의 예제에선 Center위젯과 그 자식 Text위젯이 구성되었다.
   */
  runApp(
    const Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}