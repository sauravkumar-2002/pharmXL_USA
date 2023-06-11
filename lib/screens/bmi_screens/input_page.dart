import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:pharm_xl/screens/bmi_screens/result_page.dart';
import 'calculator_brain.dart';
import 'components/bottom_button.dart';
import 'components/card_child.dart';
import 'components/reusable_card.dart';
import 'components/round_icon_button.dart';
import 'constants.dart';
var myopacity=0.0;

enum _Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

   _Gender _selectedGender=_Gender.Male;

  int height = 180;
  double minHeight = 120;
  double maxHeight = 220;

  int weight = 60;
  int age = 28;

   @override
   void initState() {
     Timer(Duration(milliseconds: 950),(){
       setState(() {
         myopacity=1.0;
       });
     });
     super.initState();



   }


  @override
  Widget build(BuildContext context) {
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
                children:[
                  Center(
                    child: Hero(
                        tag: "logo",
                        child: Image.asset('assets/images/logo.png',width: 150,height: 150,)),
                  ),

                  Container(
                    child: GenderPickerWithImage(

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
                      size: 50, onChanged: (Gender? value) {
                        if(value==Gender.Female)_selectedGender=_Gender.Female;
                    },
                    ),

                  ),



                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: ReusableCard(
                      color: Colors.black12,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          SizedBox(height: 10,),
                          Text(
                            'HEIGHT',
                            style:TextStyle(fontSize: 22,color: Color(0Xff313586),fontWeight: FontWeight.bold,fontFamily: 'logofont'),
                          ),
                          SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style:TextStyle(fontSize: 22,color: Color(0XffDE6739),fontWeight: FontWeight.bold,fontFamily: 'logofont'),
                              ),
                              Text(
                                'cm',
                                style:TextStyle(fontSize: 12,color: Color(0XffDE6739),fontWeight: FontWeight.bold,fontFamily: 'logofont'),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Color(0xFFE5A798),
                              inactiveTrackColor: Color(0xFF8D8E98),
                              thumbColor: Color(0xFFDE6739),
                              overlayColor: Color(0xFFE5A798),
                              thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10.0),
                              overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20.0),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: minHeight,
                              max: maxHeight,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ), onPress: () {  },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        ReusableCard(
                          color: Colors.black12,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 10),
                              Text(
                                'WEIGHT',
    style:TextStyle(fontSize: 22,color: Color(0Xff313586),fontWeight: FontWeight.bold,fontFamily: 'logofont'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      weight.toString(),
    style:TextStyle(fontSize: 22,color: Color(0XffDE6739),fontWeight: FontWeight.bold,fontFamily: 'logofont'),
                                    ),
                                    Text(
                                      'kg',
                                      style:TextStyle(fontSize: 12,color: Color(0XffDE6739),fontWeight: FontWeight.bold,fontFamily: 'logofont'),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: 7,),
                                  RoundIconButton(
                                    icon: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10.0),
                                  RoundIconButton(
                                    icon: Icons.add,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 7,),
                                ],
                              ),
                              SizedBox(height: 10,),
                            ],
                          ), onPress: () {  },
                        ),
                        Container(
                          child: ReusableCard(
                            color: Colors.black12,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 10),
                                Text(
                                  'AGE',
                                  style:TextStyle(fontSize: 22,color: Color(0Xff313586),fontWeight: FontWeight.bold,fontFamily: 'logofont'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        age.toString(),
    style:TextStyle(fontSize: 22,color: Color(0XffDE6739),fontWeight: FontWeight.bold,fontFamily: 'logofont'),
                                      ),
                                      Text(
                                        'yrs',
                                        style:TextStyle(fontSize: 12,color: Color(0XffDE6739),fontWeight: FontWeight.bold,fontFamily: 'logofont'),
                                      ),
                                    ],
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: 7,),
                                    RoundIconButton(
                                      icon: Icons.remove,
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                    ),
                                    SizedBox(width: 10.0),
                                    RoundIconButton(
                                      icon: Icons.add,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                    ),
                                    SizedBox(width: 7,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                              ],
                            ), onPress: () {  },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: OutlinedButton(
                      onPressed: () {
                        CalculatorBrain calc =
                        CalculatorBrain(height: height, weight: weight);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  bmiResult: calc.calculateBMI(),
                                  resultText: calc.getResult(),
                                  interpretation: calc.getInterpretation(),
                                )));
                      },
                      style: OutlinedButton.styleFrom( //<-- SEE HERE
                          side: BorderSide(width: 1.4),

                          backgroundColor: Color(0xffF8EBEBFF)
                      ),


                      child: Text(' Calculate BMI',
                        style:TextStyle(fontSize: 17,color: Color(0Xff313586),fontWeight: FontWeight.bold),
                      ),
                      //Icon(Icons.arrow_forward_sharp,color: Color(0Xff313586),),


                    ),
                  ),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}