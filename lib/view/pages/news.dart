import 'package:orange_black_board/view_model/bloc/home/home_cubit.dart';
import 'package:orange_black_board/view_model/bloc/home/home_states.dart';
import 'package:orange_black_board/view_model/bloc/settings/settings_cubit.dart';
import 'package:orange_black_board/view_model/bloc/settings/settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllNews(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.deepOrange),
          title: const Text(
            'News',
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit myCubit = HomeCubit.get(context);
            return myCubit.newsModel == null
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                  ))
                : ListView.builder(
                    itemCount: myCubit.newsModel!.data!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        color: Colors.grey.shade100,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Stack(children: [
                          Image(
                            image: NetworkImage(myCubit
                                .newsModel!.data![index].imageUrl
                                .toString()),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    myCubit.newsModel!.data![index].title
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius:BorderRadius.circular(15) 
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            myCubit.newsModel!.data![index].body
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Date: ${myCubit.newsModel!.data![index].date
                                                .toString()}',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
