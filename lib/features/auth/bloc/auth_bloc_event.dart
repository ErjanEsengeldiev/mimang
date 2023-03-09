part of 'auth_bloc_bloc.dart';

@immutable
abstract class AuthBlocEvent {}

class SignInEvent extends AuthBlocEvent {
  final String email;

  SignInEvent({required this.email});
}
