import 'package:orange_black_board/view/reusable/button.dart';
import 'package:orange_black_board/view/reusable/text_form_field.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController noteController = TextEditingController();
    return Scaffold(
      appBar:  AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.deepOrange),
          title: const Text(
            'Notes',
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children:   [
            MyTextFormField(control:noteController,showText: false,textFormFieldLabel: 'What\'s on your mind?',size: const EdgeInsets.fromLTRB(10,10,0,150),),
            const MyButton(mywidth: 0.9, color: Colors.deepOrange, buttonName: 'Submit', textColor: Colors.white, myheight: 50,function: null,)
          ],
        ),
      )),
    );
  }
}