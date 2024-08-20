import 'package:flutter/material.dart';
import 'package:flutter_discord/api/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_discord/domain/Server.dart';
import 'package:logger/logger.dart';

class ServerList extends StatefulWidget {
  final String memberId;
  ServerList(this.memberId);
  // 필요한 필드 정의
  List<Server> serverList =[];

  @override
  _ServerListState createState() => _ServerListState();
}

// SERVERLIST를 받아오고 상태로 관리
class _ServerListState extends State<ServerList> {
  var logger = Logger();
  final apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    var serverList = await apiService.getServerList(widget.memberId);
    setState(() {
      widget.serverList = serverList;
    });
    logger.i("요청 보냄");
    logger.i(widget.serverList);
  }

  @override
  Widget build(BuildContext context) {
    logger.i("빌드시작");
    return Scaffold(
      appBar: AppBar(
        title: Text('Server List'),
      ),
      body: ListView.builder(
        itemCount: widget.serverList.length,
        itemBuilder: (context, index) {
          final server = widget.serverList[index];
          return ListTile(
            title: Text(server.name),
          );
        },
      ),
    );
    throw UnimplementedError();
  }
}
