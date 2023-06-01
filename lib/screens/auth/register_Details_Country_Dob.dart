import 'dart:async';
import 'dart:convert';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharm_xl/screens/auth/register_Details_Age.dart';
import 'package:pharm_xl/screens/auth/register_Details_Height_Screen.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';

import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/register_Model.dart';

var dob_string="DD/MM/YYYY";
register_Model register_model=register_Model();
class registerDetailsCountryDob extends StatefulWidget{





  @override
  _registerDetailsCountryDobState createState() => _registerDetailsCountryDobState();
}

class _registerDetailsCountryDobState extends State<registerDetailsCountryDob> {
  var myopacity=0.0;

  var  dob_ed_text=TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? datepicked=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1910), lastDate: DateTime.now());
    print("check the fliter");
    if(datepicked!=null) {
      print("date-- "+datepicked.toString());
      setState(() {
        dob_string = datepicked.day.toString() + '/'
            + datepicked.month.toString() + '/'
            + datepicked.year.toString();
      });
    }
  }




  @override
  void initState() {
    Timer(Duration(milliseconds: 550),(){
      setState(() {
        myopacity=1.0;
      });
    });
    super.initState();
    getUserInfo();

  }







  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Padding(
        padding: const EdgeInsets.all(10.0),
    child: SingleChildScrollView(
    child: AnimatedOpacity(
    opacity: myopacity,
    duration: Duration(seconds: 1),
    child: Container(


    child: Column(

    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Center(
    child: Hero(
    tag: "logo",
    child: Image.asset('assets/images/logo.png',width: 150,height: 150,)),
    ),
      Divider(color: Colors.grey, height: 32),
      SizedBox(height: 5),
      Text("Where Do You Live?",style:TextStyle(fontSize: 15,color: Color(0Xff313586),fontWeight: FontWeight.w600,fontFamily: 'logofont')),
      SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.only(left: 12.0,right: 12.0),

        child: Container(
            child: cscPicker()
        ),
      ),


      SizedBox(height: 8),
      Divider(color: Colors.grey, height: 32,),
      SizedBox(height: 5),
      Text("Select Your Gender",style:TextStyle(fontSize: 15,color: Color(0Xff313586),fontWeight: FontWeight.w600,fontFamily: 'logofont')),
      SizedBox(height: 10),
      Container(
       child: GenderPickerWithImage(
         onChanged: (Gender? value) {

        print(value);

        register_model.gender=value.toString().substring(7);

         },
         verticalAlignedText: false,
         showOtherGender: true,
         selectedGender: Gender.Male,
         selectedGenderTextStyle: TextStyle(
             color: Color(0xFF313586), fontWeight: FontWeight.bold),
         unSelectedGenderTextStyle: TextStyle(
             color: Colors.black, fontWeight: FontWeight.normal),
         equallyAligned: true,
         animationDuration: Duration(milliseconds: 300),
         opacityOfGradient: 0.4,
         size: 50,
       ),

      ),
      SizedBox(height: 7,),
      Divider(color: Colors.grey, height: 32,),
      SizedBox(height: 26),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              storeToSharedPref();
              gotoRegisterDetailsAgeScreen();
            },
            child:Text('Next',style: TextStyle(fontSize: 24,color: Color(0xff313586),fontWeight: FontWeight.w700),),
          ),
          Icon(Icons.navigate_next,color: Color(0xff313586),size: 24),


        ],
      ),

      SizedBox(height: 16),

      InkWell(
          onTap: (){

            gotoRegisterDetailsAgeScreen();
          },
          child: Text('Skip For Now',style: TextStyle(fontSize: 20,color: Colors.grey,),)
      ),

      
    ]
    )
    )
    )
    )
    )
    );
  }

  void gotoRegisterDetailsAgeScreen() {

    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (_, __, ___) => registerDetailsAge()));
  }

  Future<void> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> register_model_map = {};
    final String? register_model_json = prefs.getString('register_model_shared_pref');
    print(register_model_json);
    if (register_model_json != null) {
      register_model_map = jsonDecode(register_model_json) as Map<String, dynamic>;
    }

    register_model = register_Model.fromMap(register_model_map);
    print(register_model);

  }

  Future<void> storeToSharedPref() async {

    Map<String,dynamic>register_model_map=register_model.toMap();
    String register_model_json=jsonEncode(register_model_map);
    //print("register_model_json");
    print(register_model_json);
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("register_model_shared_pref", register_model_json);

  }


}

CSCPicker cscPicker(){
  return CSCPicker(

    layout: Layout.vertical,
    onCountryChanged: (Country){
      if(Country!=null) {
        register_model.country=Country;
      }
    },
    onStateChanged: (State){
      if(State!=null) {
        register_model.state=State;
      }
    },
    onCityChanged: (City){
      if(City!=null) {
        register_model.city=City;
      }
    },

    countryDropdownLabel: "Select Your Country",
    stateDropdownLabel: "Select Your State",
    cityDropdownLabel: "Select Your City",

    dropdownDialogRadius: 0,
    searchBarRadius: 0,

    dropdownHeadingStyle: TextStyle(fontSize: 15,color: Color(0Xff313586),fontWeight: FontWeight.w600,fontFamily: 'logofont'),
    dropdownItemStyle: TextStyle(fontSize: 12.5,color: Color(0Xff313586),fontWeight: FontWeight.w600,fontFamily: 'logofont'),
    dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        color: Colors.white,
        border:
        Border.all(color: Color(0xff313586),width: 2,)
    ),

    ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
    disabledDropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        color: Colors.grey.shade300,
        border:
        Border.all(color: Colors.black,width: 1,)
    ),
  );



}