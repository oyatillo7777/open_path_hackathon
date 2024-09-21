import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final bool? elips;
  final int? maxLines;

  const TextWidget({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.fontWeight, this.elips, this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? Colors.black,
      ),
      maxLines:maxLines?? 2,
      overflow: elips == true ? TextOverflow.ellipsis : null,
    );
  }
}
