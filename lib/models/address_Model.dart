class address_Model{
  String country="";
  String state="";
  String city="";

  address_Model.fromMap(Map<String,dynamic>map){
    this.country=map["country"];
    this.state=map["state"];
    this.city=map["city"];
  }
  //object to map
  Map<String,dynamic> toMap(){

    return{
      "country":this.country,
      "state":this.state,
      "city":this.city,

    };

  }
}