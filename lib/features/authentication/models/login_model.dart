import 'package:shared_preferences/shared_preferences.dart';

class LoginModel {
  LoginModel({
    required this.message,
    required this.mess,
    required this.accessToken,
    required this.tokenType,
  });

  final String? message;
  final String? mess;
  final String? accessToken;
  final String? tokenType;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json["message"]  ?? 'No Message',
      mess: json["mess"]  ?? 'No Mess',
      accessToken: json["access_token"] ?? 'No Access Token',
      tokenType: json["token_type"] ?? 'Unknown Token Type',
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "mess": mess,
    "access_token": accessToken,
    "token_type": tokenType,
  };

  Future<void> cacheLoginToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("accessToken", accessToken!);
  }


}
