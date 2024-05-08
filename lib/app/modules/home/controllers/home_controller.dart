import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sekawan_flutter/app/data/models/user.dart';

class HomeController extends GetxController {
  Future<List<User>> getAllUser() async {
    Uri url = Uri.parse('https://reqres.in/api/users?page=1');
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => User.fromJson(e)).toList();
    }
  }
}
