import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_path_hackathon/screens/main/main_screen.dart';
import 'package:provider/provider.dart'; // Make sure you have this if you're using Provider
import 'package:open_path_hackathon/bloc/login/login_bloc.dart';
import 'package:open_path_hackathon/screens/create/create_screen.dart';
import 'package:open_path_hackathon/widget/text_widget.dart';

import '../../widget/button.dart';
import '../../widget/sized_box.dart';
import '../../widget/text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtUserName = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (BuildContext context, LoginState kattaState) {
          kattaState.maybeWhen(
            success: (s) {
              Get.offAll(() => const HomePage());
            },
            error: (error) {
              Get.snackbar("Login Error", error, snackPosition: SnackPosition.BOTTOM);
            },
            orElse: () {
            },
          );
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (BuildContext context, LoginState state) {
            return state.when(
              initial: () {
                return SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(15.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 400.w,
                            height: 300,
                            child: Image.asset("assets/logo.png"),
                          ),
                          const Hg(),
                          PostInput(
                            controller: txtUserName,
                            label: "Login",
                            inputWidth: double.infinity,
                          ),
                          const Hg(
                            height: 30,
                          ),
                          PostInput(
                            controller: txtPassword,
                            label: "Password",
                            inputWidth: double.infinity,
                          ),
                          const Hg(
                            height: 50,
                          ),
                          MobileButton(
                            onTap: () {
                              // Trigger login event
                              context.read<LoginBloc>().add(
                                LoginEvent.getToken(
                                  txtUserName.text,
                                  txtPassword.text,
                                ),
                              );
                            },
                            color: const Color(0xff2C2C2C),
                            width: double.infinity,
                            label: "Sign In",
                          ),
                          const Hg(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextWidget(
                                text: "Forgot password?",
                                fontWeight: FontWeight.w600,
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigate to create new account screen
                                  Get.off(() => const CreateScreen());
                                },
                                child: const TextWidget(
                                  text: "New account",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              loading: () {
                return Center(
                  child: const CircularProgressIndicator.adaptive(),
                );
              },
              success: (success) {
                return const SizedBox(); // Success handled in the listener
              },
              error: (error) {
                return Center(
                  child: TextWidget(text: error),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
