// ignore_for_file: avoid_print

import 'package:orange_black_board/view/pages/bottomNavBarScreens.dart';
import 'package:orange_black_board/view/pages/home.dart';
import 'package:orange_black_board/view_model/bloc/log/log_states.dart';
import 'package:orange_black_board/view_model/database/network/cache_helper.dart';
import 'package:orange_black_board/view_model/database/network/dio_helper.dart';
import 'package:orange_black_board/view_model/database/network/end_points.dart';
import 'package:orange_black_board/view_model/model/logInModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(IntialLogInState());

  static LogInCubit get(context) => BlocProvider.of(context);
  bool isPressed = true;
  LoginModel? loginModel;
  String newToken = '';

  showPassword() {
    isPressed = !isPressed;
    emit(ShowPasswordState());
  }

  logIn(context, {required String email, required String password}) {
    DioHelper.postData(
        url: loginEndPoint,
        data: {'email': email, 'password': password}).then((value) {
      if (value.statusCode == 200) {
        loginModel = LoginModel.fromJson(value.data);
        newToken = loginModel!.data!.accessToken!;
        CacheHelper.setData(key: 'token',value:loginModel!.data!.accessToken );
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavBarScreens()));
      }
      emit(SuccessfulLogInState());
    }).catchError((onError) {
      print(onError.toString());
      emit(FailureLogInState());
    });
    emit(SuccessfulLogInState());
  }
}
