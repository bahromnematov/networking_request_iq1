import 'package:http/http.dart';

class Network {
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {
    "Content-type": "application/json; charset=UTF-8"
  };

  static String apiPosts = "/posts";
  static String apiPostCreate = "/posts";
  static String apiUpdatePost = "/posts/";
  static String apiDeletePost = "/posts/";

  static Future<String> GET(String api, Map<String, String> params) async {
    var url = Uri.https(BASE, apiPosts, params);
    var response = await get(url, headers: params);
    if (response.statusCode == 200) {
      return response.body;
    }
    return "Xatolik bor";
  }
}
