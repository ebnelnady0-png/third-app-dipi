part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

final class AuthInitial extends AuthState {}

/////register
class RegisterLoading extends AuthState{}
class RegisterSuccess extends AuthState{}
class RegisterFailure extends AuthState{
  final String msg;
  RegisterFailure(this.msg);
}