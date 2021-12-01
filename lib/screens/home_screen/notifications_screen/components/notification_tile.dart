import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          const Icon(Icons.arrow_circle_down),
          SizedBox(width: 16.w),
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
          const Icon(Icons.arrow_circle_down),
          SizedBox(width: 16.w),
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
          const Icon(Icons.arrow_circle_down),
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

class DeliverPackageBottomSheet extends StatelessWidget {
  const DeliverPackageBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: SizedBox(
          height: 584.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  //width: 32.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 20.h,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(24.w, 15.h, 24.w, 25.h),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headline2,
                          children: [
                            const TextSpan(text: "Package 023 Details "),
                            TextSpan(
                              text: "(₦1,570)",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    fontSize: 16.sp,
                                    color: TravaColors.red,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        height: 146.h,
                        width: 241.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Package Description",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: TravaColors.gray3,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "Two boxes of sophisticated wine. A box contain 8 bottles.",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
