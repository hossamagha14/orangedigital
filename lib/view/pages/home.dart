import 'package:orange_black_board/view/pages/events.dart';
import 'package:orange_black_board/view/pages/finalExam.dart';
import 'package:orange_black_board/view/pages/lectures.dart';
import 'package:orange_black_board/view/pages/midTermExam.dart';
import 'package:orange_black_board/view/pages/notes.dart';
import 'package:orange_black_board/view/pages/sections.dart';
import 'package:orange_black_board/view/reusable/mycontainer.dart';
import 'package:orange_black_board/view_model/bloc/home/home_cubit.dart';
import 'package:orange_black_board/view_model/bloc/home/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              HomeCubit myCubit = HomeCubit.get(context);
              return Column(
                children: [
                  const Image(image: AssetImage('assets/images/logo.png')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyContainer(
                        containerSVG: 'lecture',
                        containerTitle: 'Lectures',
                        function: () {
                          // myCubit.getLectures(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Lectures()));
                        },
                      ),
                      MyContainer(
                        containerSVG: 'sections',
                        containerTitle: 'Sections',
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Sections()));
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       MyContainer(
                        containerSVG: 'midterm',
                        containerTitle: 'Midterms',
                        function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MidExams(),
                                ));
                          },
                      ),
                      MyContainer(
                          containerSVG: 'final',
                          containerTitle: 'Finals',
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FinalExam(),
                                ));
                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyContainer(
                          containerSVG: 'event',
                          containerTitle: 'Events',
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EventsPage(),
                                ));
                          }),
                      MyContainer(
                          containerSVG: 'notes',
                          containerTitle: 'Notes',
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NotesPage(),
                                ));
                          })
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
