import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 400.w,
                  height: 300,
                  child: Image.asset("assets/logo.png"),
                ),
                const Hg(),
                const PostInput(
                  label: "Login",
                  inputWidth: double.infinity,
                ),
                const Hg(
                  height: 30,
                ),
                const PostInput(
                  label: "Parol",
                  inputWidth: double.infinity,
                ),
                const Hg(
                  height: 50,
                ),
                const MobileButton(
                  color: Color(0xff2C2C2C),
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
                        Get.off(const CreateScreen());
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
      ),
    );
  }
}
