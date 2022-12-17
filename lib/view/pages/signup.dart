import 'package:orange_black_board/view/pages/home.dart';
import 'package:orange_black_board/view/reusable/button.dart';
import 'package:orange_black_board/view/reusable/genderbutton.dart';
import 'package:orange_black_board/view/reusable/text_form_field.dart';
import 'package:orange_black_board/view_model/bloc/log/log_Cubit.dart';
import 'package:orange_black_board/view_model/bloc/log/log_states.dart';
import 'package:orange_black_board/view_model/bloc/register/register_cubit.dart';
import 'package:orange_black_board/view_model/bloc/register/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            RegisterCubit myCubit = RegisterCubit.get(context);
            return SafeArea(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(image: AssetImage('assets/images/logo.png')),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                  MyTextFormField(
                    control: nameController,
                    showText: false,
                    textFormFieldLabel: 'Name',
                  ),
                  MyTextFormField(
                    control: emailController,
                    showText: false,
                    textFormFieldLabel: 'E-mail',
                  ),
                  MyTextFormField(
                    control: passwordController,
                    showText: myCubit.isPressed,
                    textFormFieldLabel: 'Password',
                    textFormFieldIcon: InkWell(
                      onTap: () {
                        myCubit.showPassword();
                      },
                      child: Icon(
                        myCubit.isPressed
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  MyTextFormField(
                    control: phoneController,
                    showText: false,
                    textFormFieldLabel: 'Phone Number',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Gender',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.black54,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MyGenderButton(
                                  icon: Icons.male,
                                  mywidth: 0.4,
                                  color: myCubit.maleIsPressed == false
                                      ? Colors.white
                                      : Colors.deepOrange,
                                  buttonName: 'Male',
                                  textColor: myCubit.maleIsPressed == false
                                      ? Colors.deepOrange
                                      : Colors.white,
                                  myheight: 40,
                                  function: () {
                                    myCubit.maleGenderButton();
                                  }),
                              MyGenderButton(
                                  icon: Icons.female,
                                  mywidth: 0.4,
                                  color: myCubit.femaleIsPressed == false
                                      ? Colors.white
                                      : Colors.deepOrange,
                                  buttonName: 'Female',
                                  textColor: myCubit.femaleIsPressed == false
                                      ? Colors.deepOrange
                                      : Colors.white,
                                  myheight: 40,
                                  function: () {
                                    myCubit.femaleGenderButton();
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: MyButton(
                          function: () {
                            myCubit.registerNewAccount(context,
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phoneNumber: phoneController.text,
                                gender: myCubit.genderString);
                          },
                          mywidth: 0.9,
                          color: Colors.deepOrange,
                          buttonName: 'Sign Up',
                          textColor: Colors.white,
                          myheight: 50),
                    ),
                  ),
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
