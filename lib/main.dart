import 'package:flutter/material.dart';
import 'package:flutter_diary/page/ArticlePage.dart';
import 'package:flutter_diary/page/GrassPage.dart';
import 'package:flutter_diary/page/MainPage.dart';
import 'package:flutter_diary/page/TodoPage.dart';

void main() {
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
        // floatingActionButton: FloatingActionButton(
        //     child: const Icon(Icons.light),
        //     onPressed: () {
        //       print(DateTime.now().weekday);
        //     }),
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
                    onPressed: () => _changeWidget(GrassPage()),
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