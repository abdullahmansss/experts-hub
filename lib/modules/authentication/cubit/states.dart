abstract class AuthenticationStates {}

class AuthenticationStateInitial extends AuthenticationStates{}

class AuthenticationStateLoading extends AuthenticationStates{}

class AuthenticationStateSuccess extends AuthenticationStates{}

class AuthenticationStateError extends AuthenticationStates
{
  final String error;

  AuthenticationStateError({this.error});
}