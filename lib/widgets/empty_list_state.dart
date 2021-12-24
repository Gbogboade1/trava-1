import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyListState extends StatelessWidget {
  const EmptyListState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 140.w,
          width: 180.w,
        ),
        SizedBox(height: 15.h),
        Text("There is nothing to see here YET",
            style: Theme.of(context).textTheme.headline5),
        SizedBox(height: 9.h),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyText2,
                children: [
                  const TextSpan(text: "Start using Trava today by  "),
                  TextSpan(
                    text: "Sending a package",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  const TextSpan(text: " or "),
                  TextSpan(
                    text: "Delivering a package",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ]))
      ],
    );
  }
}
