
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Selector extends StatelessWidget {
  const Selector({
    Key? key,
    this.value,
    this.groupValue,
    this.onChanged,
  }) : super(key: key);

  final String? value;
  final String? groupValue;
  final ValueChanged<String?>? onChanged;

  bool get isSelected => value == groupValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: isSelected ? 1.0 : 0.8,
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : const Color(0xff828282),
        ),
        shape: BoxShape.circle,
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 12.w,
                height: 12.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}