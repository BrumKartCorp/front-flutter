import 'dart:convert';

import 'package:brum_kart/entity/User.dart';
import 'package:http/http.dart' as http;

class Brumkart {

  static Future<User> fetchUser(String email) async {
    final response = await http.get(Uri.parse("http://srv01.lphn.fr:8001/account/get/mail/$email"));
    if(response.statusCode == 200) {
      return User.fromJSON(jsonDecode(response.body)[0]);
    }else {
      throw Exception("Failed to get user $email");
    }
  }

}