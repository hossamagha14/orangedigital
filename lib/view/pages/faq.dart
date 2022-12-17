import 'package:orange_black_board/view_model/bloc/settings/settings_cubit.dart';
import 'package:orange_black_board/view_model/bloc/settings/settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit()..getFaq(),
      child: Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.deepOrange),
          title: const Text(
            'FAQ',
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocConsumer<SettingsCubit, SettingsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            SettingsCubit myCubit = SettingsCubit.get(context);
            return myCubit.faqModel == null
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                  ))
                : ListView.builder(
                    itemCount: myCubit.faqModel!.data!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Card(
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                myCubit.faqModel!.data![index].question
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                myCubit.faqModel!.data![index].answer
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
