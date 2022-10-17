import 'dart:convert';

import 'package:login_3oy3_vazifa/service/user2.dart';
import 'package:login_3oy3_vazifa/service/userr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static storeUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    prefs.setString('user', stringUser);
  }

  static Future<User?> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString('user');
    if (stringUser == null || stringUser.isEmpty) {
      return null;
    }

    Map<String, dynamic> map = jsonDecode(stringUser);
    return User.fromJson(map);
  }

  static Future<bool> userRemove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user');
  }

  static storeUser2(User2 user2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser2 = jsonEncode(user2);
    prefs.setString('user2', stringUser2);
  }

  static Future<User2?> loadUser2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser2 = prefs.getString('user2');
    if (stringUser2 == null || stringUser2.isEmpty) {
      return null;
    }

    Map<String, dynamic> map = jsonDecode(stringUser2);
    return User2.fromJson(map);
  }

  static Future<bool> removeLoad() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user2');
  }
}
