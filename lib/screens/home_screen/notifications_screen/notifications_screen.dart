import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/home_screen/notifications_screen/components/notification_tile.dart';
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
                      case NotificationType.readyToPickup:
                        return const ReadyToPickUpNotificationTile();
                      default:
                        return const FundedNotificationTile();
                    }

                    //  return const PaidNotificationTile();
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
