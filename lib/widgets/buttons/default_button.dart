import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.buttonLabel,
    required this.isActive,
    this.onTap,
  }) : super(key: key);

  final String buttonLabel;
  final VoidCallback? onTap;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          decoration: BoxDecoration(
            color: isActive? Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.primaryVariant,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1.4, 3),
                  blurRadius: 7.0,
                  color: const Color(0xff17123B).withOpacity(0.1)),
            ],
          ),
          child: Center(
            child: Text(
              buttonLabel,
              style: Theme.of(context).textTheme.button,
            ),
          )),
    );
  }
}
