import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/bottom_sheet/deliver_package_bottom_sheet.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/bottom_sheet/ready_to_pick_up_bottom_sheet.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/notification_button.dart';
import 'package:trava/style/colors.dart';

class PaidNotificationTile extends StatelessWidget {
  const PaidNotificationTile({
    Key? key,
  }) : super(key: key);

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
              "You paid ₦1,570 to send your package (023) with to Timi Akinlaja to DHL Hub, Asaba, Delta State at 12:02pm",
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
  const FundedNotificationTile({
    Key? key,
  }) : super(key: key);

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
              "You funded your Trava wallet ₦1,570 at 12:02pm",
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
  const GoingYourWayNotificationTile({
    Key? key,
  }) : super(key: key);

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
                      const TextSpan(
                          text:
                              "Package (154) is going your way on 28-03-2021 and it is be delivered at DHL Hub, Asaba, Delta State. You’ll be paid ₦1,570 after successful delivery. "),
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
                SizedBox(height: 16.h),
                Row(
                  children: [
                    NotificationButton(
                      backgroundColor: const Color(0xffF45050).withOpacity(0.1),
                      textColor: TravaColors.red,
                      onTap: () {},
                      text: 'Ignore',
                    ),
                    SizedBox(width: 30.w),
                    NotificationButton(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      textColor: Colors.white,
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) =>
                              const DeliverPackageBottomSheet(),
                        );
                      },
                      text: "I’ll deliver package",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReadyToPickUpNotificationTile extends StatelessWidget {
  const ReadyToPickUpNotificationTile({
    Key? key,
  }) : super(key: key);

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
                  "Aladetimi Tolu is ready to pickup Package (154) to be delivered at DHL Hub, Asaba, Delta State on 28-03-2021.",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: TravaColors.black,
                      ),
                ),
                SizedBox(height: 16.h),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) =>
                          const ReadyToPickUpPackageBottomSheet(),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Center(
                      child: Text(
                        "Pay (₦1,570)",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
