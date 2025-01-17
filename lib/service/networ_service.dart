import 'dart:convert';

import 'package:http/http.dart';
import 'package:networking_request/model/valyuta_model.dart';

import '../model/post_model.dart';
import '../model/user_model.dart';

class Network {
  static String BASE = "https://cbu.uz/uz/arkhiv-kursov-valyut/json/";
  static Map<String, String> headers = {
    "Content-type": "application/json; charset=UTF-8"
  };

  static String apiPosts = "";
  static String apiPostCreate = "/users";
  static String apiUpdatePost = "/users/";
  static String apiDeletePost = "/users/";

  static Future<String> GET() async {
    var url = Uri.parse(BASE);
    var response = await get(url);
    if (response.statusCode == 200) {
      return response.body;
    }
    return "Xatolik bor";
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static List<ValyutaModel> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<ValyutaModel>.from(json.map((element) => ValyutaModel.fromJson(element)));
    return data;
  }
}
