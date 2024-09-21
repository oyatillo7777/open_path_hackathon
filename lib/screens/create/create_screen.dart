import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                  const Hg(),
                  const PostInput(
                    label: "Name",
                    inputWidth: double.infinity,
                  ),
                  const Hg(
                    height: 20,
                  ),
                  const PostInput(
                    label: "Sourname",
                    inputWidth: double.infinity,
                  ),
                  const Hg(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(text: "Date of birth"),
                      Hg(
                        height: 8.h,
                      ),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.borderColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: DateTimeFormField(
                          decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          firstDate:
                              DateTime.now().add(const Duration(days: 10)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 40)),
                          initialPickerDateTime:
                              DateTime.now().add(const Duration(days: 20)),
                          onChanged: (DateTime? value) {
                            selectedDate = value;
                          },
                        ),
                      ),
                    ],
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
                          SizedBox(
                            height: 250,
                            child: Image.asset('assets/password.png'),
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
                          SizedBox(
                            height: 250,
                            child: Image.asset('assets/doc.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Hg(
                    height: 20,
                  ),
                   MobileButton(
                    onTap: (){
                      Get.off(HomePage());
                    },
                    fontSize: 18,
                    width: double.infinity,
                    color: Color(0xffFD4C00),
                    label: "Continue",
                    labelFontWight: FontWeight.w500,
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
}
