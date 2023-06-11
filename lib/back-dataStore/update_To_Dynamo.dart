import 'package:amplify_core/amplify_core.dart';

import '../models/register_Model.dart';

void updatetoDynamodb(register_Model register_model) async{

  try{
    final obj=await readby_email(register_model.email!);
    print("sexy obj email update");
    obj?[0]=register_model;
    await Amplify.DataStore.save(obj?[0] as register_Model);
    print(obj?[0]);

  }
  catch(e){
    print(e);
  }

}


Future<List<register_Model>?> readby_email(String email) async{
  try{
    final obj=await Amplify.DataStore.query(register_Model.classType,where: register_Model.EMAIL.eq(email));
    print("sexy obj email");
    print(obj[0]);
    if(obj.isEmpty){
      //no obj exists
      return null;

    }
    return obj;
  }
  catch(e){
    print(e);
    throw e;
  }
}