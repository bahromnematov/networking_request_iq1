import 'dart:convert';

import 'package:http/http.dart';

import '../model/post_model.dart';

class Network {
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {
    "Content-type": "application/json; charset=UTF-8"
  };

  static String apiPosts = "/comments";
  static String apiPostCreate = "/comments";
  static String apiUpdatePost = "/comments/";
  static String apiDeletePost = "/comments/";

  static Future<String> GET(String api, Map<String, String> params) async {
    var url = Uri.https(BASE, apiPosts, params);
    var response = await get(url, headers: params);
    if (response.statusCode == 200) {
      return response.body;
    }
    return "Xatolik bor";
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static List<Post> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((element) => Post.fromJson(element)));
    return data;
  }
}
