import 'package:lavie/presentation_layer/models/register_user_model.dart';

abstract class AuthenticationStates {}

class AuthenticationInitialState extends AuthenticationStates {}

class LogInPasswordSecurityState extends AuthenticationStates {}

class SignUpPasswordSecurityState extends AuthenticationStates {}

class AuthenticationLoadingState extends AuthenticationStates {}
class ToggleIsRememberMeBoxState extends AuthenticationStates {}

class AuthenticationSuccessState extends AuthenticationStates {
 UserDataModel? userDataModel;
  AuthenticationSuccessState(this.userDataModel);
}

class AuthenticationErrorState extends AuthenticationStates {
  final String error;
  AuthenticationErrorState(this.error);
}

