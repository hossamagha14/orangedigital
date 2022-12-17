import 'package:orange_black_board/view_model/bloc/settings/settings_states.dart';
import 'package:orange_black_board/view_model/database/network/dio_helper.dart';
import 'package:orange_black_board/view_model/database/network/end_points.dart';
import 'package:orange_black_board/view_model/model/faqModel.dart';
import 'package:orange_black_board/view_model/model/termsModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsStates>{
  SettingsCubit():super(SettingsIntialState());

  static SettingsCubit get(context)=>BlocProvider.of(context);
  FAQModel? faqModel;
  TermsModel? termsModel;

  getFaq(){
    DioHelper.getData(url:faqEndPoint,token: token ).then((value) {
      faqModel=FAQModel.fromJson(value.data);
      emit(SettingsFaqState());
    }).catchError((onError){
      print(onError.toString());
      emit(SettingsFaqState());
    });
  }

  getTerms(){
    DioHelper.getData(url: termsEndPoint,token: token).then((value){
      termsModel=TermsModel.fromJson(value.data);
      emit(SettingsTermsState());
    }).catchError((onError){
      emit(SettingsTermsState());
      print(onError.toString());
    });
  }
}