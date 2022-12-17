// ignore_for_file: avoid_print

import 'package:orange_black_board/view/pages/home.dart';
import 'package:orange_black_board/view/pages/lectures.dart';
import 'package:orange_black_board/view/pages/news.dart';
import 'package:orange_black_board/view/pages/settings.dart';
import 'package:orange_black_board/view/pages/support.dart';
import 'package:orange_black_board/view_model/bloc/home/home_states.dart';
import 'package:orange_black_board/view_model/database/network/dio_helper.dart';
import 'package:orange_black_board/view_model/database/network/end_points.dart';
import 'package:orange_black_board/view_model/model/examModel.dart';
import 'package:orange_black_board/view_model/model/lecturModel.dart';
import 'package:orange_black_board/view_model/model/newModel.dart';
import 'package:orange_black_board/view_model/model/sectionModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeIntialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  LectureModel? lectureModel;
  SectionModel? sectionModel;
  NewsModel? newsModel;
  int currentIndex = 0;
  List<Widget> bottomNavBarScreens = const [
    HomePage(),
    NewsScreen(),
    Settings(),
    
  ];

  getLectures(context) {
    DioHelper.getData(url: lectureEndPoint, token: token).then((value) {
      lectureModel = LectureModel.fromJson(value.data);
      print(lectureModel!.data![0].lectureSubject!.toString());
      emit(HomeLectureState());
    });
  }

  getSections(context) {
    DioHelper.getData(url: sectionEndPoint, token: token).then((value) {
      sectionModel = SectionModel.fromJson(value.data);
      print(sectionModel!.data![0].sectionSubject!.toString());
      emit(HomeLectureState());
    });
  }

  changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  getAllNews() {
    DioHelper.getData(url: newsEndPoint, token: token).then((value) {
      newsModel = NewsModel.fromJson(value.data);
      emit(NewsState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsState());
    });
  }
}
