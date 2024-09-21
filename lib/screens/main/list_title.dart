import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_path_hackathon/widget/text_widget.dart';


class ListTitleWidget extends StatelessWidget {
  final String img;
  final String txtTitle;
  final String txtPlace;
  final Color? color;

  const ListTitleWidget(
      {super.key,
        required this.img,
        required this.txtTitle,
        required this.txtPlace, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
          ]
      ),
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                img,
                fit: BoxFit.fill,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextWidget(
                  text: txtTitle,
                  size: 16.sp,
                  color:color?? Colors.black,
                  elips: true,
                ),
                TextWidget(
                  text: txtPlace,
                  size: 14.sp,
                  color: Colors.grey,
                  elips: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
