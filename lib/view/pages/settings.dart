import 'package:orange_black_board/view/pages/faq.dart';
import 'package:orange_black_board/view/pages/login_screen.dart';
import 'package:orange_black_board/view/pages/ourPartners.dart';
import 'package:orange_black_board/view/pages/support.dart';
import 'package:orange_black_board/view/pages/termsAndConditions.dart';
import 'package:orange_black_board/view/reusable/settings_button.dart';
import 'package:flutter/material.dart';
import 'package:orange_black_board/view_model/database/network/cache_helper.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white10,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          SettingsButton(
            buttonText: 'FAQ',
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FaqScreen(),
                  ));
            },
          ),
          SettingsButton(
            buttonText: 'Term & Conditions',
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsScreen(),
                  ));
            },
          ),
          SettingsButton(
            buttonText: 'Our Partners',
            function:  () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OurPartnersScreen(),
                  ));}
          ),
          SettingsButton(
            buttonText: 'Support',
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SupportPage(),
                  ));
            },
          ),
          SettingsButton(
            buttonText: 'Log Out',
            function: (){
              CacheHelper.clearToken(key: 'token');
              Navigator.push(context, MaterialPageRoute(builder: (context) =>LogIn() ,));
            },
          )
        ],
      )),
    );
  }
}
