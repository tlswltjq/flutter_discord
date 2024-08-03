import 'package:flutter/material.dart';
import 'package:flutter_discord/page/HomeScreen.dart';

void main() {
  runApp(DiscordApp());
}

class DiscordApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      );
  }

}