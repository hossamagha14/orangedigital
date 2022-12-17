import 'package:orange_black_board/view/reusable/mycard.dart';
import 'package:orange_black_board/view_model/bloc/Exam/exam_cubit.dart';
import 'package:orange_black_board/view_model/bloc/Exam/exam_state.dart';
import 'package:orange_black_board/view_model/bloc/home/home_cubit.dart';
import 'package:orange_black_board/view_model/bloc/home/home_states.dart';
import 'package:orange_black_board/view_model/model/examModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MidExams extends StatelessWidget {
  const MidExams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamsCubit()..getExams(context),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.deepOrange),
          backgroundColor: Colors.white,
          title: const Text(
            'Mid-Term Exam',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: BlocConsumer<ExamsCubit, ExamsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ExamsCubit myCubit = ExamsCubit.get(context);
            return state is! ExamsLoadingState
                ? myCubit.examModel!.message == "No Exams Found"
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(40),
                          child: Text(
                            'Wait for our upcoming events ...',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                            itemCount: myCubit.midTermExamList.length,
                            itemBuilder: (context, index) => MyCard(
                                subject: myCubit
                                    .examModel!.data![index].examSubject
                                    .toString(),
                                lectureDate: myCubit
                                    .examModel!.data![index].examDate
                                    .toString(),
                                startTime: myCubit
                                    .examModel!.data![index].examStartTime
                                    .toString(),
                                endTime: myCubit
                                    .examModel!.data![index].examEndTime
                                    .toString())),
                      )
                : const Center(
                    child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                  ));
          },
        )),
      ),
    );
  }
}
