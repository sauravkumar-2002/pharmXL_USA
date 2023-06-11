import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pharm_xl/screens/Dashboard_Screen.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:pharm_xl/screens/auth/register_Details_Weight_Screen.dart';

List<String> selected_disease = [];
List<String> total_disease = ['a','b','c','d'];
List<int>toggleValue_tratment=[];
//bool toggleValue_tratment=false;










class registerDetailsDisease extends StatefulWidget{






  @override
  State<registerDetailsDisease> createState() => _registerDetailsDiseaseState();
}

class _registerDetailsDiseaseState extends State<registerDetailsDisease> {
//blue --313586
//orange-- DE6739

  var myopacity=0.0;

  List<Item>_data=generateItems(selected_disease.length, selected_disease);










  @override
  void initState() {
    Timer(Duration(milliseconds: 450),(){
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
                children: [
                  Center(
                    child: Hero(
                        tag: "logo",
                        child: Image.asset('assets/images/logo.png',width: 150,height: 150,)),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 3,bottom: 8),
                    child: Center(
                      child: Text(
                        "Are You Suffering From any Medical condition?",
                        textAlign: TextAlign.center,
                        style:TextStyle(fontSize: 22,color: Color(0Xff313586),fontWeight: FontWeight.bold,),
                  ),
                    ),
                  ),




                  Divider(color: Colors.grey, height: 32),
                  SizedBox(height: 16),



/*
                  MultiSelectDialogField(
                    title: Text("Select Disease"),
                      items: total_disease.map((e) => MultiSelectItem(e, e)).toList(),
                      initialValue: selected_disease,
                    searchable: true,
                    searchHint: "Search Here",
                    buttonText: Text("Select Your Related Disease"),
                    buttonIcon:Icon(Icons.arrow_drop_down),
                    onConfirm: (x ) {
                      setState(() {
                        selected_disease =x.cast();
                        _data=generateItems(selected_disease.length, selected_disease);
                        print(_data);
                        print(selected_disease);
                      });
                  },


                      ),
*/
                  InkWell(
                        onTap: () async {
                      final selectedValues = await showDialog(
                      context: context,
                         builder: (BuildContext context) {
                           return MultiSelectDialog(
                             searchable: true,
                             searchHint: "Search Here",
                             items: total_disease.map((e) => MultiSelectItem(e, e)).toList(),
                             initialValue: selected_disease,
                             onConfirm: (x ) {
                               setState(() {
                                 selected_disease =x.cast();
                                 _data=generateItems(selected_disease.length, selected_disease);
                                 print(_data);
                                 print(selected_disease);
                                 for(int i=0;i<selected_disease.length;i++)toggleValue_tratment.insert(i, 0);
                               });
                             },
                                  );
                               },
                        );

                        },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                              child: Align(
                                alignment:Alignment.centerLeft,
                                  child: Text("Select Your Related Disease"))),
                          Align(
                              alignment:Alignment.centerRight,
                              child: Icon(Icons.arrow_drop_down))
                        ],
                      ),
                    ),
                   
                  ),
                  SizedBox(height: 16),
                  _buildList(),
                  Divider(color: Colors.grey, height: 32),
                  SizedBox(height: 16),





                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          gotoDashboardScreen();
                        },
                        child:Text('Next',style: TextStyle(fontSize: 24,color: Color(0xff313586),fontWeight: FontWeight.w700),),
                      ),
                      Icon(Icons.navigate_next,color: Color(0xff313586),size: 24),


                    ],
                  ),

                  SizedBox(height: 16),

                  InkWell(
                      onTap: (){
                        gotoDashboardScreen();
                      },
                      child: Text('Skip For Now',style: TextStyle(fontSize: 20,color: Colors.grey,),)
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Icon(Icons.navigate_before,color: Colors.grey,size: 24),
                      InkWell(
                        onTap: (){
                          gotoRegisterDetailsWeightScreen();
                        },
                        child:Text('Back',style: TextStyle(fontSize: 20,color: Colors.grey),),
                      ),



                    ],
                  ),








                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void gotoRegisterDetailsWeightScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (_, __, ___) => registerDetailsWeight()));
  }

  void gotoDashboardScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (_, __, ___) => dashboardScreen()));
  }




  Widget _buildList() {
   return ExpansionPanelList(
     expansionCallback: (int index,bool isExpanded){
       setState(() {
         _data[index].isExpanded=!isExpanded;
       });
     },
     children:_data.map<ExpansionPanel>((Item item){
       return ExpansionPanel(
           headerBuilder:(BuildContext context,bool isExpanded){
             return ListTile(
               title: Text(item.headerValue),
             );
           },
       body: _body_for_expanded_list_view(item),
         isExpanded: item.isExpanded
       );
     }).toList(),
   );
  }



  Widget _body_for_expanded_list_view(Item item){
    return Container(
     padding: EdgeInsets.all(12.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                       Text('On Going Treatment : '),

                     Switch(
                      value: toggleValue_tratment[item.index]==0?false:true,
                      onChanged: (value) {
                        setState(() {

                          toggleValue_tratment[item.index]=value?1:0;
                        });
                      },

                  ),


              ],
            ),

            TextField(
              //controller: textFieldController,
              decoration: InputDecoration(
                hintText: 'Enter Drugs Name ',
              ),
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                  onTap: (){
                    setState(() {
                      _data.removeWhere((currentItem) => item==currentItem);
                      selected_disease.removeAt(item.index);
                      print(selected_disease);
                    });
                  },
                  child: Icon(Icons.delete_forever)),

            )

          ]
      ),
    );
  }





}


class Item{
  String expandedValue;
  String headerValue;
  bool isExpanded;
  int index;

  Item({required this.expandedValue,required this.headerValue,this.isExpanded=false,required this.index});

}

List<Item> generateItems(int numberofItems,List<String>selected_disease){
  return List.generate(numberofItems, (index) {
    return Item(expandedValue: "Di desc", headerValue:selected_disease[index],index: index);
  });
}













//Height picker

