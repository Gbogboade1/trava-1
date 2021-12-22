
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/style/colors.dart';

class MoreListTile extends StatelessWidget {
  const MoreListTile({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyText1!.copyWith(color: TravaColors.black)),
      contentPadding: EdgeInsets.zero,
      trailing: Icon(Icons.arrow_forward_ios,
          color: const Color(0xff4F4F4F), size: 10.h),
    );
  }
}
