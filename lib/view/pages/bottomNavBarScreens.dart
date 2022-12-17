import 'package:orange_black_board/view_model/bloc/home/home_cubit.dart';
import 'package:orange_black_board/view_model/bloc/home/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBarScreens extends StatelessWidget {
  const BottomNavBarScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit myCubit = HomeCubit.get(context);
          return Scaffold(
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: GNav(
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.announcement,
                    text: 'News',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                  
                ],
                activeColor: Colors.white,
                hoverColor: Colors.deepOrange.shade50,
                rippleColor: Colors.deepOrange.shade200,
                color: Colors.deepOrange,
                tabBorderRadius: 50,
                iconSize: 23,
                tabBackgroundColor: Colors.deepOrange,
                selectedIndex: myCubit.currentIndex,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                onTabChange: (index) {
                  myCubit.changeBottomNavBar(index);
                },
              ),
            ),
            body: myCubit.bottomNavBarScreens[myCubit.currentIndex],
          );
        },
      ),
    );
  }
}
