import 'dart:convert';

import 'package:flutter_discord/api/const.dart';
import 'package:flutter_discord/domain/Server.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = BASE_URL;

  Future<List<Server>> getServerList(String memberId) async {
    final response = await http.get(Uri.parse('$baseUrl/server?memberId=$memberId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<Server> serverList =
          jsonResponse.map((data) => Server.fromJson(data)).toList();
      return serverList;
    } else {
      throw Exception('Failed to load server list');
    }
  }

//todo : getChannelList메서드도 List<Channel>을 반환하도록 바디를 포함해 수정 필요
  Future<http.Response> getChannelList(int serverId) async {
    final url = Uri.parse('$baseUrl/$serverId/channels');
    final response = await http.get(url);
    return response;
  }
}
