import 'package:flutter/material.dart';
import 'package:flutter_discord/api/api.dart';
import 'package:flutter_discord/component/ServerList.dart';
import 'package:flutter_discord/domain/Server.dart';
import 'package:logger/logger.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  var logger = Logger();
  final apiService = ApiService();
  List<Server> serverList = [];
  String memberId = "test1";

  @override
  void initState() {
    super.initState();
    fetchServerList();
  }

  void fetchServerList() async {
    try {
      logger.i("Fetching!! >:D");
      List<Server> fetchedServerList = await apiService.getServerList(memberId);
      setState(() {
        serverList = fetchedServerList;
      });
    } catch (e) {
      logger.e("Failed to fetch server list : "+ e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(width: 75.0, child: ServerList(serverList)),
                Expanded(child: Container(color: Colors.cyan)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}