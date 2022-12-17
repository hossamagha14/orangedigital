import 'package:orange_black_board/view/reusable/mycard.dart';
import 'package:orange_black_board/view_model/bloc/home/home_cubit.dart';
import 'package:orange_black_board/view_model/bloc/home/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sections extends StatelessWidget {
  const Sections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSections(context),
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.deepOrange),
            title: const Text(
              'Sections',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            actions: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Icon(
                  Icons.share,
                  color: Colors.deepOrange,
                ),
              )
            ],
          ),
          body: SafeArea(
              child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              HomeCubit myCubit = HomeCubit.get(context);
              return myCubit.sectionModel == null
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.deepOrange,
                    ))
                  : Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: myCubit.sectionModel!.data!.length,
                        itemBuilder: (context, index) => MyCard(
                            subject: myCubit
                                .sectionModel!.data![index].sectionSubject
                                .toString(),
                            lectureDate: myCubit
                                .sectionModel!.data![index].sectionDate
                                .toString(),
                            startTime: myCubit
                                .sectionModel!.data![index].sectionStartTime
                                .toString(),
                            endTime: myCubit
                                .sectionModel!.data![index].sectionEndTime
                                .toString()),
                      ),
                    );
            },
          ))),
    );
  }
}
