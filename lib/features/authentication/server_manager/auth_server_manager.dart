import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/register_model.dart';

class AuthServerManager {
  String baseUrl = 'http://testflutter.aboodm.com/api';

  Future<LoginModel> login(String email, String password) async {
    final http.Response response = await http.post(
      Uri.parse('$baseUrl/login?email=$email&password=$password'),
      headers: {"Accept": "application/json"},
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return LoginModel.fromJson(data);
    } else {
      throw (data["message"]);
    }
  }

  Future<RegisterModel> register(String email, String name, String password,
      String confirmPassword) async {
    final http.Response response = await http.post(
      Uri.parse(
          '$baseUrl/register?name=$name&email=$email&password=$password&password_confirmation=$confirmPassword'),
      headers: {"Accept": "application/json"},
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return RegisterModel.fromJson(data);
    } else {
      throw (data["message"]);
    }
  }

  Future logout(String token) async {
    var headers = {'Accept': 'application/json', 'Authorization': token};
    var request = http.Request(
        'POST', Uri.parse('http://testflutter.aboodm.com/api/logout?'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
