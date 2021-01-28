import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi/layout/home_layout.dart';
import 'package:softagi/models/user_model.dart';
import 'package:softagi/modules/authentication/cubit/states.dart';
import 'package:softagi/shared/components/constants.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates> {
  AuthenticationCubit() : super(AuthenticationStateInitial());

  static AuthenticationCubit get(context) => BlocProvider.of(context);

  String verCode = '';
  String phoneNumber = '';
  bool isCodeSent = false;

  void sendCode({String number}) async
  {
    emit(AuthenticationStateLoading());

    phoneNumber = number;

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$number',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        emit(AuthenticationStateError(error: e.message));
      },
      codeSent: (String verificationId, int resendToken) {
        emit(AuthenticationStateSuccess());
        isCodeSent = true;
        verCode = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void phoneAuthentication({String code, BuildContext context}) async {
    emit(AuthenticationStateLoading());

    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: this.verCode, smsCode: code);

    await FirebaseAuth.instance
        .signInWithCredential(phoneAuthCredential)
        .then((value) {
      createUser(
        id: value.user.uid,
        context: context,
      );

      print(value.user.uid);
      emit(AuthenticationStateSuccess());
    }).catchError((e) {
      emit(AuthenticationStateError(error: e.toString()));
    });
  }

  void createUser({String id, BuildContext context}) async
  {
    var userModel = UserModel(
      id: id,
      image: '',
      completed: false,
      verified: false,
      name: '',
      phone: this.phoneNumber,
    );

    await FirebaseFirestore.instance.collection('users').doc(id).set(userModel.toMap()).then((value)
    {
      emit(AuthenticationStateSuccess());

      navigateAndFinish(
        context,
        HomeLayout(),
      );
    }).catchError((e)
    {
      emit(AuthenticationStateError(error: e.toString()));
    });
  }
}
