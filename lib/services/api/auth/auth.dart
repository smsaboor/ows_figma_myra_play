import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ows_figma_myra_play/model/model_login.dart';
import 'package:ows_figma_myra_play/model/model_otp.dart';
import 'package:ows_figma_myra_play/model/model_registration.dart';
import 'package:ows_figma_myra_play/model/view_task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String url =
      'https://shivamelec.com/mywebsite/myraplay/API/view_task_for_usr.php';
  static Future<dynamic> getLogin(LoginModel model) async {
    var APIURLLogin = 'https://shivamelec.com/mywebsite/myraplay/API/login.php';
    http.Response response = await http
        .post(Uri.parse(APIURLLogin), body: model.toMap())
        .then((value) => value)
        .catchError((error) => print(" Failed to getLogin: $error"));
    var data = jsonDecode(response.body);
    print("getLogin DATA: ${data}");
    return data;
  }

  static Future<List<Data>> getUserTask(String? uid) async {
    // Map<String, dynamic> body = {'user_id': uid};
    Map<String, dynamic> body = {'user_id': '84'};
    try {
      final response = await http.post(Uri.parse(url),body:body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        ViewTask viewTaskFromJson(String str) => ViewTask.fromJson(json.decode(str));
        final ViewTask tasks= viewTaskFromJson(response.body);
        List<Data>? dataTask=tasks.data;
        for(int i=0;i<tasks.data!.length;i++){
        }
        return dataTask ?? <Data>[];
      } else {
        return <Data>[];
      }
    } catch (e) {
      debugPrint('$e');
      return <Data>[];
    }
  }

  // static Future<List<ViewTask>> getTask() async{
  //   var APIURL='https://shivamelec.com/mywebsite/myraplay/API/view_task_for_usr.php';
  //   final uri = Uri.parse('https://shivamelec.com/mywebsite/myraplay/API/view_task_for_usr.php');
  //   Map<String, dynamic> body = {'user_id ': 84};
  //   String jsonBody = json.encode(body);
  //   final encoding = Encoding.getByName('utf-8');
  //   http.Response response = await http.post(
  //     uri,
  //     body: jsonBody,
  //     encoding: encoding,
  //   );
  //   final List parsedList;
  //   List<ViewTask>? list;
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> parsed = json.decode(response.body);
  //     parsedList = json.decode(response.body);
  //     list = parsedList.map((val) =>  ViewTask.fromJson(val)).toList();
  //   } else {
  //
  //   }
  //   return list;
  // }

  static Future<String> getRegistration(RegistrationModel? model) async {
    print('${model?.name}');
    var APIURLRegistration =
        'https://shivamelec.com/mywebsite/myraplay/API/registration.php';
    http.Response response = await http
        .post(Uri.parse(APIURLRegistration), body: model?.toMap())
        .then((value) => value)
        .catchError(
            (error) => print("app Failed to getRegistration: $error"));
    var data = jsonDecode(response.body);
    print("getRegistration DATA: ${data[0]}");
    print("getRegistration DATA: ${data[0]['message']}");
    print(data[0]['success_code']);
    return data[0]['success_code'];
  }

  static Future<String> getHomeData() async {
    var APIURLRegistration =
        'https://shivamelec.com/mywebsite/game/php_api/home_text_api.php';
    http.Response response = await http
        .get(Uri.parse(APIURLRegistration))
        .then((value) => value)
        .catchError(
            (error) => print("app Failed to getHomeData: $error"));
    var data = jsonDecode(response.body);
    print("getRegistration DATA: ${data}");
    print("getRegistration DATA: ${data[0]['success_code']}");
    print("getRegistration DATA: ${data[0]['message']}");
    return data['text'];
  }

  static Future<String> verifyOtp(OtpModel model) async {
    print('${model.email}');
    print('${model.otp}');
    var APIURLRegistration =
        'https://shivamelec.com/mywebsite/myraplay/API/otp_verified.php';
    http.Response response = await http
        .post(Uri.parse(APIURLRegistration), body: model.toMap())
        .then((value) => value)
        .catchError(
            (error) => print("app Failed to verifyOtp: $error"));
    var data = jsonDecode(response.body);
    print("getRegistration DATA: ${data[0]}");
    return data[0]['success_code'];
  }
}
