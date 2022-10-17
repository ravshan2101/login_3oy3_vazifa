import 'package:login_3oy3_vazifa/service/userr.dart';

class User2 {
  String? name;
  String? email;
  String? phon;
  String? password;

  User2({this.name, this.email, this.phon, this.password});

  User2.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phon = json['phon'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phon': phon,
        'password': password,
      };
}
