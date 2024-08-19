import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestButton extends StatefulWidget {
  @override
  _TestButtonState createState() => _TestButtonState();
}

class _TestButtonState extends State<TestButton> {
  String _time = '';
  int _millisecondsSinceEpoch = 0;
  String _date = '';

  Future<void> _fetchDateTime() async {
    try {
      final response = await ApiService().fetchDateTime();
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _time = data['time'];
          _millisecondsSinceEpoch = data['milliseconds_since_epoch'];
          _date = data['date'];
        });
      } else {
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _fetchDateTime,
            child: Text('Fetch DateTime'),
          ),
          Text('Time: $_time'),
          Text('Milliseconds since epoch: $_millisecondsSinceEpoch'),
          Text('Date: $_date'),
        ],
      ),
    );
  }
}

class ApiService {
  Future<http.Response> fetchDateTime() async {
    return http.get(Uri.parse("http://date.jsontest.com/"));
  }
}