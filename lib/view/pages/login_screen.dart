import 'package:orange_black_board/view/pages/home.dart';
import 'package:orange_black_board/view/pages/signup.dart';
import 'package:orange_black_board/view/reusable/button.dart';
import 'package:orange_black_board/view/reusable/text_form_field.dart';
import 'package:orange_black_board/view_model/bloc/log/log_Cubit.dart';
import 'package:orange_black_board/view_model/bloc/log/log_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(image: AssetImage('assets/images/logo.png')),
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    MyTextFormField(
                      control: emailController,
                      showText: false,
                      textFormFieldLabel: 'E-mail',
                      textFormFieldIcon: null,
                    ),
                    BlocConsumer<LogInCubit, LogInState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        LogInCubit myCubit = LogInCubit.get(context);
                        return MyTextFormField(
                            control: passwordController,
                            showText: myCubit.isPressed,
                            textFormFieldLabel: 'Password',
                            textFormFieldIcon: IconButton(
                              onPressed: () {
                                myCubit.showPassword();
                              },
                              icon: Icon(
                                myCubit.isPressed
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off,
                                color: Colors.deepOrange,
                              ),
                            ));
                      },
                    ),
                    const InkWell(
                        onTap: null,
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.deepOrange,
                              decoration: TextDecoration.underline),
                        )),
                    BlocConsumer<LogInCubit, LogInState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        LogInCubit myCubit = LogInCubit.get(context);
                        return MyButton(
                            mywidth: 0.9,
                            color: Colors.deepOrange,
                            buttonName: 'Log In',
                            textColor: Colors.white,
                            function: () {
                              myCubit.logIn(context,
                                  email: emailController.text,
                                  password: passwordController.text);
                            },
                            myheight: 50);
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: const Divider(
                            color: Colors.deepOrange,
                            thickness: 1,
                          ),
                        )),
                        const Text(
                          'OR',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: const Divider(
                            color: Colors.deepOrange,
                            thickness: 1,
                          ),
                        )),
                      ],
                    ),
                    MyButton(
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  SignUp()));
                        },
                        mywidth: 0.9,
                        color: Colors.white,
                        buttonName: 'Sign up',
                        textColor: Colors.deepOrange,
                        myheight: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
