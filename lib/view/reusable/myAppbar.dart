import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  const MyAppBar({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.deepOrange),
        title:  Text(title,style: const TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
      );
  }
}