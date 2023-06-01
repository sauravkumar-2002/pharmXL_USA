import 'package:pharm_xl/models/graph_value_Model.dart';

import 'address_Model.dart';
import 'disease_Model.dart';

class register_Model{
  String email="";
  String password="";
  String phone="";
  String name="";
  int height=0;
  int weight=0;
  int age=0;
 // address_Model? address_model;
  String gender="male";
  String country="";
  String state="";
  String city="";
  //List<disease_Model>curr_disease=[];
register_Model();


  //Map to object
  register_Model.fromMap(Map<String,dynamic>map){
    this.email=map["email"];
    this.password=map["password"];
    this.name=map["name"];
    this.phone=map["phone"];
    this.height=map["height"];
    this.weight=map["weight"];
    this.age=map["age"];
    this.gender=map["gender"];
    this.country=map["country"];
    this.state=map["state"];
    this.city=map["city"];
   // this.address_model=address_Model.fromMap(map["address_model"]);
    //this.curr_disease=map["curr_disease"];


  }
  //object to map
  Map<String,dynamic> toMap(){

    return{
      "email":this.email,
      "password":this.password,
      "phone":this.phone,
      "name":this.name,
      "height":this.height,
      "weight":this.weight,
      "age":this.age,
      "gender":this.gender,
      "country":this.country,
      "state":this.state,
      "city":this.city,
    };

  }



}

