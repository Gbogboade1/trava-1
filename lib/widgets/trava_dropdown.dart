import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/utilities/constants.dart';

class TravaDropdown extends StatelessWidget {
  const TravaDropdown({
    Key? key,
    required this.value,
    required this.onChanged, required this.hint,
  }) : super(key: key);
  final String? value;
  final ValueChanged<String?> onChanged;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffefefef).withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: DropdownButton<String>(
        focusColor: Colors.white,
        isExpanded: true,
        value: value,
        underline: const SizedBox(),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: kGray4,
        ),
        //elevation: 5,
        style: const TextStyle(color: Colors.white),

        items: <String>[
          'A',
          'B',
          'C',
          'D',
          'E',
          'F',
          'G',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        hint: Text(
          hint,
          style: TextStyle(
              color: kGray3, fontSize: 12.sp, fontWeight: FontWeight.w300),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
