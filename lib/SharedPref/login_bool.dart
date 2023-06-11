import 'package:shared_preferences/shared_preferences.dart';

Future<void> bool_login_sharedPref(bool check) async {

  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setBool("_isLogedIn", check);

}

Future<bool?> bool_check_login_sharedPref() async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  return sharedPreferences.getBool("_isLogedIn");
}