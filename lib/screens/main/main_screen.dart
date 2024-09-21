import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_path_hackathon/screens/chat/chat_screen.dart';
import 'package:open_path_hackathon/screens/homework/homework.dart';
import 'package:open_path_hackathon/screens/main/list_title.dart';
import 'package:open_path_hackathon/tools/app_colors.dart';
import 'package:open_path_hackathon/widget/text_filed.dart';

import '../../widget/sized_box.dart';
import '../../widget/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List img = [
    "assets/boy.jpg",
    "assets/men.png",
    "assets/men.png",
  ];
  List lesson = [
    "assets/lesson.jpg",
    "assets/room.png",
    "assets/room.png",
  ];
  List txt = [
    "RTM",
    "Najot ta'lim",
    "iTeach",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Hg(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/logo.png'),
                  ),
                  const Expanded(
                    child: PostInput(
                      visible: false,
                      hintText: "Qidiruv",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      Get.to(ChatScreen());
                    },
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  )
                ],
              ),
              const Hg(
                height: 39,
              ),
              Row(
                children: [
                  TextWidget(
                    text: "Hi, Ali",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    size: 22.sp,
                  ),
                ],
              ),
              TextWidget(
                text: "",
                color: Colors.grey,
                size: 13.sp,
              ),
              const Hg(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(const HomeworkScreen());
                        },
                        child: Container(
                          width: double.infinity,
                          height: 130,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  text: "There is homework",
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                                Image.asset('assets/homework.png')
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Hg(
                        height: 30,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                text: "Lessons",
                                size: 13.sp,
                              ),
                              TextWidget(
                                text: "Everything",
                                size: 13.sp,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                          const Hg(
                            height: 17,
                          ),
                          SizedBox(
                            height: 196,
                            child: ListView.builder(
                              itemCount: lesson.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ListTitleWidget(
                                    img: lesson[index],
                                    txtTitle: "Ona tili",
                                    txtPlace: "Farg'ona",
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const Hg(
                        height: 30,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                text: "Therapies and support services",
                                size: 13.sp,
                              ),
                              TextWidget(
                                text: "Everything",
                                size: 13.sp,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                          const Hg(
                            height: 17,
                          ),
                          SizedBox(
                            height: 146,
                            child: ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ListTitleWidget(
                                    img: img[index],
                                    txtTitle: '',
                                    txtPlace: '',
                                    color:
                                        index == 0 ? Colors.grey : Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
