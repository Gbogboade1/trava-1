
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    Key? key,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: backgroundColor,
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
