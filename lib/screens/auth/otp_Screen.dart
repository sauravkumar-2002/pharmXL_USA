import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharm_xl/screens/auth/otp_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Height_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Country_Dob.dart';





class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _pin="";
  var myopacity=0.0;






  @override
  void initState() {
    Timer(Duration(milliseconds: 240),(){
      setState(() {
        myopacity=1.0;
      });
    });
    super.initState();


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: AnimatedOpacity(
            opacity: myopacity,
            duration: Duration(seconds: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Center(
                  child: Hero(
                      tag: "logo",
                      child: Image.asset('assets/images/logo.png',width: 150,height: 150,)),
                ),
                Text(
                  '   Enter the 6-digit Pin\nSent to your Phone No.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                PinInputField(
                  pinLength: 6,
                  onChanged: (value) {
                    setState(() {
                      _pin = value;
                    });
                  },
                ),

                SizedBox(height: 20),
                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 195),

                      InkWell(
                        onTap: (){

                        },
                        child: Text(
                          "Resend OTP?",

                          style:TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 12,color: Colors.black,fontWeight: FontWeight.w800,),textAlign: TextAlign.right),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: OutlinedButton(
                    onPressed: () {
                    sendtoRegisterDetailsScreen();

                    },
                    style: OutlinedButton.styleFrom( //<-- SEE HERE
                        side: BorderSide(width: 1.4),

                        backgroundColor: Color(0xffF8EBEBFF)
                    ),


                    child: Text(' Verify ',
                      style:TextStyle(fontSize: 17,color: Color(0Xff313586),fontWeight: FontWeight.bold),
                    ),
                    //Icon(Icons.arrow_forward_sharp,color: Color(0Xff313586),),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 52.0),
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0Xff313586),
                    color: Color(0xffDE6739),

                    strokeWidth: 6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendtoRegisterDetailsScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => registerDetailsCountryDob()));
  }
}
















class PinInputField extends StatefulWidget {
  final int pinLength;
  final ValueChanged<String> onChanged;

  PinInputField({required this.pinLength, required this.onChanged});

  @override
  _PinInputFieldState createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  List<FocusNode> _focusNodes = [];
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.pinLength; i++) {
      _focusNodes.add(FocusNode());
      _controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.pinLength, (index) {
        return Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 4),
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,

            cursorColor: Color(0xff313586),

            focusNode: _focusNodes[index],
            controller: _controllers[index],
            onChanged: (value) {
              _onTextChanged(value, index);
            },
            decoration: inputDecoration_otp(),
          ),
        );
      }),
    );
  }

  void _onTextChanged(String value, int index) {
    if (value.length == 1) {
      if (index < widget.pinLength - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        // all boxes filled
        String otp = '';
        for (int i = 0; i < widget.pinLength; i++) {
          otp += _controllers[i].text;
        }

      }
    }
  }
}

InputDecoration inputDecoration_otp(){
  return InputDecoration(

    counterText: '',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
    ),

    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(
          color: Color(0xff313586),
          width: 2,
        )
    ),
    contentPadding: EdgeInsets.all(1),
  );
}