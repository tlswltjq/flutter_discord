import 'package:flutter/material.dart';
import 'package:flutter_discord/domain/Server.dart';

class ServerList extends StatelessWidget {
  final List<Server>? serverList;

  ServerList(this.serverList);

  @override
  Widget build(BuildContext context) {
    // 서버 목록을 표시하는 위젯 빌드 로직
    if (serverList == null || serverList!.isEmpty) {
      return Center(
        child: Text('No servers available'),
      );
    }

    return ListView.builder(
      itemCount: serverList!.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(serverList![index].name),
        );
      },
    );
  }
}