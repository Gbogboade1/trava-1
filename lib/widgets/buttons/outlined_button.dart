import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TravaOutlinedButton extends StatelessWidget {
  const TravaOutlinedButton({
    Key? key,
    required this.buttonLabel,
    
    this.onTap,
  }) : super(key: key);

  final String buttonLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          decoration: BoxDecoration(
            // color: isActive? Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.primaryVariant,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1.w,
            ),
          ),
          child: Center(
            child: Text(
              buttonLabel,
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          )),
    );
  }
}
