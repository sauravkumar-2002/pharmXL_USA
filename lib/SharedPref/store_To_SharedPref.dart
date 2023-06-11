import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/register_Model.dart';

Future<void> storeToSharedPref(register_Model register_model) async {

  Map<String,dynamic>register_model_map=register_model.toMap();
  String register_model_json=jsonEncode(register_model_map);
  //print("register_model_json");
  print(register_model_json);
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setString("register_model_shared_pref", register_model_json);

}