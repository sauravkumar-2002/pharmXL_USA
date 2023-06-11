import 'package:amplify_core/amplify_core.dart';
import '../models/register_Model.dart';

void readall() async {
  try{
    final obj=await Amplify.DataStore.query(register_Model.classType);
    print("sexy obj");
    print(obj);
  }
  catch(e){
    print("resad all error - $e");
  }

}
