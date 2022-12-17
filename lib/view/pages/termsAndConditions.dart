import 'package:orange_black_board/view_model/bloc/settings/settings_cubit.dart';
import 'package:orange_black_board/view_model/bloc/settings/settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit()..getTerms(),
      child: BlocConsumer<SettingsCubit, SettingsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SettingsCubit myCubit =SettingsCubit.get(context);
          return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
              backgroundColor: Colors.white,
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.deepOrange),
              title: const Text(
                'Terms and Conditions',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: myCubit.termsModel==null?const Center(child: CircularProgressIndicator(color: Colors.deepOrange,)):Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: SingleChildScrollView(child: Text(myCubit.termsModel!.data!.terms.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)),
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
