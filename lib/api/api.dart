import 'package:flutter_discord/api/const.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
abstract class ApiService{
  Future<http.Response> getServerList(String memberId);
  Future<http.Response> getChannelList(int serverId);
}

class ApiServiceImpl implements ApiService{
  var logger = Logger();
  final String baseUrl = BASE_URL;
  
    @override
  Future<http.Response> getServerList(String memberId) async {
    logger.d("serverList요청 함수 실행 :D");
    final url = Uri.parse('$baseUrl/server?memberId=$memberId');
    final response = await http.get(url);
    return response;
  }

  @override
  Future<http.Response> getChannelList(int serverId) async {
    logger.d("channelList요청 함수 실행 :D");
    final url = Uri.parse('$baseUrl/$serverId/channels');
    final response = await http.get(url);
    return response;
  }
}