import 'dart:convert';
import 'package:http/http.dart';

import '/models/user_model.dart';


class UserRepository {
  getUser() async {
    print("getUser");
    var uri = Uri.parse("https://dummyjson.com/users");
    Response response = await get(uri);

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)["users"];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
