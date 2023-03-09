part of 'auth_bloc_bloc.dart';

@immutable
abstract class AuthBlocState {}

class AuthBlocInitial extends AuthBlocState {}

class LoadingState extends AuthBlocState {}

class SignInState extends AuthBlocState {}
