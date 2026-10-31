import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final fireAuth =FirebaseAuth.instance;

  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();

  Future<void>signUp() async{

  emit(RegisterLoading());
    try {
      
      await fireAuth.createUserWithEmailAndPassword(
        email:emailRegisterController.text ,
        password:passwordRegisterController.text ,

      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      emit(RegisterFailure('The password provided is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure('The account already exists for that email'));
      }
    } catch (e) {
   emit(RegisterFailure(e.toString()));
    }
  }


}
