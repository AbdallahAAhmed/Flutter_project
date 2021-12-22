abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final int status;
  final String token;

  LoginSuccessState({this.status, this.token});
  
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class LoginPasswordVisibilityState extends LoginStates {}


class SearchLoadingState extends LoginStates {}

class SearchSuccessState extends LoginStates {}

class SearchErrorState extends LoginStates {}

