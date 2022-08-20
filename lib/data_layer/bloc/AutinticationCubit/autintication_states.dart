import 'package:lavie/presentation_layer/models/user_model.dart';

abstract class AuthonticationStates {}

class AuthonticationInitialState extends AuthonticationStates {}

class LogInPasswordSecurityState extends AuthonticationStates {}

class SignUpPasswordSecurityState extends AuthonticationStates {}

class AuthonticationLoadingState extends AuthonticationStates {}

class AuthonticationSuccessState extends AuthonticationStates {
 UserDataModel? userDataModel;
  AuthonticationSuccessState(this.userDataModel);
}

class AuthonticationErrorState extends AuthonticationStates {
  final String error;
  AuthonticationErrorState(this.error);
}

