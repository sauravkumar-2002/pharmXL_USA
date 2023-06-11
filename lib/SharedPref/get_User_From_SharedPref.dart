import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../screens/auth/register_Details_Age.dart';
import '../models/register_Model.dart';

Future<register_Model> getUserInfo()  async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  Map<String, dynamic> register_model_map = {};
  final String? register_model_json = prefs.getString('register_model_shared_pref');
  print(register_model_json);
  if (register_model_json != null) {
    register_model_map = jsonDecode(register_model_json) as Map<String, dynamic>;
  }

  var register_model = register_Model.fromJson(register_model_map);
  print(register_model);
  return register_model;

}