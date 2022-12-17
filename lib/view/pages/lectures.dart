import 'package:orange_black_board/view/reusable/mycard.dart';
import 'package:orange_black_board/view_model/bloc/home/home_cubit.dart';
import 'package:orange_black_board/view_model/bloc/home/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Lectures extends StatelessWidget {
  const Lectures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getLectures(context),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit myCubit = HomeCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.deepOrange),
              title: const Text(
                'Lectures',
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
            body: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: myCubit.lectureModel == null
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Colors.deepOrange,
                      ))
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: myCubit.lectureModel!.data!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: MyCard(
                            startTime: myCubit
                                .lectureModel!.data![index].lectureStartTime
                                .toString(),
                            endTime: myCubit
                                .lectureModel!.data![index].lectureEndTime
                                .toString(),
                            lectureDate: myCubit
                                .lectureModel!.data![index].lectureDate
                                .toString(),
                            subject: myCubit
                                .lectureModel!.data![index].lectureSubject
                                .toString(),
                          ),
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
