import 'package:flutter_discord/api/const.dart';
import 'package:http/http.dart' as http;

abstract class ApiService{
  Future<http.Response> getServerList(String memberId);
  Future<http.Response> getChannelList(int serverId);
}

class ApiServiceImpl implements ApiService{
  final String baseUrl = BASE_URL;
  
    @override
  Future<http.Response> getServerList(String memberId) async {
    final url = Uri.parse('$baseUrl/server?memberId=$memberId');
    final response = await http.get(url);
    return response;
  }

  @override
  Future<http.Response> getChannelList(int serverId) async {
    final url = Uri.parse('$baseUrl/$serverId/channels');
    final response = await http.get(url);
    return response;
  }
}