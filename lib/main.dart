import 'package:orange_black_board/view/pages/bottomNavBarScreens.dart';
import 'package:orange_black_board/view/pages/home.dart';
import 'package:orange_black_board/view/pages/lectures.dart';
import 'package:orange_black_board/view/pages/login_screen.dart';
import 'package:orange_black_board/view/pages/settings.dart';
import 'package:orange_black_board/view/pages/signup.dart';
import 'package:orange_black_board/view/pages/support.dart';
import 'package:orange_black_board/view_model/database/network/cache_helper.dart';
import 'package:orange_black_board/view_model/database/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  String? token = CacheHelper.getData(key: 'token');
  token ??= '';
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String token;
  const MyApp({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: token == ''? LogIn():const BottomNavBarScreens(),

      // in order to remove the white screen at the bggining of the app
      //you need to add a splash screen but in the native android not in the flutter
      // appBar: AppBar(
      //   title: const Text('Home'),
      //   leading: const Icon(Icons.arrow_back),
      //   centerTitle: true,
      // ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: const [Icon(Icons.ac_unit), Icon(Icons.ac_unit)],
      //     ),
      //     Column(children: const [Icon(Icons.ac_unit)])
      //   ],
      // ),
      // drawer:,
      // bottomNavigationBar: ,
      // floatingActionButton: ,
      // endDrawer: ,
    );
  }
}
