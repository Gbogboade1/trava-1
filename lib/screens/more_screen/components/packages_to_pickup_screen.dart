import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trava/widgets/buttons/back_button.dart';

class PackagesToPickUpScreen extends StatelessWidget {
  static const routeName = '/packages-to-pick-up';
  const PackagesToPickUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 27.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  const Spacer(),
                  Text("Package(s) to pickup",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    //List of tp pickup packages sorted by date
                    children: List.generate(
                      2,
                      (index) =>
                          const PackagesToPickUpPerDay(), // would take a date and a list of packages for that day.
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PackagesToPickUpPerDay extends StatelessWidget {
  const PackagesToPickUpPerDay({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "12-05-2021",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primaryVariant,
          ),
        ),
        SizedBox(height: 8.h),
        ...List.generate(
          5,
          (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.0.h),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SvgPicture.asset(
                  'assets/images/baggage.svg',
                ),
                SizedBox(width: 17.w),
                Flexible(
                  child: Text(
                    "You’re to pickup Package (154) to be delivered at DHL Hub, Asaba, Delta State on 28-03-2021. by 5:00 pm today.  Payment code is 23940875.",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: const Color(0xff171718),
                        ),
                  ),
                ),
              ]),
            );
            //  return const PaidNotificationTile();
          },
        ),
      ],
    );
  }
}
