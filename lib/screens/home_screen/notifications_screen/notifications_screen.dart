import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/utilities/constants.dart';
import 'package:trava/widgets/buttons/back_button.dart';

enum NotificationType {
  funded,
  paid,
  goingYourWay,
  deliver,
  readyToPickup,
  pickedUp,
  delivered,
  timeToPickup,
}

class NotificationsScreen extends StatelessWidget {
  static const routeName = '/notifications';
  const NotificationsScreen({Key? key}) : super(key: key);

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
                  Text("Notifications",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                "12-05-2021",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    NotificationType notificationType = NotificationType.values[
                        Random().nextInt(NotificationType.values.length)];
                    switch (notificationType) {
                      case NotificationType.funded:
                        return const FundedNotificationTile();
                      case NotificationType.paid:
                        return const PaidNotificationTile();
                      case NotificationType.goingYourWay:
                        return const GoingYourWayNotificationTile();
                      default:
                        return const FundedNotificationTile();
                    }
                  },
                ),
              )
            ],
          ),
        ),
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
        children: [
          const Icon(Icons.arrow_circle_down),
          SizedBox(width: 16.w),
          Column(
            children: [
              Flexible(
                child: RichText(
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
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  NotificationButton(
                    backgroundColor: const Color(0xffF45050).withOpacity(0.1),
                    textColor: kRed,
                    onTap: () {},
                    text: 'Ignore',
                  ),
                  SizedBox(width: 30.w),
                  NotificationButton(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    onTap: () {},
                    text: "I’ll deliver package",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
          padding: EdgeInsets.symmetric(vertical: 6.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: backgroundColor,
          ),
          child: Center(
            child: Text(
              text,
              style:
                  Theme.of(context).textTheme.headline3!.copyWith(color: kRed),
            ),
          ),
        ),
      ),
    );
  }
}

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
