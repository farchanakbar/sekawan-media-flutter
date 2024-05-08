import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sekawan_flutter/app/data/models/user.dart';

class DetailUserController extends GetxController {
  Future<User> getDetailUser(String id) async {
    Uri url = Uri.parse('https://reqres.in/api/users/$id');
    var res = await http.get(url);

    if (res.statusCode == 200) {
      Map<String, dynamic> data = json.decode(res.body)['data'];
      return User.fromJson(data);
    } else {
      return User.fromJson({});
    }
  }
}
