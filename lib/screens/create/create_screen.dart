import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_path_hackathon/bloc/create/create_bloc.dart';
import 'package:open_path_hackathon/screens/login/login_screen.dart';
import 'package:open_path_hackathon/screens/main/main_screen.dart';
import 'package:open_path_hackathon/tools/app_colors.dart';

import '../../widget/button.dart';
import '../../widget/drop_down.dart';
import '../../widget/sized_box.dart';
import '../../widget/text_filed.dart';
import '../../widget/text_widget.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final String _selectedValue = "Ko'zi ojizlar";
  DateTime? selectedDate;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtSourName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400.w,
                    height: 250,
                    child: Image.asset("assets/logo.png"),
                  ),
                  Hg(),
                  PostInput(
                    controller: txtName,
                    label: "Name",
                    inputWidth: double.infinity,
                  ),
                  const Hg(
                    height: 20,
                  ),
                  PostInput(
                    controller: txtSourName,
                    label: "UserName",
                    inputWidth: double.infinity,
                  ),
                  const Hg(
                    height: 20,
                  ),
                  PostInput(
                    controller: txtPhone,
                    label: "Phone number",
                    inputWidth: double.infinity,
                  ),
                  const Hg(
                    height: 20,
                  ),
                  PostInput(
                    controller: txtPassword,
                    label: "Password",
                    inputWidth: double.infinity,
                  ),
                  const Hg(
                    height: 20,
                  ),
                  DropdownWidget(
                    label: 'Which group of disabilities',
                    items: const [
                      "Ko'zi ojizlar",
                      'Gapra olmaydigonlar',
                    ],
                    initialValue: _selectedValue,
                    onChanged: (String? value) {},
                  ),
                  const Hg(
                    height: 20,
                  ),
                  Column(
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Enter your passport",
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      const Hg(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              getProductImage();
                            },
                            child: SizedBox(
                              height: 250,
                              child: productImage == null
                                  ? Image.asset('assets/password.png')
                                  : Image.file(
                                      File(
                                        productImage!.path!,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Hg(
                    height: 20,
                  ),
                  Column(
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Certificate and photo",
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      const Hg(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              getProductImage();
                            },
                            child: SizedBox(
                              height: 250,
                              child: productImage == null
                                  ? Image.asset('assets/doc.png')
                                  : Image.file(
                                      File(
                                        productImage!.path!,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Hg(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MobileButton(
                        onTap: () {
                          Get.offAll(LoginScreen());
                        },
                        fontSize: 18,
                        color: const Color(0xffFD4C00),
                        label: "Back",
                        labelFontWight: FontWeight.w500,
                      ),
                      const Wd(),
                      MobileButton(
                        onTap: () {
                          context.read<CreateBloc>().add(
                                CreateEvent.create(
                                  txtName.text,
                                  txtPhone.text,
                                  txtSourName.text,
                                  txtPassword.text,
                                  productImage,
                                ),
                              );
                        },
                        fontSize: 18,
                        color: Colors.green,
                        label: "Continue",
                        labelFontWight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const Hg(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PlatformFile? productImage;

  Future<void> getProductImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'wav',
          'mpeg',
          'mp4',
          'mov',
          'png',
          'jpeg',
        ],
      );

      if (result != null) {
        setState(() {
          productImage = result.files.single;
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error picking document: $error');
      }
    }
  }
}
