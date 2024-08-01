import 'package:http/http.dart' as http;

abstract class ApiService{
  Future<http.Response> getServerList(String memberId);
  Future<http.Response> getChannelList(int serverId);
}