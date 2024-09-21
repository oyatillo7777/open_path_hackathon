import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_path_hackathon/widget/sized_box.dart';
import 'package:open_path_hackathon/widget/text_widget.dart';

import '../tools/app_colors.dart';

class DropdownWidget extends StatefulWidget {
  final List<String> items;
  final String initialValue;
  final ValueChanged<String?> onChanged;
  final bool? visibility;
  final String? label;

  const DropdownWidget({
    required this.items,
    required this.initialValue,
    required this.onChanged,
    super.key,
    this.visibility,
    this.label,
  });

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.visibility ?? true,
          child: Column(
            children: [
              TextWidget(
                text: widget.label ?? "",
                color: Colors.black,
                size: 14.sp,
              ),
              const Hg(),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.borderColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    _selectedValue = newValue!;
                  });
                  widget.onChanged(newValue);
                },
                items:
                    widget.items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
