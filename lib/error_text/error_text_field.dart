
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';

import '../screens/auth/signUp_Screen.dart';

String?  errorText(TextEditingController _controller,String type ) {
  // at any time, we can get the text from _controller.value.text
  final text = _controller.value.text;
  if(type=="email"){
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    else if(!EmailValidator.validate(text)){
      return "Not a Valid Email";
    }
    return null;
  }
  if(type=="name"){
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    else if(text.length<2){
      return "Minimum of 2 Characters";
    }
    return null;
  }
  if(type=="password"){
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    else if(text.length<10){
      return "Minimum of 10 Characters";
    }
    return null;
  }
  if(type=="conf_password"){
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    else if(text!=confirmpasswordText.text){
      return "Does\'t matches with Password";
    }
    return null;
  }
  if(type=="email_exist"){
    return "Email Already Exists";
  }

  // return null if the text is valid
  return null;
}


