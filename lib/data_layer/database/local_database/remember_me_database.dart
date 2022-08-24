
import 'package:lavie/presentation_layer/shared/constant/constant.dart';

bool isRememberMe =false;


void insertBoxToDataBase({
  required String email,
  required String password,
  required bool isRemember,
}){
  database!.put("isRemember",isRemember);
  database!.put("email",email);
  database!.put("password", password);

}
