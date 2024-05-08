

import 'dart:convert';
import 'dart:io';
import '../utils/app_locale.dart';
import '../widget/Flutter_toast_mes.dart';
class Network {
  /// STAG SERVER Call API
  static const String base_url = "https://newsapi.org";
  static const String api_verison = "v2";
  static const String API_key = "1050529c44e6489cacba8424952b0795";

  Future<dynamic> httpClient_request(
      {required String page_name}) async {
    try {
      HttpClient httpClient = HttpClient();
      HttpClientRequest? request;
      HttpClientResponse? response;
      print("HttpClient");
      print(Uri.parse("$base_url/$api_verison/$page_name&apiKey=$API_key"));
      request = await httpClient.getUrl(Uri.parse("$base_url/$api_verison/$page_name&apiKey=$API_key"));
      response = await request.close();
      print('response step 1');
      print(response.statusCode);
      print(response);
      String reply = await response.transform(utf8.decoder).join();
      // httpClient.close();
      // print('vvxcvcv');
      print(response.statusCode);
      print(reply);
      return reply;
    } on SocketException {
      Flutter_toast_mes().Error_Message(Tost_meassage.connectInternet,error_code: true);
    } catch (e) {
      print("svcvc");
    }
  }
  Map server_error = {
    'status': false,
    'msg': Tost_meassage.server_error,
  };
  Map pageNotFound = {
    'status': false,
    'msg': Tost_meassage.pageNotFound,
  };
}