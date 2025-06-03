import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_fin_news/model/LoginModel/login_api_res_model.dart';
import 'package:http/http.dart' as http;
import 'package:the_fin_news/model/LoginModel/update_profile_api_res_model.dart';
import 'package:the_fin_news/services/hive_database.dart';

class LoginControllers {
  /// USER LOGIN
  Future<LoginApiResModel> userLogin(
      {required String email, required String password}) async {
    LoginApiResModel loginApiResModel = LoginApiResModel();
    try {
      var request = http.MultipartRequest('POST',
          Uri.parse('https://smartstylin.in/fin/admin/student-login.php'));
      request.fields.addAll({'email': email, 'password': password});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        loginApiResModel = LoginApiResModel.fromJson(jsonDecode(jsonData));
      } else {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        loginApiResModel = LoginApiResModel.fromJson(jsonDecode(jsonData));
        debugPrint(
            'Login API Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint("Login Api Error: $e");
    }
    return loginApiResModel;
  }

  /// UPDATE PROFILE
  Future<ProfileUpdateApiResModel> updateProfile(
      {required String updatedName, required String updatedEmail}) async {
    ProfileUpdateApiResModel profileUpdateApiResModel =
        ProfileUpdateApiResModel();
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('https://smartstylin.in/fin/admin/profile-update-api.php'));
      request.body = json.encode({
        "id": int.parse("${HiveDatabase.getStudentId()}"),
        "name": updatedName,
        "email": updatedEmail
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        profileUpdateApiResModel =
            ProfileUpdateApiResModel.fromJson(jsonDecode(jsonData));
      } else {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        profileUpdateApiResModel =
            ProfileUpdateApiResModel.fromJson(jsonDecode(jsonData));
        debugPrint(
            'Login API Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint("Update profile api error: $e");
    }
    return profileUpdateApiResModel;
  }
}
