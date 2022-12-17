import 'package:orange_black_board/view/reusable/button.dart';
import 'package:orange_black_board/view/reusable/text_form_field.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController supportController = TextEditingController();
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.deepOrange),
          title: const Text(
            'Support',
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children:   [
            MyTextFormField(control: emailController,showText: false,textFormFieldLabel: 'Name',preTextFormFieldIcon: Icon(Icons.person,),),
            MyTextFormField(control: nameController,showText: false,textFormFieldLabel: 'E-mail',preTextFormFieldIcon: Icon(Icons.mail,),),
            MyTextFormField(control:supportController,showText: false,textFormFieldLabel: 'What\'s making you unhappy?',size: EdgeInsets.fromLTRB(10,10,0,150),),
            const MyButton(mywidth: 0.9, color: Colors.deepOrange, buttonName: 'Submit', textColor: Colors.white, myheight: 50,function: null,)
          ],
        ),
      )),
    );
  }
}