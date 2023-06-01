import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLoaderDialog(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(
          backgroundColor: Color(0Xff313586),
          color: Color(0xffDE6739),

          strokeWidth: 5,
        ),
        Container(margin: EdgeInsets.only(left: 7),child:Text(" Please Wait..." )),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}