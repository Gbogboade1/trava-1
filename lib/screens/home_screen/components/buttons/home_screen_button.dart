import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenButton extends StatelessWidget {
  const HomeScreenButton({
    Key? key,
    this.color,
    this.onTap,
    required this.buttonLabel,
  }) : super(key: key);
  final Color? color;
  final VoidCallback? onTap;
  final String buttonLabel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: color ?? Theme.of(context).colorScheme.primaryVariant,
          ),
          child: Center(
            child: Text(
              buttonLabel,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
