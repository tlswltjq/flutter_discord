import 'package:flutter/material.dart';
import 'package:flutter_diary/page/ArticlePage.dart';
import 'package:flutter_diary/page/ActivityPage.dart';
import 'package:flutter_diary/page/MainPage.dart';
import 'package:flutter_diary/page/TodoPage.dart';
import 'package:logger/logger.dart';

void main() {
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _currentWidget = MainPage();

  void _changeWidget(Widget newWidget) {
    setState(() {
      _currentWidget = newWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _currentWidget,
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => _changeWidget(MainPage()),
              ),
              Container(), // 이후 위젯을 추가할 공간
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.grass),
                    onPressed: () => _changeWidget(ActivityPage()),
                  ),
                  IconButton(
                    icon: const Icon(Icons.article),
                    onPressed: () => _changeWidget(ArticlePage()),
                  ),
                  IconButton(
                    icon: const Icon(Icons.today_outlined),
                    onPressed: () => _changeWidget(TodoPage()),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
