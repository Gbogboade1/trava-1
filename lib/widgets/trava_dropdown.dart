import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/utils/constants.dart';

class TravaDropdown extends StatelessWidget {
  final ValueNotifier<SelectionData?> value;
  final ValueChanged<SelectionData?> onChanged;
  final String hint;
  final List<SelectionData> items;
  const TravaDropdown({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffefefef).withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: DropdownButton<SelectionData>(
        focusColor: Colors.white,
        isExpanded: true,
        value: value.value,
        underline: const SizedBox(),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: kGray4,
        ),
        //elevation: 5,
        style: const TextStyle(color: Colors.white),
        items: items.map<DropdownMenuItem<SelectionData>>((SelectionData data) {
          return DropdownMenuItem<SelectionData>(
            value: data,
            child: Text(
              data.title,
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
