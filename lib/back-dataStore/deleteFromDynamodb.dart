import 'package:amplify_core/amplify_core.dart';
import '../models/register_Model.dart';

void deleteall() async {
  try{
    await Amplify.DataStore.clear();
    print("sexy obj deletre");
   // print(obj);
  }
  catch(e){
    print("resad all error - $e");
  }

}