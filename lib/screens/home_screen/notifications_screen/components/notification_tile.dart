import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/bottom_sheet/deliver_package_bottom_sheet.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/bottom_sheet/ready_to_pick_up_bottom_sheet.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/notification_button.dart';
import 'package:trava/style/colors.dart';

class PaidNotificationTile extends StatelessWidget {
  const PaidNotificationTile(
    this.desc, {
    Key? key,
  }) : super(key: key);
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          SvgPicture.asset("assets/images/withdrawal.svg"),
          SizedBox(width: 7.w),
          Flexible(
            child: Text(
              desc,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: const Color(0xff171718),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class FundedNotificationTile extends StatelessWidget {
  const FundedNotificationTile(
    this.desc, {
    Key? key,
  }) : super(key: key);
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          SvgPicture.asset("assets/images/fund.svg"),
          SizedBox(width: 7.w),
          Flexible(
            child: Text(
              desc,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: const Color(0xff171718),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class GoingYourWayNotificationTile extends StatelessWidget {
  const GoingYourWayNotificationTile(
    this.desc, {
    Key? key,
  }) : super(key: key);

  final String desc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset("assets/images/speaker.svg"),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: desc,
                      ),
                      TextSpan(
                        text: "See Details",
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              fontSize: 12.sp,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ],
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: const Color(0xff171718),
                        ),
                  ),
                ),
                SizedBox(height: 2.h),
                // Row(
                //   children: [
                //     NotificationButton(
                //       backgroundColor: const Color(0xffF45050).withOpacity(0.1),
                //       textColor: TravaColors.red,
                //       onTap: () {},
                //       text: 'Ignore',
                //     ),
                //     SizedBox(width: 30.w),
                //     NotificationButton(
                //       backgroundColor: Theme.of(context).colorScheme.primary,
                //       textColor: Colors.white,
                //       onTap: () {
                //         showModalBottomSheet(
                //           isScrollControlled: true,
                //           backgroundColor: Colors.transparent,
                //           context: context,
                //           builder: (context) =>
                //               const DeliverPackageBottomSheet(),
                //         );
                //       },
                //       text: "I’ll deliver package",
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReadyToPickUpNotificationTile extends StatelessWidget {
  const ReadyToPickUpNotificationTile(
    this.desc, {
    Key? key,
  }) : super(key: key);
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset("assets/images/speaker.svg"),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  desc,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: TravaColors.black,
                      ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
