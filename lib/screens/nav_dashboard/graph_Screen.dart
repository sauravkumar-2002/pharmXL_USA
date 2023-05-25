import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pharm_xl/screens/auth/register_Details_Height_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Country_Dob.dart';



var currentAgeValue = 3;

class graphsScreen extends StatefulWidget {


  @override
  State<graphsScreen> createState() => _graphsScreenState();
}

class _graphsScreenState extends State<graphsScreen> {
//blue --313586
//orange-- DE6739

  var myopacity = 0.0;















  @override
  void initState() {
    Timer(Duration(milliseconds: 450), () {
      setState(() {
        myopacity = 1.0;





      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final List<FlSpot> dummyData1 = List.generate(8, (index) {
      return FlSpot(index.toDouble(),  index * Random().nextDouble());
    });
    final List<FlSpot> dummyData2 = List.generate(15, (index) {
      return FlSpot(index.toDouble(), index * Random().nextDouble());
    });
    final List<FlSpot> dummyData3 = List.generate(8, (index) {
      return FlSpot(index.toDouble(), index * Random().nextDouble());
    });


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
                      child: Image.asset(
                        'assets/images/logo.png', width: 150, height: 150,)),
                ),
                Text("Graphs"),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 600,
                      height: 300, // Adjust the height as needed
                      child: Stack(
                        children: [
                          LineChart(
                            LineChartData(
                              borderData: FlBorderData(show: false),
                              lineBarsData: [
                                // The red line
                                LineChartBarData(
                                  spots: dummyData1,
                                  isCurved: true,
                                  barWidth: 3,
                                  color: Colors.red,
                                ),
                                // The orange line
                                LineChartBarData(
                                  spots: dummyData2,
                                  isCurved: true,
                                  barWidth: 3,
                                  color: Colors.orange,
                                ),
                                // The blue line
                                LineChartBarData(
                                  spots: dummyData3,
                                  isCurved: false,
                                  barWidth: 3,
                                  color: Colors.blue,
                                )
                              ],
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }


}





//Height picker

