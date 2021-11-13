
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/home_screen/send_packages_screen/send_packages_screen.dart';

class SendPackagesButton extends StatelessWidget {
  const SendPackagesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () => Navigator.of(context)
                            .pushNamed(SendPackagesScreen.routeName),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0.w,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          borderRadius: BorderRadius.circular(40.0),
          // color: color ?? Theme.of(context).colorScheme.primaryVariant,
        ),
        child: Center(
          child: Text(
            "Send Package(s)",
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
