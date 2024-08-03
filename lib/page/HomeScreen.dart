import 'package:flutter/material.dart';
import 'package:flutter_discord/component/ServerList.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 75.0,
                  color: Colors.pink,
                  child: ServerList("test1"),
                ),
                Expanded(
                  child: Container(
                    color: Colors.cyan,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}