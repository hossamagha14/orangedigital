import 'package:orange_black_board/view/pages/home.dart';
import 'package:orange_black_board/view/pages/login_screen.dart';
import 'package:orange_black_board/view_model/bloc/register/register_states.dart';
import 'package:orange_black_board/view_model/database/network/dio_helper.dart';
import 'package:orange_black_board/view_model/database/network/end_points.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterIntial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  bool maleIsPressed = false;
  bool femaleIsPressed = false;
  bool isPressed = true;
  String genderString = '';
  String profileName='';
  String profileEmail='';
  String profilePhoneNumber='';

  showPassword() {
    isPressed = !isPressed;
    emit(ShowPasswordState());
  }

  registerNewAccount(
    context, {
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String gender,
  }) {
    profileName=name;
    profileEmail=email;
    profilePhoneNumber=phoneNumber;
    DioHelper.postData(url: registerEndPoint, data: {
      "name": name,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "gender": gender,
    }).then((value) {
      if (value.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  LogIn()));
      }
      emit(RegisterSuccessful());
    }).catchError((onError) {
      print('THE ERROR IS GOING TO BE THE FOLLOWING: ${onError.toString()}');
      emit(RegisterFailed());
    });
  }

  maleGenderButton() {
    if (maleIsPressed == false) {
      maleIsPressed = !maleIsPressed;
      genderString = 'm';
      femaleIsPressed = false;
    }
    print('new ${maleIsPressed}');
    print('new ${femaleIsPressed}');
    print(genderString);
    emit(GenderState());
  }

  femaleGenderButton() {
    if (femaleIsPressed == false) {
      femaleIsPressed = !femaleIsPressed;
      genderString = 'f';
      maleIsPressed = false;
    }
    print('new ${maleIsPressed}');
    print('new ${femaleIsPressed}');
    print(genderString);
    emit(GenderState());
  }
}
