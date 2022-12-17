import 'package:orange_black_board/view_model/bloc/Exam/exam_state.dart';
import 'package:orange_black_board/view_model/database/network/dio_helper.dart';
import 'package:orange_black_board/view_model/database/network/end_points.dart';
import 'package:orange_black_board/view_model/model/examModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsCubit extends Cubit<ExamsStates> {
  ExamsCubit() : super(ExamsIntialState());

  static ExamsCubit get(context) => BlocProvider.of(context);
  ExamModel? examModel;
  List<Data> finalExamList = [];
  List<Data> midTermExamList = [];

  getExams(context) {
    emit(ExamsLoadingState());
    DioHelper.getData(url: examsEndPoint, token: token).then((value) {
      if (value.statusCode == 200) {
        examModel = ExamModel.fromJson(value.data);
        if(examModel!.message=="No Exams Found"){
          print(examModel!.message);
        }
        else{for (var element in examModel!.data!) {
          if (element.finalExam == true) {
            finalExamList.add(element);
            emit(FinalExamState());
          } else if (element.finalExam == false) {
            midTermExamList.add(element);
            emit(MidTermExamState());
          }
        }}
      }
      emit(FinalExamState());
    });
  }
}
